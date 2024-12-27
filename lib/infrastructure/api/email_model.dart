class Email {
  Email({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  String name;
  String email;
  String subject;
  String message;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        name: json["name"],
        email: json["email"],
        subject: json["subject"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "subject": subject,
        "message": message,
      };
}
