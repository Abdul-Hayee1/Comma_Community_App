import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String generateChatId(String uid1, String uid2) {
    return uid1.compareTo(uid2) < 0 ? '${uid1}_$uid2' : '${uid2}_$uid1';
  }

  /// Send a message to a chat
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String receiverId,
    required String messageText,
  }) async {
    final chatRef = _firestore.collection('chats').doc(chatId);
    final timestamp = FieldValue.serverTimestamp();

    await chatRef.set({
      'users': [senderId, receiverId],
      'lastMessage': messageText,
      'lastTimestamp': timestamp,
    }, SetOptions(merge: true));

    // Add message to messages subcollection
    await chatRef.collection('messages').add({
      'senderId': senderId,
      'receiverId': receiverId,
      'message': messageText,
      'timestamp': timestamp,
      'seen': false,
    });
  }

  /// Get real-time chat stream
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
