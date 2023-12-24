import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_list/src/style/colors.dart';

Widget taskCreate(context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Container(
          width: double.infinity,
          padding:  EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: AppColors.lightGreen,
            border: Border.all(color: AppColors.greenButton),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Take Task...',
              ),
              Icon(
                Icons.add,
              )
            ],
          ),
        ),
      ),
      const Gap(12),
    ],
  );
}
