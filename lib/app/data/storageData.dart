// ignore: file_names, depend_on_referenced_packages
import 'package:get_storage/get_storage.dart';

class MyPref {
  // ignore: prefer_function_declarations_over_variables
  static final _otherBox = () => GetStorage('MyPref');

  final token = ''.val('jwt', getBox: _otherBox);
}
