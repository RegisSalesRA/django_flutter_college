import 'package:client_flutter/ui/discipline_student/availible_discipline_student.dart';
import 'package:client_flutter/ui/discipline_student/score_discipline_student.dart';
import 'package:client_flutter/ui/signup/signup.dart';
import 'package:flutter/material.dart';

import '../../ui/discipline_student/discipline_student.dart';
import '../../ui/discipline_teacher/discipline_teacher.dart';

import '../../ui/home/settings_users.dart';
import '../../ui/home/home_screen.dart';
import '../../ui/login/login.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/login': (context) => const Login(),
    '/register': (context) => const SignUp(),
    '/home': (context) => const HomeScreen(),
    '/myconfig': (context) => const SettingsUser(),
    '/currentDiscipline': (context) => const StudentDisciplinesScreen(),
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
