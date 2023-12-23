// ignore_for_file: non_constant_identifier_names
import 'package:amaga/features/register/pages/add_cutomer_page.dart';
import 'package:amaga/features/register/pages/add_cylinder_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> app_routes = {
  '/createuserpage': (context) => const AddCustomerpage(),
  '/addcylinder': (context) => const AddCylinderPage(),
};
