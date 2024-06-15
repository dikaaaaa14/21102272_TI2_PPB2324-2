/*import 'package:flutter/material.dart'; 
import 'package:firebase_Auth/ui/home_screen.dart'; 
import 'package:firebase_Auth/ui/login.dart'; 
import 'package:firebase_Auth/ui/register.dart';

MaterialPageRoute _pageRoute(
    {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);

Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;
 
 
  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: const LoginScreen(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: const RegisterScreen(), settings: settings);
    break;
    case rHome:
      _route = _pageRoute(body: const HomeScreen(), settings: settings);
      break;
 }
 return _route;
}
final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rHome = '/home';
