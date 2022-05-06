import 'package:bloc_lesson_1/domain/cubit/settings_cubit.dart';
import 'package:bloc_lesson_1/presentation/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  static const id = "/setting_page";
  final String title;

  const SettingsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
        centerTitle: true,
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          CustomSnackBar.showSnackBar(context,
              'App ${state.appNotifications.toString().toUpperCase()}, Email ${state.emailNotifications.toString().toUpperCase()}');
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SwitchListTile(
                  activeColor: Colors.black,
                  value: state.appNotifications,
                  onChanged: (value) {
                    context.read<SettingsCubit>().toggleAppNotifications(value);
                  },
                  title: const Text("App Notification"),
                ),
                const Divider(),
                SwitchListTile(
                  activeColor: Colors.black,
                  value: state.emailNotifications,
                  onChanged: (value) {
                    context.read<SettingsCubit>().toggleEmailNotifications(value);
                  },
                  title: const Text("Email Notifications"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
