import 'package:flutter/material.dart';

class ContactInfoRow extends StatelessWidget {
  const ContactInfoRow({
    super.key,
    required this.value,
    required this.iconPath,
  });

  final String value;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      spacing: 6,
      children: [
        Image.asset(
          iconPath,
          height: 16,
          width: 16,
        ),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: (textTheme.bodySmall ?? const TextStyle()).copyWith(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}