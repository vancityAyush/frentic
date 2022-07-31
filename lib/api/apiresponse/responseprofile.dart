class ResponseProfile {
  int? errorCode;
  String? responseString;
  Data? data;
  String? data1;
  String? data2;
  String? data3;
  String? data4;

  ResponseProfile(
      {this.errorCode,
      this.responseString,
      this.data,
      this.data1,
      this.data2,
      this.data3,
      this.data4});

  ResponseProfile.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    responseString = json['response_string'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
    }
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data3'] = this.data3;
    data['data4'] = this.data4;
    return data;
  }
}
// publisher_key

class Data {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? appKey;
  String? dob;
  String? age;
  String? gender;
  String? image;
  String? fcmToken;
  String? aadhaarNumber;
  String? aadhaarFront;
  String? aadhaarBack;
  String? panNumber;
  String? panImage;
  String? fbLogin;
  String? gmailLogin;
  String? password;
  String? isVerified;
  String? isKyc;
  String? referalCode;
  String? imeino;
  String? publisherKey;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.appKey,
      this.dob,
      this.age,
      this.gender,
      this.image,
      this.fcmToken,
      this.aadhaarNumber,
      this.aadhaarFront,
      this.aadhaarBack,
      this.panNumber,
      this.panImage,
      this.fbLogin,
      this.gmailLogin,
      this.password,
      this.isVerified,
      this.isKyc,
      this.referalCode,
      this.imeino,
      this.publisherKey,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    appKey = json['app_key'];
    dob = json['dob'];
    age = json['age'];
    gender = json['gender'];
    image = json['image'];
    fcmToken = json['fcm_token'];
    aadhaarNumber = json['aadhaar_number'];
    aadhaarFront = json['aadhaar_front'];
    aadhaarBack = json['aadhaar_back'];
    panNumber = json['pan_number'];
    panImage = json['pan_image'];
    fbLogin = json['fb_login'];
    gmailLogin = json['gmail_login'];
    password = json['password'];
    isVerified = json['is_verified'];
    isKyc = json['is_kyc'];
    referalCode = json['referal_code'];
    imeino = json['imeino'];
    publisherKey = json['publisher_key'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['app_key'] = this.appKey;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['fcm_token'] = this.fcmToken;
    data['aadhaar_number'] = this.aadhaarNumber;
    data['aadhaar_front'] = this.aadhaarFront;
    data['aadhaar_back'] = this.aadhaarBack;
    data['pan_number'] = this.panNumber;
    data['pan_image'] = this.panImage;
    data['fb_login'] = this.fbLogin;
    data['gmail_login'] = this.gmailLogin;
    data['password'] = this.password;
    data['is_verified'] = this.isVerified;
    data['is_kyc'] = this.isKyc;
    data['referal_code'] = this.referalCode;
    data['imeino'] = this.imeino;
    data['publisher_key'] = this.publisherKey;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
