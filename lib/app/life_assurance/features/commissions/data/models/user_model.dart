class UserModel {
  final int id;
  final String name;
  final String date;
  // Add other fields as needed

  UserModel({
    required this.id,
    required this.name,
    required this.date,
    // Initialize other fields here
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      // Parse other fields here
    );
  }
}
