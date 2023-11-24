class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  String? email;
  String? avatar;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    this.email,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['uid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;

    return data;
  }
}
