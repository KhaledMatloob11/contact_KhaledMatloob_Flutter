import 'package:contacts_app/models/contact_model.dart';
import 'package:contacts_app/utils/app_assets.dart';
import 'package:contacts_app/utils/app_colors.dart';
import 'package:contacts_app/widgets/contact_info_row.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
    required this.deleteContact,
  });

  final ContactModel contact;
  final VoidCallback deleteContact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: contact.imageFile == null
                        ? Lottie.asset(
                      AppAnimations.imagePicker,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.person,
                            size: 48,
                            color: Colors.grey,
                          ),
                        );
                      },
                    )
                        : Image.file(
                      contact.imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        contact.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: (textTheme.bodyMedium ?? const TextStyle())
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ContactInfoRow(
                  value: contact.email,
                  iconPath: AppIcons.emailIcon,
                ),
                const SizedBox(height: 4),
                ContactInfoRow(
                  value: contact.phone,
                  iconPath: AppIcons.phoneIcon,
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.red,
                    ),
                    onPressed: deleteContact,
                    child: const Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, size: 18),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}