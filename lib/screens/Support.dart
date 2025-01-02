import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['https://www.googleapis.com/auth/gmail.send'],
  );

  Future<void> sendEmail(String userEmail, String content) async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account == null) {
        throw Exception("Google Sign-In failed");
      }
      final GoogleSignInAuthentication auth = await account.authentication;

      final accessToken = AccessToken(
        'Bearer',
        auth.accessToken!,
        DateTime.now().toUtc().add(const Duration(seconds: 3600)),
      );
      final authClient = authenticatedClient(
        http.Client(),
        AccessCredentials(
          accessToken,
          null,
          ['https://www.googleapis.com/auth/gmail.send'],
        ),
      );

      final gmailApi = GmailApi(authClient);

      final message = Message()
        ..raw = base64UrlEncode(utf8.encode(
          'From: $userEmail\n'
          'To: ramatobbo5@gmail.com\n'
          'Subject: Support Request\n\n'
          '$content',
        ));

      await gmailApi.users.messages.send(message, 'me');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message sent successfully!")),
      );
    } catch (e) {
      print("Error sending email: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send email: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help & Support",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.purple.shade50,
                    filled: true,
                    label: const Text("Your Email Address"),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Cannot be empty" : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    fillColor: Colors.purple.shade50,
                    filled: true,
                    label: const Text("Message Content"),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Cannot be empty" : null,
                  maxLines: 5,
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      sendEmail(
                        _emailController.text,
                        _messageController.text,
                      );
                    }
                  },
                  child: const Text("Send Mail"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
