import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:firebase_auth/styles/colors.dart';
import 'package:firebase_auth/styles/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kBgColor.withOpacity(0.5),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 35,
                right: 30,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: kBody1.copyWith(
                              color: kMatterhornBlack,
                            ),
                          ),
                          Text(
                            'Pradika 👏',
                            style: kHeading6.copyWith(
                              color: kMatterhornBlack,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(
                          height: 40,
                          width: 40,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/user-img.png'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kGrey,
                              blurRadius: 5,
                              offset: Offset.fromDirection(2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    constraints: const BoxConstraints.expand(height: 170),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/bg-container.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kGrey,
                          blurRadius: 5,
                          offset: Offset.fromDirection(2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My savings',
                          style: kSubtitle2.copyWith(color: kWhite),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Rp 10.430.000',
                          style: kHeading5.copyWith(
                            color: kWhite,
                          ),
                        ),
                        const SizedBox(height: 10),
                        LinearPercentIndicator(
                          lineHeight: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          progressColor: kEgyptianBlue,
                          percent: 0.3,
                          backgroundColor: kWhite,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Rp. 10.430.000 / Rp. 40.000.000',
                          style: kCaption.copyWith(
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      _transactionButton('assets/icons/save.png', 'Save Money'),
                      const SizedBox(width: 25),
                      _transactionButton('assets/icons/pay.png', 'Pay'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 120),
              child: DraggableScrollableSheet(
                controller: DraggableScrollableController(),
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 21,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Transactions History',
                                    style: kHeading6.copyWith(
                                      color: kLuckyBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 31),
                                _transactionList(
                                  kTreeGreen.withOpacity(0.2),
                                  'assets/icons/triangle-up.png',
                                  'Success!',
                                  'February 19, 03:25 PM',
                                  '+ 100.000',
                                ),
                                _transactionList(
                                  kTreeGreen.withOpacity(0.2),
                                  'assets/icons/triangle-up.png',
                                  'Success!',
                                  'February 16, 01:25 PM',
                                  '+ 150.000',
                                ),
                                _transactionList(
                                  kOrange.withOpacity(0.2),
                                  'assets/icons/triangle-down.png',
                                  'Starbucks Drinks',
                                  'February 10, 12:25 PM',
                                  '- 110.000',
                                ),
                                _transactionList(
                                  kOrange.withOpacity(0.2),
                                  'assets/icons/triangle-down.png',
                                  'Payment #Invest',
                                  'February 5, 11:05 PM',
                                  '- 130.000',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 4,
                            width: 49,
                            color: kEgyptianBlue.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionList(
    Color bgColor, String icon, String title, String sub, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: CircleAvatar(
              backgroundColor: bgColor,
              child: Image(
                image: AssetImage(icon),
                width: 14,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: kBody1.copyWith(color: kLuckyBlue),
              ),
              Text(
                sub,
                style: kCaption.copyWith(
                  color: kLightGray,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: kBody1.copyWith(
              color: kLuckyBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionButton(String icon, String text) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints.expand(
          height: 60,
        ),
        decoration: BoxDecoration(
          color: kNightBlack,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 24,
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: kBody1.copyWith(
                color: kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
