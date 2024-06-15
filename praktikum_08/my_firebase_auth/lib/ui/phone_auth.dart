import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_firebase_auth/ui/home_screen.dart'; // Mengimpor HomeScreen yang akan dituju setelah login

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _otpVisibility = false;
  User? _user;
  String _verificationID = "";

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController(); // Membuat _otpController menjadi final

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> loginWithPhone() async {
    if (_phoneController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Nomor telepon tidak valid'),
      ));
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: "+62${_phoneController.text}",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint("Verification failed: ${e.message ?? 'Unknown error'}");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _otpVisibility = true;
          _verificationID = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationID,
      smsCode: _otpController.text,
    );

    await _auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          _user = _auth.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (_user != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Berhasil Login')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Login Gagal')));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Masukkan nomor telepon anda',
                prefix: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text('+62'),
                ),
              ),
            ),
            Visibility(
              visible: _otpVisibility,
              child: TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'OTP',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: const Color(0xff3D4DE0),
              onPressed: () {
                if (_otpVisibility) {
                  verifyOTP();
                } else {
                  loginWithPhone();
                }
              },
              child: Text(
                _otpVisibility ? "Verify" : "Login",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}