class UserData {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserData({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  // 이거는 return이 있기 때문에 getter와 같은 역할
  // fromJson에서 UserData에 값을 담고 이 getter를 통해 데이터를 호출
  // UserData.toJson()으로 호출
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}
