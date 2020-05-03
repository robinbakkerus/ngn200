import 'package:ngn200/model/volonteer.dart';

class Constants {
  static String title;
  static String imagePath;
}

// this corresponds with stackIndex in start_page
const int STACK_HOME = 0;
const int STACK_ADD = 1;
const int STACK_SHOW_VOLONTEERS = 2;
const int STACK_SHOW_PICTURE = 3;
const int STACK_MAP = 4;
const int STACK_ADMIN = 5;

class AppData {
  static Volonteer currentVolonteer = Volonteer();

  static prepareVolonteer() => currentVolonteer = Volonteer();
}
