import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comma_community_app/modules/main/chat/view/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showConversationBottomModal(
  BuildContext context, {
  required String currentUserId,
  required String otherUserId,
  required String otherUserName,
  required String otherUserImageUrl,
  required String currentUserName,
  required currentUserImageUrl,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 36, 38, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return _ConversationModalSheet(
        currentUserId: currentUserId,
        otherUserId: otherUserId,
        otherUserName: otherUserName,
        otherUserImageUrl: otherUserImageUrl,
      );
    },
  );
}

class _ConversationModalSheet extends StatefulWidget {
  final String currentUserId;
  final String otherUserId;
  final String otherUserName;
  final String otherUserImageUrl;

  const _ConversationModalSheet({
    required this.currentUserId,
    required this.otherUserId,
    required this.otherUserName,
    required this.otherUserImageUrl,
  });

  @override
  State<_ConversationModalSheet> createState() =>
      _ConversationModalSheetState();
}

class _ConversationModalSheetState extends State<_ConversationModalSheet> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();

  late String _chatId;

  @override
  void initState() {
    super.initState();
    _chatId =
        _chatService.generateChatId(widget.currentUserId, widget.otherUserId);
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    await _chatService.sendMessage(
      chatId: _chatId,
      senderId: widget.currentUserId,
      receiverId: widget.otherUserId,
      messageText: _messageController.text.trim(),
    );

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.93,
      child: SafeArea(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                    const Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(widget.otherUserImageUrl),
              ),
              const SizedBox(height: 5),
              Text(
                widget.otherUserName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Chat Messages
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _chatService.getMessages(_chatId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final messages = snapshot.data?.docs ?? [];

                    return ListView.builder(
                      reverse: false,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        final isMe = msg['senderId'] == widget.currentUserId;

                        return Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isMe ? Colors.blue[600] : Colors.grey[700],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              msg['message'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              // Input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.add, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: _messageController,
                          onSubmitted: (_) => _sendMessage(),
                          decoration: InputDecoration(
                            hintText: "Message ${widget.otherUserName}",
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 16.sp),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
