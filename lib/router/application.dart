import 'package:fluro/fluro.dart';

// singleton
class Application {
  static late FluroRouter router;

  Application._privateConstructor();

  static final Application _instance = Application._privateConstructor();

  factory Application() {
    return _instance;
  }

  static Init(FluroRouter r) {
    router = r;
  }

  FluroRouter Router() {
    return router;
  }
}
