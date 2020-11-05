class AdData {
  String company;
  String url;
  String text;

  AdData({this.company, this.url, this.text});

  AdData.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    url = json['url'];
    text = json['text'];
  }

  // 이거는 return이 있기 때문에 getter와 같은 역할
  // fromJson에서 AdData에 값을 담고 이 getter를 통해 데이터를 호출
  // AdData.toJson()으로 호출
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['company'] = this.company;
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
