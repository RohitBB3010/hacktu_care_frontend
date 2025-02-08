import 'package:hacktu_care_frontend/shared/models.dart';

abstract class ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;
  final bool isLoading;

  ChatLoaded({required this.messages, required this.isLoading});
}

class ChatError extends ChatState {
  final String message;

  ChatError({required this.message});
}
