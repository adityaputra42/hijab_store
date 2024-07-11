import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardInitial(tabIndex: 0)) {
    on<DashboardEvent>((event, emit) {
      if (event is TabChange) {
        emit(DashboardInitial(tabIndex: event.index));
      }
    });
  }
}
