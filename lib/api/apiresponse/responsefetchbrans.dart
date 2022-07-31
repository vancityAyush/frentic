class ResponseFetchBrands {
  int? errorCode;
  String? responseString;
  List<Data>? data;
  String? data1;
  String? data2;
  String? data3;
  String? data4;

  ResponseFetchBrands(
      {this.errorCode,
      this.responseString,
      this.data,
      this.data1,
      this.data2,
      this.data3,
      this.data4});

  ResponseFetchBrands.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    responseString = json['response_string'];
    if (json['data'] != null) {
      data = [];
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
  Brand? brand;
  List<BrandExtension>? brandExtension;
  List<BrandRemarks>? brandRemarks;
  BrandRating? brandRating;

  Data({
    required this.brand,
    required this.brandExtension,
    required this.brandRemarks,
    required this.brandRating,
  });

  Data.fromJson(Map<String, dynamic> json) {
    brand = (json['brand'] != null ? new Brand.fromJson(json['brand']) : null)!;
    if (json['brand_extension'] != null) {
      brandExtension = <BrandExtension>[];
      json['brand_extension'].forEach((v) {
        brandExtension!.add(new BrandExtension.fromJson(v));
      });
    }
    if (json['brand_remarks'] != null) {
      brandRemarks = <BrandRemarks>[];
      json['brand_remarks'].forEach((v) {
        brandRemarks!.add(new BrandRemarks.fromJson(v));
      });
    }
    brandRating = (json['brand_rating'] != null
        ? new BrandRating.fromJson(json['brand_rating'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.brandExtension != null) {
      data['brand_extension'] =
          this.brandExtension!.map((v) => v.toJson()).toList();
    }
    if (this.brandRemarks != null) {
      data['brand_remarks'] =
          this.brandRemarks!.map((v) => v.toJson()).toList();
    }
    if (this.brandRating != null) {
      data['brand_rating'] = this.brandRating!.toJson();
    }
    return data;
  }
}

class Brand {
  String? id;
  String? name;
  String? brand;
  String? brandImage;
  String? description;
  String? reward;
  String? rewardType;
  String? donondate;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Brand(
      {this.id,
      this.name,
      this.brand,
      this.brandImage,
      this.description,
      this.reward,
      this.rewardType,
      this.donondate,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    brandImage = json['brand_image'];
    description = json['description'];
    reward = json['reward'];
    rewardType = json['reward_type'];
    donondate = json['donondate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['brand_image'] = this.brandImage;
    data['description'] = this.description;
    data['reward'] = this.reward;
    data['reward_type'] = this.rewardType;
    data['donondate'] = this.donondate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class BrandExtension {
  String? tasks;
  String? id;
  String? userId;
  String? brandId;
  String? taskId;
  String? isCompleted;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  BrandExtension(
      {this.tasks,
      this.id,
      this.userId,
      this.brandId,
      this.taskId,
      this.isCompleted,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  BrandExtension.fromJson(Map<String, dynamic> json) {
    tasks = json['tasks'];
    id = json['id'];
    userId = json['user_id'];
    brandId = json['brand_id'];
    taskId = json['task_id'];
    isCompleted = json['is_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tasks'] = this.tasks;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['brand_id'] = this.brandId;
    data['task_id'] = this.taskId;
    data['is_completed'] = this.isCompleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class BrandRemarks {
  String? id;
  String? userId;
  String? brandId;
  String? remarks;
  String? ratings;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? phone;

  BrandRemarks(
      {this.id,
      this.userId,
      this.brandId,
      this.remarks,
      this.ratings,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.phone});

  BrandRemarks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    brandId = json['brand_id'];
    remarks = json['remarks'];
    ratings = json['ratings'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['brand_id'] = this.brandId;
    data['remarks'] = this.remarks;
    data['ratings'] = this.ratings;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class BrandRating {
  String? avg;

  BrandRating({this.avg});

  BrandRating.fromJson(Map<String, dynamic> json) {
    avg = json['avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg'] = this.avg;
    return data;
  }
}
