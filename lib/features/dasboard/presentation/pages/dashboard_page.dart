import 'package:barakallah_hijab/features/dasboard/presentation/bloc/dashboard_bloc.dart';
import 'package:barakallah_hijab/features/dasboard/presentation/widget/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    body(int index) {
      switch (index) {
        case 0:
          return const Center(
            child: Text("1 Screen"),
          );
        case 1:
          return const Center(
            child: Text("2 Screen"),
          );
        case 2:
          return const Center(
            child: Text("3 Screen"),
          );
        case 3:
          return const Center(
            child: Text("4 Screen"),
          );

        default:
          return const Center(
            child: Text("Default Screen"),
          );
      }
    }

    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            body: body(state.tabIndex),
            bottomNavigationBar: CustomBottomNavBar(
              onTap: (index) {
                context.read<DashboardBloc>().add(TabChange(index));
              },
              selectedIndex: state.tabIndex,
            ),
          );
        },
      ),
    );
  }
}
