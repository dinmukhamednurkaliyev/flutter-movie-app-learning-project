class MovieKeywordModel {
  MovieKeywordModel({required this.name, required this.id});

  final String? name;
  final int? id;

  factory MovieKeywordModel.fromJson(Map<String, dynamic> json) {
    return MovieKeywordModel(name: json["name"], id: json["id"]);
  }
}
