import 'package:fluboard/data/datasource/remote/authenticated_client.dart';
import 'package:googleapis/tasks/v1.dart';

class GoogleTasksService {
  TasksApi get service => TasksApi(AuthenticatedClient());

  Future<TaskLists> getTaskLists() async => await service.tasklists.list();
  Future<Tasks> getTasks(String taskListId) => service.tasks.list(taskListId);
}
