import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/chatbot/chat_state.dart';
import 'package:hacktu_care_frontend/shared/models.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatLoaded(messages: [], isLoading: false));
}
