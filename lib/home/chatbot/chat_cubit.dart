import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/home/chatbot/chat_state.dart';
import 'package:hacktu_care_frontend/shared/models.dart';

List<Message> messages = [
  // Message(
  //     role: 'bot',
  //     message:
  //         'Hello, I am Salus! Select the person you want to chat for today.'),
];
late String selectedPatientName;
late String selectedPatientDisability;

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatLoaded(messages: messages, isLoading: false));

  void fetchInitialData(List<dynamic> patientData) {
    debugPrint('patient data - ${patientData}');
    // final patients = patientData
    //     .map((patient) => {
    //           'id': patient['_id'],
    //           'name': patient['name'],
    //           'profile_pic_url': patient['profile_pic_url'],
    //           'disability': patient['disability']
    //         })
    //     .toList();
    // messages.add(Message(role: 'bot', message: 'Myself'));
    // messages.addAll(patients
    //     .map((patient) => Message(role: 'bot', message: patient['name'])));
    // emit(ChatLoaded(messages: messages, isLoading: false));
  }

  Future<void> selectPatient(
      String patientName, String patientDisability) async {
    selectedPatientName = patientName;
    selectedPatientDisability = patientDisability;
    messages.add(Message(
        role: 'bot',
        message:
            'You have selected ${selectedPatientName}. How can I assist you?'));
    emit(ChatLoaded(messages: messages, isLoading: false));
  }

  Future<void> sendMessage(String query) async {
    final userMesage = Message(role: 'user', message: query);
    messages.add(userMesage);
    emit(ChatLoaded(messages: messages, isLoading: true));

    final model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash',
    );

    // final inputPrompt = [Content.text(query)];
    // final inputPrompt = [
    //   Content.text(
    //       "You are a medical assistant chatbot. Only answer queries related to healthcare, medicines, and patient care. "
    //       "If the user's query is unrelated, politely respond with: 'I'm here to assist with healthcare-related topics. "
    //       "Please ask something relevant to health, medicine, or patient care.' "
    //       "User Query: $query")
    // ];
    final inputPrompt = [
      Content.text(
          "You are a medical assistant chatbot. Only answer queries related to healthcare, medicines, and patient care. "
          "If the user's query is unrelated, politely respond with: 'I'm here to assist with healthcare-related topics. "
          "Please ask something relevant to health, medicine, or patient care.' "
          "Now, analyze the following query: $query "
          "If it is healthcare-related, keep in mind that the patient has the following disability: ${selectedPatientDisability}. "
          "Tailor your response accordingly by considering their condition. Provide information that is accessible, understandable, "
          "and suitable for someone with this disability. If necessary, suggest alternatives that accommodate their specific needs.")
    ];

    final response = await model.generateContent(inputPrompt);
    messages.add(Message(role: 'bot', message: response.text!));
    emit(ChatLoaded(messages: messages, isLoading: false));
  }
}
