class StateService {
  static String _state = "Initial State";

  static String get state => _state;

  static void setState(String state) {
    _state = state;
  }
}
