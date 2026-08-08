class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  String name = "Software";
  String surname = "Persona";

  void updateName(String newName, String newSurname) {
    name = newName;
    surname = newSurname;
  }
}