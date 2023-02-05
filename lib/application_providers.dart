
import 'package:provider/provider.dart';
import 'features/home/home_router.dart';

applicationProviders () => [
  ChangeNotifierProvider(create: (context) => HomeRouter())
];