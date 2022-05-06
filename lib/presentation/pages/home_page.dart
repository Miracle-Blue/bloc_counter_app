import 'package:bloc_lesson_1/constants/enums.dart';
import 'package:bloc_lesson_1/domain/cubit/id_cubit.dart';
import 'package:bloc_lesson_1/domain/cubit/internet_cubit.dart';
import 'package:bloc_lesson_1/presentation/pages/second_page.dart';
import 'package:bloc_lesson_1/presentation/pages/settings_page.dart';
import 'package:bloc_lesson_1/presentation/pages/third_page.dart';
import 'package:bloc_lesson_1/presentation/utils/custom_snackbar.dart';
import 'package:bloc_lesson_1/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const id = "/";
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IdCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingsPage.id);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.type == ConnectionType.Wifi) {
                  return const Text(
                    'Wi-Fi Connected',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  );
                } else if (state is InternetConnected &&
                    state.type == ConnectionType.Mobile) {
                  return const Text(
                    'Mobile Internet Connected',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  );
                } else if (state is InternetDisconnected) {
                  return const Text(
                    'Disconnected',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
            BlocConsumer<IdCubit, IdState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  CustomSnackBar.showSnackBar(context, "Incremented");
                } else if (state.wasIncremented == false) {
                  CustomSnackBar.showSnackBar(context, "Decremented");
                }
              },
              builder: (context, state) {
                return Text(
                  "${state.counter}",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SecondPage.id);
                  },
                  child: const Text("Go second page"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ThirdPage.id);
                  },
                  child: const Text("Go Third page"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonHP(
            onPressed: () => cubit.decrement(),
            iconData: Icons.remove,
          ),
          ButtonHP(
            onPressed: () => cubit.increment(),
            iconData: Icons.add,
          ),
        ],
      ),
    );
  }
}
