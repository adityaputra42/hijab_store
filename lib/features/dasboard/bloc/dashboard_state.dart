part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  final int tabIndex;

  const DashboardState({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial({required super.tabIndex});
  @override
  List<Object> get props => [tabIndex];
}
