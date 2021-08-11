import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/data/network/dto/workspace/workspace_dto.dart';
import 'package:app_struc/data/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  final UserRepository userRepository;

  ConversationCubit(this.userRepository) : super(ConversationInitial());

  Future<bool> isUserLogin() async => await userRepository.isUserLogin();

  getUserWorkspaces() async {
    var result = await userRepository.getUserWorkspaces();
    result.when(success: (workspaces) {
      emit(GetUserWorkspaces(workspaces));
    }, failure: (error) {
      print("Error => ${NetworkExceptions.getErrorMessage(error)}");
      emit(ErrorState(NetworkExceptions.getErrorMessage(error)));
    });
  }

  dispose() {
    close();
  }
}
