import './provider/catProvider.dart';
import 'package:get_it/get_it.dart';

// getIt은 object와 UI를 분리하기 위한 코드이다.
// getIt사용을 위해서는 분리하고자 하는 object를 이렇게 먼저 등록해야 한다.
// CatProvider를 UI와 분리시키고자 하는 객체로 등록하는 과정이다.
final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CatProvider>(CatProvider());
}
