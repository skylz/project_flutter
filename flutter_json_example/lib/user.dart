import 'package:json_annotation/json_annotation.dart';
import 'address.dart';

// user는 class의 이름을 따온것.
// part class.g.dart
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String name;
  final String email;
  @JsonKey(name: 'created_Time')
  final int createdTime;
  final Address address;

  User({this.name, this.email, this.createdTime, this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
