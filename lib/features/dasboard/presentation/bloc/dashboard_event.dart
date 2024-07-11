part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class TabChange extends DashboardEvent {
  final int index;
  const TabChange(this.index);

  @override
  List<Object> get props => [index];
}
