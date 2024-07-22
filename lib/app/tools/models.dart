class CGDiaryModel {
  int? id;
  String? location;
  String? content;
  int? createTime;

  CGDiaryModel({this.id, this.content, this.location, this.createTime});

  CGDiaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    content = json['content'];
    createTime = json["createTime"];
  }
}

class CGMaterialsModel {
  int? id;
  double? amount;
  String? name;

  int? createTime;

  CGMaterialsModel({this.id, this.name, this.amount, this.createTime});

  CGMaterialsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    createTime = json["createTime"];
  }
}
