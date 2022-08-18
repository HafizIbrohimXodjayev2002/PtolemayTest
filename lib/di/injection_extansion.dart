import 'package:ptolemay/di/injection_container.dart';

T inject<T extends Object>() {
  return getIt.get<T>();
}