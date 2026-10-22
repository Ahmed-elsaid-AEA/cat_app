import 'package:cat_app/presentation/controllers/home/home_cubit.dart';
import 'package:cat_app/presentation/screen/breeds_screen.dart';
import 'package:cat_app/presentation/screen/facts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [FactsScreen(), BreedsScreen()];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<HomeCubit, int>(
            builder: (context, int index) {
              return Scaffold(
                body: screens[index],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: index,
                  onTap: context.read<HomeCubit>().updateIndex,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.face),
                      label: "Facts",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.baby_changing_station),
                      label: "Breeds",
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
