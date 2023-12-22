import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_list/src/style/colors.dart';

Widget noteCreate(context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: AppColors.lightGreen,
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
