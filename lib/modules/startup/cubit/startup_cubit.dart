import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(StartupInitial());
}
