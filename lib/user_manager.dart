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

class UserManager<TUser extends User> {
  final List<TUser> list = [];

  void add(TUser user) => list.add(user);

  void remove(TUser user) => list.remove(user);

  void removeByEmail(String email) =>
      list.removeWhere((user) => user.email == email);

  void printUsers() {
    for (var user in list) {
      print(user.toString());
    }
  }
}
