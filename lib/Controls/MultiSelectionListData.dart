class CountryList {
  String name;
  String code;
  bool isSelected;

  CountryList({this.name, this.code,this.isSelected});

  CountryList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['isSelected'] = this.isSelected;
    return data;
  }
}
