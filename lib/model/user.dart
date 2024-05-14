class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'image': image,
      };
}
