class UserLogModel {
  int? id;
  int? userId;
  DateTime? starttime;
  DateTime? endtime;
  String? location;

  UserLogModel({
    this.id,
    this.userId,
    this.starttime,
    this.endtime,
    this.location,
  });

  //function to convrt json data to user model
  factory UserLogModel.fromJson(Map<String, dynamic> json) {
    return UserLogModel(
      id: json['id'],
      userId: json['user_id'],
      starttime: DateTime.parse(json['starttime']),
      endtime: DateTime.parse(json['endtime']),
      location: json['location'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "starttime": starttime!.toIso8601String(),
        "endtime": endtime!.toIso8601String(),
        "location": location,
      };
}
