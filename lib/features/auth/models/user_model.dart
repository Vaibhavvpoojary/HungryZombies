class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? address;
  final String? profileImage;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.address,
    this.profileImage,
  });
}