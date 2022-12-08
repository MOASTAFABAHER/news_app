import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/app_colors.dart';

class CustomDiveder extends StatelessWidget {
  const CustomDiveder({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: AppColors.krBlackColor,
    );
  }
}
