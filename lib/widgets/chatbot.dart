import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:track_pro/data/chatkeys.dart';
import 'package:track_pro/models/conversation.dart';
import 'package:track_pro/widgets/chat_list_view.dart';
import 'package:track_pro/widgets/chat_text_field.dart';
import 'package:track_pro/widgets/example_widget.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];

  bool get isConversationStarted => conversations.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xffbdc3d8),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 38),
                    if (!isConversationStarted) ...[
                      const SizedBox(height: 24),
                      Text(
                        "Welcome to\nTrackProGPT",
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Ask anything, get your answer",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.wb_sunny_outlined),
                              const SizedBox(height: 6),
                              Text(
                                "Examples",
                                style: textTheme.titleMedium,
                              ),
                              const SizedBox(height: 40),
                              const ExampleWidget(
                                text:
                                    "“Explain Heart failure Arrhythmia in simple terms”",
                              ),
                              const ExampleWidget(
                                text:
                                    "“What's the Link Between Smoking and Heart Disease?”",
                              ),
                              const ExampleWidget(
                                text: "“Who invented TrackPro?”",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else
                      Expanded(
                          child: ChatListView(conversations: conversations)),
                    ChatTextField(
                      controller: controller,
                      onSubmitted: (question) {
                        controller.clear();
                        FocusScope.of(context).unfocus();
                        conversations.add(Conversation(question!, ""));
                        setState(() {});

                        int index = keywords.indexWhere((keyword) =>
                            question.toLowerCase().contains(keyword));
                        if (index != -1) {
                          conversations.last = Conversation(
                              conversations.last.question, responses[index]);
                        } else {}
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
