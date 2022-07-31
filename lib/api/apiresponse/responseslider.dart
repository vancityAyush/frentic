class ResponseSlider {
  int? errorCode;
  String? responseString;
  List<Data>? data;
  String? data1;
  String? data2;
  String? data3;
  String? data4;

  ResponseSlider(
      {this.errorCode,
      this.responseString,
      this.data,
      this.data1,
      this.data2,
      this.data3,
      this.data4});

  ResponseSlider.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    responseString = json['response_string'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    data1 = json['data1'];
    data2 = json['data2'];
    data3 = json['data3'];
    data4 = json['data4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['response_string'] = this.responseString;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data3'] = this.data3;
    data['data4'] = this.data4;
    return data;
  }
}

class Data {
  String? id;
  String? image;
  String? goToPage;
  String? ifId;
  String? pagePosition;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Data(
      {this.id,
      this.image,
      this.goToPage,
      this.ifId,
      this.pagePosition,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    goToPage = json['go_to_page'];
    ifId = json['if_id'];
    pagePosition = json['page_position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['go_to_page'] = this.goToPage;
    data['if_id'] = this.ifId;
    data['page_position'] = this.pagePosition;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
