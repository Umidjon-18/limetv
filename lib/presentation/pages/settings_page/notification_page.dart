import 'package:flutter/material.dart';
import 'package:limetv/config/constants/app_text_styles.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Уведомление',
      style: AppTextStyles.body18w5,
    );
  }
}
