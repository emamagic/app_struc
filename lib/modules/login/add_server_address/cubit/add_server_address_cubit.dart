import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_server_address_state.dart';

class AddServerAddressCubit extends Cubit<AddServerAddressState> {
  AddServerAddressCubit() : super(AddServerAddressInitial());
}
