import "package:slatkizalogaj/model/user.dart";

class UserService {
  static final List<User> _mockUsers = [
    User(
        firstName: 'Aleksa',
        lastName: 'Racic',
        username: 'aleksa',
        email: 'john@example.com',
        password: '123',
        phoneNumber: '+38765233776',
        isCustomer: true),
    User(
        firstName: 'John',
        lastName: 'Doe',
        username: 'johndoe',
        email: 'john@example.com',
        password: '123',
        phoneNumber: '+38765233776',
        isCustomer: true),
    User(
        firstName: 'John',
        lastName: 'Doe',
        username: 'prodavac',
        email: 'john@example.com',
        password: '123',
        phoneNumber: '+38765233776',
        isCustomer: false),
  ];

  static User _currentUser = _mockUsers[0];

  static bool login(String username, String password) {
    for (User user in _mockUsers) {
      if (user.username == username && user.password == password) {
        _currentUser = user;
        return true;
      }
    }
    return false;
  }

  static void logout() {
    _currentUser = _mockUsers[0];
  }

  static bool update_user(
      String firstName, String lastName, String email, String phoneNumber) {
    _currentUser.firstName = firstName;
    _currentUser.lastName = lastName;
    _currentUser.email = email;
    _currentUser.phoneNumber = phoneNumber;
    return true;
      return false;
  }

  static User get currentUser => _currentUser;
}
