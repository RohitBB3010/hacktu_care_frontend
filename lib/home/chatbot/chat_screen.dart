import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/constants/color_consts.dart';
import 'package:hacktu_care_frontend/home/chatbot/chat_cubit.dart';
import 'package:hacktu_care_frontend/home/chatbot/chat_state.dart';
// import 'package:hacktu_care_frontend/consts/color_consts.dart';
import 'package:hacktu_care_frontend/shared/models.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Salus'),
        ),
        body: Column(
          children: [
            Expanded(child:
                BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
              if (state is ChatLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            final isUser = message.role == 'user';

                            return Align(
                              alignment: isUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                    horizontal: 8.0,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: isUser
                                          ? ColorConsts().accent
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: MarkdownBody(
                                    data: message.message,
                                    styleSheet: MarkdownStyleSheet(
                                      p: TextStyle(
                                          fontSize: 16,
                                          color: isUser
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )),
                            );
                          }),
                    ),
                    if (state.isLoading)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 60,
                            margin: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 8.0,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8)),
                            child: LoadingDots()),
                      )
                  ],
                );
              } else if (state is ChatLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ChatError) {
                return const Center(
                  child: Text(
                    'Something went wrong! Try again later',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return const Center(
                child: Text('Start a conversation'),
              );
            })),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type your message here...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        final query = _controller.text;
                        if (query.isNotEmpty) {
                          context.read<ChatCubit>().sendMessage(query);
                          _controller.clear();
                        }
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoadingDots extends StatefulWidget {
  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          children: List.generate(3, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Opacity(
                opacity: 1 - ((_controller.value - index * 0.2).abs() % 1),
                child: Dot(),
              ),
            );
          }),
        );
      },
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
