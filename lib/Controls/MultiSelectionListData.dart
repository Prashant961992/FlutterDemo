class MultiSelectionListData {
  List<CountryList> countryList;

  MultiSelectionListData({this.countryList});

  MultiSelectionListData.fromJson(Map<String, dynamic> json) {
    if (json['countryList'] != null) {
      countryList = new List<CountryList>();
      json['countryList'].forEach((v) {
        countryList.add(new CountryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countryList != null) {
      data['countryList'] = this.countryList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryList {
  String name;
  String code;

  CountryList({this.name, this.code});

  CountryList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
