import 'package:flutter/material.dart';
import 'package:intatrack/core/utils/constants.dart';
import 'package:intatrack/core/values/colors.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({required this.onPressedNotification, Key? key}) : super(key: key);

  final Function() onPressedNotification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(backgroundImage: AssetImage('${ImagePath.base}avatar-1.png')),
      title: Text(
        'Waseem Abbas',
        style: TextStyle(fontSize: 14, color: AppColors.fontColorPallets[0]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        'admin@admin.com',
        style: TextStyle(fontSize: 12, color: AppColors.fontColorPallets[2]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: onPressedNotification,
        icon: const Icon(Icons.notification_important_outlined),
        tooltip: "notification",
      ),
    );
  }
}
