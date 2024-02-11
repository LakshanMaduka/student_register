// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  String name;
  String email;
  String phoneNumber;
  String? gender;
  String birthday;
  String address;
  String id;
  Student({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.gender,
    required this.birthday,
    required this.address,
    required this.id,
  });

  Student copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? gender,
    String? birthday,
    String? address,
    String? id,
  }) {
    return Student(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthday': birthday,
      'address': address,
      'id': id,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      gender: map['gender'] != null ? map['gender'] as String : null,
      birthday: map['birthday'] as String,
      address: map['address'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(name: $name, email: $email, phoneNumber: $phoneNumber, gender: $gender, birthday: $birthday, address: $address, id: $id)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.gender == gender &&
        other.birthday == birthday &&
        other.address == address &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        gender.hashCode ^
        birthday.hashCode ^
        address.hashCode ^
        id.hashCode;
  }
}
