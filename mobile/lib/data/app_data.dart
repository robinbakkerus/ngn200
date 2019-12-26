import 'package:camera/camera.dart';
import 'package:ngn200_vrijwillgers/model/volonteer.dart';

class Constants {
  static String title;
  static CameraDescription camera;
  static String imagePath;
}

const int STACK_HOME = 0;
const int STACK_ADD = 1;
const int STACK_TAKE_PICTURE = 2;
const int STACK_SHOW_PICTURE = 3;
const int STACK_ADMIN = 4;

class AppData {
  static Volonteer currentVolonteer = Volonteer();

  static prepareVolonteer() => currentVolonteer = Volonteer();
}
