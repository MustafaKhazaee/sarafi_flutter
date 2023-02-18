
import 'package:provider/provider.dart';
import 'package:sarafi/services/authentication_service.dart';

final _authService = AuthenticationService();
applicationProviders () => [
  ListenableProvider<AuthenticationService>(create: (_) => _authService),
];