import 'package:couldai_user_app/models/message.dart';

class ChatConversation {
  final String id;
  final String participantId;
  final String participantName;
  final String lastMessageContent;
  final DateTime lastMessageTimestamp;
  final bool hasUnreadMessages;

  ChatConversation({
    required this.id,
    required this.participantId,
    required this.participantName,
    required this.lastMessageContent,
    required this.lastMessageTimestamp,
    this.hasUnreadMessages = false,
  });

  // For local storage, we might need toJson/fromJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'participantId': participantId,
        'participantName': participantName,
        'lastMessageContent': lastMessageContent,
        'lastMessageTimestamp': lastMessageTimestamp.toIso8601String(),
        'hasUnreadMessages': hasUnreadMessages,
      };

  factory ChatConversation.fromJson(Map<String, dynamic> json) =>
      ChatConversation(
        id: json['id'] as String,
        participantId: json['participantId'] as String,
        participantName: json['participantName'] as String,
        lastMessageContent: json['lastMessageContent'] as String,
        lastMessageTimestamp: DateTime.parse(json['lastMessageTimestamp'] as String),
        hasUnreadMessages: json['hasUnreadMessages'] as bool,
      );
}
