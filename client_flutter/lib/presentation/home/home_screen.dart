import 'package:client_flutter/presentation/common/grid_widget.dart';
import 'package:client_flutter/presentation/home/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/data.dart';
import 'widgets/alert_dialog_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await readSecureData('token');
      try {
        // ignore: use_build_context_synchronously
        await Provider.of<GetCurrentUserRepository>(context, listen: false)
            .functionGetCurrentUserLoggedRepository();
      } catch (e) {
        if (mounted) {
          alertDialogStatus(context, e.toString(), () async {
            await deleteSecureData(StorageItem('token', token!));
            Navigator.pushReplacementNamed(context, Routes.initial);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.subject_outlined,
                color: ColorsTheme.secondaryColor,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Home Screen",
            style: Theme.of(context).textTheme.headline1,
          )),
      body: Consumer<GetCurrentUserRepository>(
        builder: (context, userRepository, _) {
          return ValueListenableBuilder(
              valueListenable: userRepository.isLoading,
              builder: (BuildContext context, isLoading, child) {
                if (isLoading == false) {
                  return Container(
                    height: MediaQuerySize.heigthSizeCustom(context),
                    decoration: const BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        if (userRepository.currentUser.isStudent) ...{
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GridComponent(
                                  nameImage: "current_discipline.png",
                                  voidCall: () {
                                    Navigator.pushNamed(
                                        context, Routes.currentDiscipline);
                                  },
                                  text_1: "Current",
                                  text_2: "Disciplines",
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GridComponent(
                                  nameImage: "availible_disciplines.png",
                                  voidCall: () {
                                    Navigator.pushNamed(
                                        context, Routes.availibleDiscipline);
                                  },
                                  text_1: "Avalible",
                                  text_2: "Disciplines",
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                GridComponent(
                                  nameImage: "discipline_score.png",
                                  voidCall: () {
                                    Navigator.pushNamed(
                                        context, Routes.scoreDiscipline);
                                  },
                                  text_1: "Discipline",
                                  text_2: "Scores",
                                ),
                              ],
                            ),
                          ),
                        },
                        if (userRepository.currentUser.isTeacher) ...{
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                GridComponent(
                                  nameImage: "insert_score.png",
                                  voidCall: () {
                                    Navigator.pushNamed(
                                        context, Routes.teacherDiscipline);
                                  },
                                  text_1: "Teacher",
                                  text_2: "Disciplines",
                                ),
                              ],
                            ),
                          ),
                        }
                      ]),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              });
        },
      ),
    );
  }
}
