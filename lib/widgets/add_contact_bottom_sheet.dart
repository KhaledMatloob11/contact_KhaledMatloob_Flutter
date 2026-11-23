import 'dart:io';

import 'package:contacts_app/core/image_picker.dart';
import 'package:contacts_app/core/validation.dart';
import 'package:contacts_app/models/contact_model.dart';
import 'package:contacts_app/utils/app_assets.dart';
import 'package:contacts_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddContactBottomSheet extends StatefulWidget {
  const AddContactBottomSheet({
    super.key,
    required this.contacts,
    required this.afterContactAdded,
  });

  final List<ContactModel> contacts;
  final VoidCallback afterContactAdded;

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  final TextEditingController nameCtrl =
  TextEditingController(text: "Ronaldo");
  final TextEditingController emailCtrl =
  TextEditingController(text: "Ronaldo@mail.com");
  final TextEditingController phoneCtrl =
  TextEditingController(text: "01212345678");

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? pickedImage;

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        final File? temp = await ImagePickerUtils.cameraPicker();
                        if (temp != null && mounted) {
                          setState(() {
                            pickedImage = temp;
                          });
                        }
                      },
                      child: Container(
                        height: 160,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: pickedImage == null
                            ? Lottie.asset(AppAnimations.imagePicker)
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Image.file(
                            pickedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<TextEditingValue>(
                          valueListenable: nameCtrl,
                          builder: (context, value, child) {
                            return Text(
                              value.text,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            );
                          },
                        ),
                        const Divider(),
                        ValueListenableBuilder<TextEditingValue>(
                          valueListenable: emailCtrl,
                          builder: (context, value, child) {
                            return Text(
                              value.text,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            );
                          },
                        ),
                        const Divider(),
                        ValueListenableBuilder<TextEditingValue>(
                          valueListenable: phoneCtrl,
                          builder: (context, value, child) {
                            return Text(
                              value.text,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: nameCtrl,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'You must input your name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter User Name",
                ),
              ),
              TextFormField(
                controller: emailCtrl,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: Validation.emailValidation,
                decoration: const InputDecoration(
                  hintText: "Enter User Email",
                ),
              ),
              TextFormField(
                controller: phoneCtrl,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                validator: Validation.phoneValidation,
                onFieldSubmitted: (_) => addContact(),
                decoration: const InputDecoration(
                  hintText: "Enter User Phone",
                ),
              ),
              ElevatedButton(
                onPressed: addContact,
                child: const Text("Enter User"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addContact() {
    if (formKey.currentState!.validate()) {
      widget.contacts.add(
        ContactModel(
          userName: nameCtrl.text.trim(),
          email: emailCtrl.text.trim(),
          phone: phoneCtrl.text.trim(),
          imageFile: pickedImage,
        ),
      );
      widget.afterContactAdded();
      Navigator.of(context).pop();
    }
  }
}