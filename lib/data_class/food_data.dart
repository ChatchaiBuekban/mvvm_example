// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Food {
  String? name;
  String? barCodeData;
  double? cal;
  String? imagrUrl;
  Food({
    this.name,
    this.barCodeData,
    this.cal,
    this.imagrUrl,
  });

  Food copyWith({
    String? name,
    String? barCodeData,
    double? cal,
    String? imagrUrl,
  }) {
    return Food(
      name: name ?? this.name,
      barCodeData: barCodeData ?? this.barCodeData,
      cal: cal ?? this.cal,
      imagrUrl: imagrUrl ?? this.imagrUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'barCodeData': barCodeData,
      'cal': cal,
      'imagrUrl': imagrUrl,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] != null ? map['name'] as String : null,
      barCodeData:
          map['barCodeData'] != null ? map['barCodeData'] as String : null,
      cal: map['cal'] != null ? map['cal'] as double : null,
      imagrUrl: map['imagrUrl'] != null ? map['imagrUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Food(name: $name, barCodeData: $barCodeData, cal: $cal, imagrUrl: $imagrUrl)';
  }

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.barCodeData == barCodeData &&
        other.cal == cal &&
        other.imagrUrl == imagrUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        barCodeData.hashCode ^
        cal.hashCode ^
        imagrUrl.hashCode;
  }
}
