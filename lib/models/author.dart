class Author {
  final String name;
  final String email;
  final String? twitter;

  Author({required this.name, required this.email, this.twitter});

  Author.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        twitter = json['twitter'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    if (twitter != null) {
      data['twitter'] = twitter;
    }
    return data;
  }

  @override
  bool operator ==(Object other) {
    return other is Author && email == other.email;
  }

  @override
  int get hashCode => email.hashCode;
}
