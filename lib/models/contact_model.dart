import 'dart:io';

class ContactModel {

  final String userName ;
  final String email;
  final String phone;
  final File? imageFile;

  ContactModel({
    required this.userName,
    required this.email,
    required this.phone,
    this.imageFile});
}