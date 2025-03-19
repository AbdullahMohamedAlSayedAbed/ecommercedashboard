  import 'package:ecommercedashboard/core/utils/app_style.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({required String title, void Function()? onPressed}) {
    return AppBar(
      backgroundColor: Colors.white,
      title:  Text(
        title,
        style: AppStyle.body19Bold,
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back_ios_new)),
    );
  }
