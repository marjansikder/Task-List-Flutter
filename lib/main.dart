import 'package:flutter/material.dart';
import 'package:task_list/src/screen/create.dart';
import 'package:task_list/src/screen/human_body.dart';
import 'package:task_list/src/screen/list_home.dart';
import 'package:task_list/src/screen/search.dart';
import 'package:task_list/src/screen/splash_screen.dart';
import 'package:task_list/src/service/tasks_provider.dart';
import 'package:task_list/src/service/sqlite_helper.dart';
import 'package:provider/provider.dart';


final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TasksProviders()
            ..deleteOldTrash()
            ..selectTasks()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'note',
        //theme: lightTheme,
        //darkTheme: darkTheme,
        //themeMode: AppSetting().themeMode,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const ListHome(),
          '/create': (context) => const CreateNote(),
          '/search': (context) => const SearchPage(),
          '/humanBody': (context) => const HumanBody()
        },
      ),
    );
  }
}

