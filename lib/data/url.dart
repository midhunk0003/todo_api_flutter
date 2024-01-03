class Url {
  String baseUrl = 'https://api.nstack.in/v1/todos';

  String createNote = '/TodoController_create';
  String editNote = '/TodoController_findOne';
  String deleteNote = '/TodoController_remove{id}';
  String getAllNote = '/TodoController_findAll';
}
