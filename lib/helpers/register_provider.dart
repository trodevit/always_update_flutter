import 'package:always_update/provider/generic_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<GenericDi>(create: ((context) => GenericDi())),
];