import 'package:contacts_app/models/contact_model.dart';
import 'package:contacts_app/utils/app_colors.dart';
import 'package:contacts_app/utils/app_assets.dart';
import 'package:contacts_app/widgets/add_contact_bottom_sheet.dart';
import 'package:contacts_app/widgets/contact_card.dart';
import 'package:contacts_app/widgets/place_holder_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AppImages.logo),
        ),
      ),
      body: contacts.isEmpty
          ? const PlaceHolderWidget()
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.70,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactCard(
            contact: contact,
            deleteContact: () => deleteContactAt(index),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (contacts.isNotEmpty)
            FloatingActionButton(
              heroTag: 'deleteLastContactFab',
              onPressed: deleteLastContact,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.red,
              child: const Icon(Icons.delete),
            ),
          if (contacts.length < 6)
            FloatingActionButton(
              heroTag: 'addContactFab',
              onPressed: showContactBottomSheet,
              foregroundColor: AppColors.primaryColor,
              backgroundColor: AppColors.white,
              child: const Icon(Icons.add),
            ),
        ],
      ),
    );
  }

  void deleteContactAt(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void deleteLastContact() {
    if (contacts.isEmpty) return;
    setState(() {
      contacts.removeLast();
    });
  }

  void showContactBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.primaryColor,
      builder: (context) {
        return AddContactBottomSheet(
          contacts: contacts,
          afterContactAdded: () {
            setState(() {});
          },
        );
      },
    );
  }
}