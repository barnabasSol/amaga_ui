import 'package:amaga/features/registerer/repository/customer_list_data.dart';
import 'package:amaga/features/registerer/widgets/cutomer_card.dart';
import 'package:amaga/features/registerer/widgets/search.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 13, right: 13),
              itemCount: customers.length,
              itemBuilder: (context, index) => CustomerCard(
                  name: customers[index].name,
                  email: customers[index].email,
                  phone: customers[index].phone,
                  cylinders: customers[index].cylinders),
            ),
          )
        ],
      ),
    );
  }
}
