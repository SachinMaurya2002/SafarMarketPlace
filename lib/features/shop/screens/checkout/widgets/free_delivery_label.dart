import 'package:flutter/material.dart';

class FreeDeliveryLabel extends StatelessWidget {
  final String location;

  const FreeDeliveryLabel({
    super.key,
    required this.location, // Removed default value to ensure data comes from controller
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Free delivery to $location',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.teal),
      ),
    );
  }
}
