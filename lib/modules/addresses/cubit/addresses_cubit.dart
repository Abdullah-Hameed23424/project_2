import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(AddressesInitial());
}
