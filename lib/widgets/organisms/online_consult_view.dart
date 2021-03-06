import '/models/user_model.dart';
import 'package:provider/provider.dart';

import '/controllers/message.dart';
import '/models/doctor.dart';
import '../../views/dashboard/chat.dart';
import '/widgets/atoms/button.dart';
import 'package:flutter/material.dart';

class OnlineConsultView extends StatelessWidget {
  final Doctor doctor;
  OnlineConsultView({Key? key, required this.doctor}) : super(key: key);
  MessageController messageController = MessageController();

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    String convoID = messageController.getConversationID(
        currentUser.user.userId!, doctor.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "You will get instant service from Dr Rebbeka",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          "Service charge:  \$49.00/hours",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          "Service: you will get instant consultation through chat/voice/video call ",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Button(
          buttonText: 'Get Instant Service',
          buttonClick: () => Navigator.pushNamed(
            context,
            ChatScreen.routeName,
            arguments: ChatScreenArguments(doctor: doctor, convoID: convoID),
          ),
        ),
      ],
    );
  }
}
