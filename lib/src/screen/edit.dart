import 'package:flutter/material.dart';
import '../service/tasks_provider.dart';
import 'package:intl/intl.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task_list/src/model/notes.dart';

import '../style/colors.dart';
import '../style/text_style.dart';

class EditNote extends StatefulWidget {
  final int id;

  const EditNote({Key? key, required this.id}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController statusController;
  bool _loading = true;
  late Task pnote;

  @override
  void initState() {
    super.initState();
    selectNote();
  }
  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFE6F9FF),
            icon: const Icon(
              Icons.info,
              color: Colors.grey,
            ),
            title: const Text(
              'Are you want to delete?',
              style: TextStyle(color: Colors.black),
            ),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async{
                        final notesProvider = Provider.of<TasksProviders>(context, listen: false);
                        if (pnote.delete == 0) {
                          notesProvider.deleteTask(widget.id);
                        } else {
                          notesProvider.deleteTaskPermanent(widget.id);
                        }
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ]),
          );
        });
  }
  selectNote() async {
    final notesProvider = Provider.of<TasksProviders>(context, listen: false);
    final Task note = await notesProvider.selectTask(widget.id);
    setState(() {
      pnote = note;
      titleController = TextEditingController(text: note.title);
      descriptionController = TextEditingController(text: note.description);
      statusController = TextEditingController(text: note.status);
      _loading = false;
    });
  }

  String dateTimeFormate(String dt) {
    DateTime dateTime = DateTime.parse(dt);
    return DateFormat("dd MMM").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final notesProvider =
            Provider.of<TasksProviders>(context, listen: false);
        notesProvider.updateTask(
            widget.id,
            titleController.text,
            descriptionController.text,
            statusController.text);
        return true; // Allow the page to be popped
      },
      child: _loading
          ? const Scaffold()
          : Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.colorPrimaryDark,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () async{
                      confirmDialog(context);
                    /*  final notesProvider =
                          Provider.of<NotesProviders>(context, listen: false);
                      if (pnote.delete == 0) {
                        notesProvider.deleteNote(widget.id);
                      } else {
                        notesProvider.deleteNotePermanent(widget.id);
                      }
                      Navigator.pop(context);*/
                    },
                  ),
                  IconButton(
                    icon: pnote.delete == 0
                        ? const Icon(
                            Icons.save,
                            color: Colors.white,
                            size: 24,
                          )
                        : const Icon(
                            Icons.restore,
                            color: Colors.white,
                            size: 24,
                          ),
                    onPressed: () {
                      final notesProvider =
                          Provider.of<TasksProviders>(context, listen: false);
                      notesProvider.updateTask(widget.id, titleController.text,
                          descriptionController.text,statusController.text);
                      if (pnote.delete == 1) {
                        notesProvider.restoreNote(widget.id);
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
                                  hintText: 'Write a title..',
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
                                minLines: 5,
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
                                maxLines: 1,
                                minLines: 1,
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
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
