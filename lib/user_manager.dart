abstract class User {
  final String email;

  User(this.email);

  @override
  String toString() => email;
}

class AdminUser extends User with MailSystem {
  AdminUser(super.email);

  @override
  String toString() => getMailSystem();
}

class GeneralUser extends User {
  GeneralUser(super.email);
}

mixin MailSystem on User {
  String getMailSystem() {
    return email.split('@').last;
  }
}

class UserManager<T extends User> {
  final List<T> list = [];

  void add(T user) => list.add(user);

  void remove(T user) => list.remove(user);

  void removeByEmail(String email) =>
      list.removeWhere((user) => user.email == email);

  void printUsers() {
    for (var user in list) {
      print(user.toString());
    }
  }
}
