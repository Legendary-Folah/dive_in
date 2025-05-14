class DummyModel {
  String? title;
  String? subTitle;
  String? id;

  DummyModel({this.title, this.subTitle, this.id});

  DummyModel.fromJson(Map<String, dynamic> json) {
    DummyModel(
      title: json['title'],
      subTitle: json['subTitle'],
      id: json['id'],
    );
  }
}
