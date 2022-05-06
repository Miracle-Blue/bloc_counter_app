import 'package:bloc_lesson_1/domain/cubit/id_cubit.dart';
import 'package:bloc_lesson_1/presentation/utils/custom_snackbar.dart';
import 'package:bloc_lesson_1/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatelessWidget {
  static const id = "/third_page";
  final String title;

  const ThirdPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<IdCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<IdCubit, IdState>(
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
