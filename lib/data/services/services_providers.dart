import 'package:cinebox/data/core/rest_client/backend_rest_client_provider.dart';
import 'package:cinebox/data/services/auth/auth_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service_impl.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_providers.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(flutterSecureStorage: FlutterSecureStorage());
}

@Riverpod()
GoogleSigninService googleSignInService(Ref ref) {
  return GoogleSignInServiceImpl();
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.read(backendRestClientProvider));
}
