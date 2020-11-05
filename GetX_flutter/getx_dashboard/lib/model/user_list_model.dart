import '../model/userData.dart';
import '../model/adData.dart';

class UserListModel {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<UserData> data;
  AdData ad;

  UserListModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.ad});

  // UserListModel의 argument에 'https://reqres.in/api/login'에서 불러온 json 데이터를 할당.
  UserListModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      // List<UserData> type의 빈 List를 만들어주는것.
      data = new List<UserData>();
      // json['data']가 null이 아니면 여기에 List<UserData>가 들어가있음.
      // 이를 forEach를 이용해 data에 넣어주는 것.
      // UserData의 fromJson 함수를 이용해 data[1].id와 같은 형식으로 data를 return할 수 있음
      json['data'].forEach((v) {
        data.add(UserData.fromJson(v));
      });
    }
    // ad는 List가 아니므로 그냥 List<AdData>가 아닌 AdData로 type을 지정해야함.
    // AdData의 fromJson 형식을 통해 ad.company와 같은 형식으로 data를 불러올 수 있음.
    ad = json['ad'] != null ? AdData.fromJson(json['ad']) : null;
  }

  // 이거는 return이 있기 때문에 getter와 같은 역할
  // fromJson에서 data와 ad에 올바른 형식의 데이터를 담고 이제 이 함수로 불러와주는 것.
  // UserListModel.toJson()으로 호출
  Map<String, dynamic> toJson() {
    // 빈 Map<String, dynamic> type의 data를 만들어줌.
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.ad != null) {
      data['ad'] = this.ad.toJson();
    }
    return data;
  }
}
