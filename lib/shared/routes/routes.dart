// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/exchange/pages/exchange_cylinder_log.dart';
import 'package:amaga/features/exchange/pages/exchange_history.dart';
import 'package:amaga/features/fill/pages/fill_main_page.dart';
import 'package:amaga/features/maintain/pages/maintain_main_page.dart';
import 'package:amaga/features/register/presentation/pages/add_cutomer_page.dart';
import 'package:amaga/features/register/presentation/pages/add_cylinder_page.dart';
import 'package:amaga/features/register/presentation/pages/register_page.dart';
import 'package:amaga/features/tester/pages/tester_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> app_routes = {
  '/createuserpage': (context) => const AddCustomerpage(),
  '/addcylinder': (context) => const AddCylinderPage(),
  '/exchangeEdit': (context) => const ExchangeHistory(),
  '/exchangeLog': (context) => const ExchangeLog(),
  '/testermainpage': (context) => const TesterMainPage(),
  '/registermainpage': (context) => const RegisterPage(),
  '/fillermainpage': (context) => const FillerMainPage(),
  '/maintenmainpage': (context) => const MaintainMainPage(),
};
