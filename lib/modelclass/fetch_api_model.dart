class FetchApiModel {
  String? message;
  List<Data>? data;
  bool? success;

  FetchApiModel({this.message, this.data, this.success});

  FetchApiModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    return data;
  }
}

class Data {
  String? image;
  String? title;
  String? body;
  String? timestamp;

  Data({this.image, this.title, this.body, this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    body = json['body'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['body'] = this.body;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
