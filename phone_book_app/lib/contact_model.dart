// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  List<ContactElement> contacts;

  Contact({
    required this.contacts,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    contacts: List<ContactElement>.from(json["contacts"].map((x) => ContactElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
  };
}

class ContactElement {
  String id;
  String name;
  String phone;
  String avatar;

  ContactElement({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
  });

  factory ContactElement.fromJson(Map<String, dynamic> json) => ContactElement(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "avatar": avatar,
  };
}
