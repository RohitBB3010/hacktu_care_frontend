import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/chatbot/chat_state.dart';
import 'package:hacktu_care_frontend/shared/models.dart';

List<Message> messages = [
  Message(role: 'bot', message: 'Hello, I am Salus! How can I help you today?'),
];

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatLoaded(messages: messages, isLoading: false));

  Future<void> sendMessage(String query) async {
    final userMesage = Message(role: 'user', message: query);
    messages.add(userMesage);
    emit(ChatLoaded(messages: messages, isLoading: true));

    final model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash',
    );

    final inputPrompt = [Content.text(query)];

    final response = await model.generateContent(inputPrompt);
    messages.add(Message(role: 'bot', message: response.text!));
    emit(ChatLoaded(messages: messages, isLoading: false));
  }
}
