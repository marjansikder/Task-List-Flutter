import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_list/src/model/notes.dart';
import '../screen/edit.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

Widget taskCard(Task n, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote(id: n.id)));
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(0.0),
                topLeft: Radius.circular(5.0),
            ),
            color: AppColors.greenButton,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Task : ${n.title}',
              style: getTextStyle(17, FontWeight.normal, AppColors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),),
        ),
        Container(
          width: double.infinity,
          //height: queryData.size.height * .15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0.0),
              bottomRight: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
              topLeft: Radius.circular(0.0),
            ),
            border: Border.all(color: AppColors.greenButton),
            color: AppColors.lightGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 60,left: 10,right: 10),
            child:
            /*Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  style: getTextStyle(
                      17, FontWeight.normal, AppColors.black),
                  children: <TextSpan>[
                    TextSpan(text: 'Description: \n',
                      style: getTextStyle(
                          17, FontWeight.normal, AppColors.black),
                    ),
                    TextSpan(text: n.description,
                      style: getTextStyle(
                          16, FontWeight.normal, AppColors.greenButton),),
                  ],
                ),
              ),
            ),*/

            Text(
                "Description : ${n.description}",
                maxLines: 5,
                style: getTextStyle(
                    15,
                    FontWeight.normal,
                    AppColors.greenButton)
            ),
          ),
        ),
      ],
    ),
  );
}
