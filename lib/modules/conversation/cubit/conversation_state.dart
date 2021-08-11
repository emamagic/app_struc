part of 'conversation_cubit.dart';

@immutable
abstract class ConversationState {}

class ConversationInitial extends ConversationState {}
class SendRequest extends ConversationState {}
class GetUserWorkspaces extends ConversationState {
  final List<WorkspaceDto> workspaces;
  GetUserWorkspaces(this.workspaces);
}
class ErrorState extends ConversationState {
  final String error;
  ErrorState(this.error);
}
