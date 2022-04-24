class Author {
  final String name;
  final String email;
  final String? twitter;

  Author({required this.name, required this.email, this.twitter});

  @override
  bool operator ==(Object other) {
    return other is Author && email == other.email;
  }

  @override
  int get hashCode => email.hashCode;
}
