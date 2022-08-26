import 'package:ctu_conductor_app/screens/loginScreen/ctu_conductor_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [

  ChangeNotifierProvider<CtuConductorProvider>(create:(context)=> CtuConductorProvider()),

];