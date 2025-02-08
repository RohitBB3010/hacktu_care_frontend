import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:audioplayers/audioplayers.dart';

class SOSCubit extends Cubit<bool> {
  SOSCubit() : super(false);
  final AudioPlayer audioPlayer = AudioPlayer();

  void sendSOS(String token) async {
    emit(true);
    NotificationService().showSOSNotification();
    playAlarmSound();
    await http.post(
      Uri.parse('https://medeaseapis.loca.lt/send-sos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'token': token}),
    );
  }

  void stopSOS() {
    emit(false);
    NotificationService().cancelNotification();
    audioPlayer.stop();
  }

  void playAlarmSound() async {
    await audioPlayer.play(AssetSource('alarm.mp3'));
  }
}

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidInitSettings);

    await _notificationsPlugin.initialize(initSettings);
  }

  Future<void> showSOSNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'sos_channel',
      'SOS Alerts',
      importance: Importance.max,
      priority: Priority.high,
      fullScreenIntent: true,
      ongoing: true, // Prevent user from dismissing
      sound: RawResourceAndroidNotificationSound('alarm'), // Play alert sound
    );

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(
        0, 'SOS Alert', 'Emergency! Tap to stop.', details);
  }

  Future<void> cancelNotification() async {
    await _notificationsPlugin.cancelAll();
  }
}
