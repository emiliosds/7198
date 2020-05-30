import 'package:mobx/mobx.dart';
import 'package:todos/models/todo-item.model.dart';

class AppStore {
  @observable
  String currentState = "none";
  @observable
  bool busy = false;
  @observable
  ObservableList<TodoItem> todos = new ObservableList<TodoItem>();

  @action
  void changeSelected(String state) {
    currentState = state;
  }

  @action
  void add(TodoItem item) {
    todos.add(item);
  }

  @action
  void setTodos(List<TodoItem> items) {
    todos.addAll(items);
  }

  @action
  void clearTodos() {
    todos = new ObservableList<TodoItem>();
  }
}
