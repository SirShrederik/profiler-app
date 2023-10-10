class NamesList {
  int count;
  String name;
  int? age;
  String countryId;

  NamesList({
    required this.count,
    required this.name,
    required this.age,
    required this.countryId,
  });

  factory NamesList.fromJson(Map<String, dynamic> json) => NamesList(
        count: json["count"],
        name: json["name"],
        age: json["age"],
        countryId: json["countryId"],
      );
  Map<String, dynamic> toJson() => {
        "count": count,
        'name': name,
        'age': age,
        'countryId': countryId,
      };
}
