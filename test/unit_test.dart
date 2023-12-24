import 'package:flutter_test/flutter_test.dart';
import 'package:task_list/src/service/tasks_provider.dart';

var task = TasksProviders();

void main () {
  test('create task', (){
    task.insertTask('Test','Description','completed');
    task.updateTask( 1 ,'Test','Description','completed');
    task.deleteTask( 1 );
  });

}