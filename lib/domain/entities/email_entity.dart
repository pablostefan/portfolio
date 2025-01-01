class EmailEntity {
  String name;
  String email;
  String subject;
  String message;

  EmailEntity({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  factory EmailEntity.fromJson(Map<String, dynamic> json) => EmailEntity(
        name: json["name"],
        email: json["email"],
        subject: json["subject"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": name,
        "user_email": email,
        "user_subject": subject,
        "user_message": message,
      };
}
