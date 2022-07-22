import 'dart:convert';

class Category {
  final String? name;
  final String? picture;
  Category({
    required this.name,
    required this.picture,
  });

  Category copyWith({
    required String name,
    required String picture,
  }) {
    return Category(
      name: name,
      picture: picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'picture': picture,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      picture: map['picture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(name: $name, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.name == name && other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ picture.hashCode;
}
