import 'package:ecommercedashboard/core/helper/on_generate_router.dart';
import 'package:ecommercedashboard/core/services/get_it_service.dart';
import 'package:ecommercedashboard/core/utils/app_colors.dart';
import 'package:ecommercedashboard/core/widgets/custom_bloc_opserver.dart';
import 'package:ecommercedashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupSingleton();
  Bloc.observer = CustomBlocObserver();
  runApp(DashBoard());
}

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.dashboardView,
      debugShowCheckedModeBanner: false,
    );
  }
}
