import 'package:get_it/get_it.dart';
import 'package:test_pro_mobile_app/repository/repository.dart';
import 'package:test_pro_mobile_app/services/authentication/fake_auth.dart';
import 'package:test_pro_mobile_app/services/authentication/firebase_auth.dart';
import 'package:test_pro_mobile_app/services/database/firestore_db.dart';

late GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => Repository());
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
}
