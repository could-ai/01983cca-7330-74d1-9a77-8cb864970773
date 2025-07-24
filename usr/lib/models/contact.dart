import 'package:uuid/uuid.dart';

enum ContactStatus { online, offline, typing }

class Contact {
  final String id;
  final String name;
  final String? profilePictureUrl;
  final ContactStatus status;

  Contact({
    String? id,
    required this.name,
    this.profilePictureUrl,
    this.status = ContactStatus.offline,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'profilePictureUrl': profilePictureUrl,
        'status': status.name,
      };

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json['id'] as String,
        name: json['name'] as String,
        profilePictureUrl: json['profilePictureUrl'] as String?,
        status: ContactStatus.values.byName(json['status'] as String),
      );
}
