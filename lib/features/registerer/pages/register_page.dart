import 'package:amaga/features/registerer/pages/customer_cylinder_page.dart';
import 'package:amaga/shared/mockdata/customer_list_data.dart';
import 'package:amaga/features/registerer/repository/customer_logic.dart';
import 'package:amaga/shared/widgets/customer_card.dart';
import 'package:amaga/shared/widgets/search.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.token});

  final String token;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final CustomerLogic customerLogic = CustomerLogic();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createuserpage');
          },
          backgroundColor: primaryColor,
          shape: const CircleBorder(eccentricity: 0),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Drawer(),
      appBar: AppBar(
        titleSpacing: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 29),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Search(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  customers = customers.take(4).toList();
                });
                await Future.delayed(
                  const Duration(seconds: 2),
                );
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 13, right: 13),
                itemCount: customers.length,
                itemBuilder: (context, index) => CustomerCard(
                    name: customers[index].name,
                    email: customers[index].email,
                    phone: customers[index].phone,
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerCylinderPage(
                            name: customers[index].name,
                            email: customers[index].email,
                            phoneNumber: customers[index].phone,
                          ),
                        ),
                      );
                    },
                    cylinders: customers[index].cylinders),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
