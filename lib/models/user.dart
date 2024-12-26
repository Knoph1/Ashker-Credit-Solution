class User {
  final String id;
  final String name;
  final String email;
  // Add other relevant user fields (e.g., address, phone)

  User({
    required this.id,
    required this.name,
    required this.email,
    // ... other fields
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        // ... other fields
      );
}