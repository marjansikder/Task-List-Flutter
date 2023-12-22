import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../service/notes_provider.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProviders>(
      builder: ((context, notesProviders, child) => WillPopScope(
            onWillPop: () async {
              if (titleController.text.isNotEmpty ||
                  descriptionController.text.isNotEmpty) {
                notesProviders.insertNote(
                  titleController.text,
                    descriptionController.text,
                  statusController.text
                );
              }
              return true; // Allow the page to be popped
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.colorPrimaryDark,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      if (titleController.text.isNotEmpty ||
                          descriptionController.text.isNotEmpty) {
                        notesProviders.insertNote(
                            titleController.text, descriptionController.text,statusController.text);
                      }
                      Navigator.pop(context);
                    },
                  ),
                  const Gap(12)
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: new BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(5.0),
                        topRight: const Radius.circular(5.0),
                        bottomLeft: const Radius.circular(5.0),
                        bottomRight: const Radius.circular(5.0),
                      ),),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                            child: Text('■ Title :',
                              style: getTextStyle(15, FontWeight.normal, AppColors.textFieldTopColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Container(
                            padding: EdgeInsets.only(left: 10,right: 19,bottom: 5),
                            decoration: new BoxDecoration(
                                color: AppColors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(5.0),
                                  topRight: const Radius.circular(5.0),
                                  bottomLeft: const Radius.circular(5.0),
                                  bottomRight: const Radius.circular(5.0),
                                )
                            ),
                            child: TextField(
                                controller: titleController,
                                maxLines: 2,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder
                                      .none,
                                  hintText: 'Write a Title..',
                                  hintStyle: getTextStyle(14,FontWeight.normal, Colors.grey),
                                ),
                                style: getTextStyle(
                                    16,
                                    FontWeight.normal,
                                    Colors.black)
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                            child: Text('■ Description',
                              style: getTextStyle(15, FontWeight.normal, AppColors.textFieldTopColor),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Container(
                            padding: EdgeInsets.only(left: 10,right: 19,bottom: 5),
                            decoration: new BoxDecoration(
                                color: AppColors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(5.0),
                                  topRight: const Radius.circular(5.0),
                                  bottomLeft: const Radius.circular(5.0),
                                  bottomRight: const Radius.circular(5.0),
                                )
                            ),
                            child: TextField(
                                controller: descriptionController,
                                maxLines: 7,
                                minLines: 7,
                                decoration: InputDecoration(
                                  border: InputBorder
                                      .none,
                                  hintText: 'Write a description..',
                                  hintStyle: getTextStyle(14,FontWeight.normal, Colors.grey),
                                ),
                                style: getTextStyle(
                                    16,
                                    FontWeight.normal,
                                    Colors.black)
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                            child: Text('■ Status :',
                              style: getTextStyle(15, FontWeight.normal, AppColors.textFieldTopColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Container(
                            padding: EdgeInsets.only(left: 10,right: 19,bottom: 5),
                            decoration: new BoxDecoration(
                                color: AppColors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(5.0),
                                  topRight: const Radius.circular(5.0),
                                  bottomLeft: const Radius.circular(5.0),
                                  bottomRight: const Radius.circular(5.0),
                                )
                            ),
                            child: TextField(
                                controller: statusController,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder
                                      .none,
                                  hintText: 'Write a Status..',
                                  hintStyle: getTextStyle(14,FontWeight.normal, Colors.grey),
                                ),
                                style: getTextStyle(
                                    16,
                                    FontWeight.normal,
                                    Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
