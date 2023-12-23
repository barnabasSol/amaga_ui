class Customer {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final int cylinders;

  Customer({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cylinders,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      cylinders: json['cylinders'],
    );
  }
}
