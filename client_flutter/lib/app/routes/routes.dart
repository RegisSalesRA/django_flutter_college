import 'package:client_flutter/presentation/discipline_student/availible_discipline_screen.dart';
import 'package:client_flutter/presentation/discipline_student/current_discipline_screen.dart';
import 'package:client_flutter/presentation/discipline_student/score_discipline_screen.dart';
import 'package:client_flutter/presentation/signup/signup.dart';
import 'package:flutter/material.dart';

import '../../presentation/discipline_teacher/discipline_teacher.dart';

import '../../presentation/home/config_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/login/login.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/login': (context) => const Login(),
    '/register': (context) => const SignUp(),
    '/home': (context) => const HomeScreen(),
    '/myconfig': (context) => const MyConfigScreen(),
    '/currentDiscipline': (context) => const CurrentDisciplinesScreen(),
    '/availibleDiscipline': (context) => const AvailibleDisciplinesScreen(),
    '/scoreDiscipline': (context) => const ScoresDisciplinesScreen(),
    '/teacherDiscipline': (context) => const TeacherDisciplinesScreen(), 
  };

  static String initial = '/login';
  static String register = '/register';
  static String home = '/home';
  static String currentDiscipline = '/currentDiscipline';
  static String availibleDiscipline = '/availibleDiscipline';
  static String scoreDiscipline = '/scoreDiscipline';
  static String teacherDiscipline = '/teacherDiscipline'; 
  static String myconfig = '/myconfig'; 

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
