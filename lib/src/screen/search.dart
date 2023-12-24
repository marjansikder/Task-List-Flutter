import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/src/style/colors.dart';

import '../service/tasks_provider.dart';
import '../style/text_style.dart';
import '../widget/task_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final searchWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProviders>(
      builder: ((context, notesProviders, chile) => WillPopScope(
            onWillPop: () async {
              notesProviders.resultClear();
              return true; // Allow the page to be popped
            },
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.colorPrimaryDark,
                  title: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchWordController,
                          decoration: const InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(color: AppColors.white),
                              border: InputBorder.none),
                        ),
                      ),
                      IconButton.filled(
                          onPressed: () {
                            notesProviders
                                .searchTasks(searchWordController.text);
                          },
                          icon: Text('Go',
                                style: getTextStyle(17, FontWeight.normal, AppColors.white),
                          ))
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: notesProviders.searchResult.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: taskCard(notesProviders.searchResult[index], context),
                      );
                    },
                  ),
                )),
          )),
    );
  }
}
