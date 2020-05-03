import 'package:ngn200/event/app_events.dart';
import 'package:ngn200/model/volonteer.dart';
import 'package:ngn200/util/image_utils.dart';
import 'package:ngn200/data/app_data.dart';
// import 'package:ngn200/service/firestore_service.dart';

class AppController {
  static final AppController _singleton = new AppController._internal();

  factory AppController() {
    return _singleton;
  }

  AppController._internal() {
    AppEvents.onTakePicture(_onTakePicture);
    AppEvents.onCompressPicture(_onCompressPicture);
    AppEvents.onSaveVolonteer(_onSaveVolonteer);
    AppEvents.onAddVolonteer(_onAddVolonteer);
  }

  void _onTakePicture(TakePictureEvent event) {
    AppEvents.fireSwitchStack(STACK_SHOW_VOLONTEERS);
  }

  void _onCompressPicture(CompressPictureEvent event) {
    String compressedPath = ImageUtils.compress(event.imagePath);
    AppData.currentVolonteer.fotoBase64 = ImageUtils.imageAsBase64(compressedPath);
    AppEvents.fireShowPicture(compressedPath);
    AppEvents.fireSwitchStack(STACK_SHOW_PICTURE);
  }

    void _onSaveVolonteer(SaveVolonteerEvent event) {
    AppData.currentVolonteer.lastupdated = DateTime.now();
    AppData.currentVolonteer.aanmelder = ""; //todo
    // FirestoreService()..saveVolunteer(AppData.currentVolonteer);
    //Todo geef okay msg
    AppEvents.fireSwitchStack(STACK_HOME.hashCode);
  }

  void _onAddVolonteer(AddVolonteerEvent event) {
    AppData.currentVolonteer = Volonteer();
    AppEvents.fireSwitchStack(STACK_ADD);
  }
}
