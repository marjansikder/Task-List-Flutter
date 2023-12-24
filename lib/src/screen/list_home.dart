import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:task_list/src/style/colors.dart';
import 'package:task_list/src/style/text_style.dart';
import '../app_setting/app_settings.dart';
import '../service/tasks_provider.dart';
import '../widget/task_card.dart';
import '../widget/task_create.dart';

class ListHome extends StatefulWidget {
  const ListHome({super.key});

  @override
  State<ListHome> createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProviders>(
      builder: ((context, notesProviders, chile) => Scaffold(
            appBar: AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: AppColors.colorPrimaryDark,
              title:  Row(
                children: [
                 /* Image(image: AssetImage(
                      "${ImageLocation.screenIcon}/file.png"),width: 28,height: 28,
                  ),
                  Gap(12),*/
                  Text(
                    'Task List',
                    style: getTextStyle(24, FontWeight.bold, AppColors.white),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              backgroundColor: AppColors.colorPrimaryDark,
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ), // You can change the icon as needed
            ),
            // drawer: const MyDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                         taskCreate(context),
                         ListView.builder(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemCount: notesProviders.tasks.length,
                           itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: taskCard(notesProviders.tasks[index], context),
                                );
                      },
                  ),
                ],
              )),
            ),
          )),
    );
  }
}
