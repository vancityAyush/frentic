// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.campaigns,
    required this.lastId,
    required this.pagination,
  });

  List<Campaign> campaigns;
  int lastId;
  Pagination pagination;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        campaigns: List<Campaign>.from(
            json["campaigns"].map((x) => Campaign.fromJson(x))),
        lastId: json["lastId"],
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "campaigns": List<dynamic>.from(campaigns.map((x) => x.toJson())),
        "lastId": lastId,
        "pagination": pagination.toJson(),
      };
}

class Campaign {
  Campaign({
    required this.device,
    required this.os,
    required this.cities,
    required this.citiesExclude,
    required this.isps,
    required this.region,
    required this.flow,
    required this.title,
    required this.url,
    required this.currency,
    required this.status,
    required this.cshp,
    required this.dcla,
    required this.created,
    required this.modified,
    required this.payouts,
    required this.creatives,
    required this.iurl,
    required this.hashId,
    required this.advertiserId,
    required this.id,
    required this.previewUrl,
    required this.categories,
    required this.commModel,
    required this.geo,
    required this.blockedPubs,
    required this.fallbackUrl,
    required this.convTracking,
    required this.convTrackingDomain,
    required this.visibility,
    required this.subIdsBlocked,
    required this.subIdsAllowed,
    required this.blacklistPostbackPubs,
    required this.whitelistPostbackPubs,
    required this.redirectType,
    required this.cancelBlockedPbConv,
    required this.defaultLpName,
    required this.allowTrafficDiversion,
    required this.description,
    required this.kpi,
    required this.osVer,
    required this.dclv,
    required this.ucls,
  });

  List<Device> device;
  List<O> os;
  List<Device>? cities;
  List<dynamic> citiesExclude;
  List<Device> isps;
  List<Device> region;
  List<dynamic> flow;
  String title;
  String url;
  Currency? currency;
  Status? status;
  Cshp? cshp;
  Dcla? dcla;
  DateTime? created;
  DateTime? modified;
  List<Payout>? payouts;
  List<dynamic>? creatives;
  String? iurl;
  String? hashId;
  AdvertiserId? advertiserId;
  int? id;
  String? previewUrl;
  List<dynamic> categories;
  Model? commModel;
  List<Geo> geo;
  List<dynamic> blockedPubs;
  String fallbackUrl;
  ConvTracking? convTracking;
  ConvTrackingDomain? convTrackingDomain;
  Visibility? visibility;
  List<dynamic> subIdsBlocked;
  List<dynamic> subIdsAllowed;
  List<dynamic> blacklistPostbackPubs;
  List<dynamic> whitelistPostbackPubs;
  String redirectType;
  int cancelBlockedPbConv;
  DefaultLpName? defaultLpName;
  int allowTrafficDiversion;
  String description;
  String kpi;
  OsVer? osVer;
  String dclv;
  int ucls;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        device:
            List<Device>.from(json["device"].map((x) => deviceValues.map[x])),
        os: List<O>.from(json["os"].map((x) => oValues.map[x])),
        cities: json["cities"] == null
            ? null
            : List<Device>.from(json["cities"].map((x) => deviceValues.map[x])),
        citiesExclude: List<dynamic>.from(json["citiesExclude"].map((x) => x)),
        isps: List<Device>.from(json["isps"].map((x) => deviceValues.map[x])),
        region:
            List<Device>.from(json["region"].map((x) => deviceValues.map[x])),
        flow: List<dynamic>.from(json["flow"].map((x) => x)),
        title: json["title"],
        url: json["url"],
        currency: currencyValues.map[json["currency"]],
        status: statusValues.map[json["status"]],
        cshp: cshpValues.map[json["cshp"]],
        dcla: dclaValues.map[json["dcla"]],
        created: DateTime.parse(json["created"]),
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        payouts:
            List<Payout>.from(json["payouts"].map((x) => Payout.fromJson(x))),
        creatives: List<dynamic>.from(json["creatives"].map((x) => x)),
        iurl: json["iurl"],
        hashId: json["hashId"],
        advertiserId: advertiserIdValues.map[json["advertiserId"]],
        id: json["id"],
        previewUrl: json["previewUrl"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        commModel: modelValues.map[json["commModel"]],
        geo: List<Geo>.from(json["geo"].map((x) => geoValues.map[x])),
        blockedPubs: List<dynamic>.from(json["blockedPubs"].map((x) => x)),
        fallbackUrl: json["fallbackUrl"],
        convTracking: convTrackingValues.map[json["convTracking"]],
        convTrackingDomain:
            convTrackingDomainValues.map[json["convTrackingDomain"]],
        visibility: visibilityValues.map[json["visibility"]],
        subIdsBlocked: List<dynamic>.from(json["subIdsBlocked"].map((x) => x)),
        subIdsAllowed: List<dynamic>.from(json["subIdsAllowed"].map((x) => x)),
        blacklistPostbackPubs:
            List<dynamic>.from(json["blacklistPostbackPubs"].map((x) => x)),
        whitelistPostbackPubs:
            List<dynamic>.from(json["whitelistPostbackPubs"].map((x) => x)),
        redirectType: json["redirectType"],
        cancelBlockedPbConv: json["cancelBlockedPbConv"],
        defaultLpName: defaultLpNameValues.map[json["defaultLpName"]],
        allowTrafficDiversion: json["allowTrafficDiversion"],
        description: json["description"] == null ? null : json["description"],
        kpi: json["kpi"] == null ? null : json["kpi"],
        osVer: json["os_ver"] == null ? null : OsVer.fromJson(json["os_ver"]),
        dclv: json["dclv"] == null ? null : json["dclv"],
        ucls: json["ucls"] == null ? null : json["ucls"],
      );

  Map<String, dynamic> toJson() => {
        "device":
            List<dynamic>.from(device.map((x) => deviceValues.reverse[x])),
        "os": List<dynamic>.from(os.map((x) => oValues.reverse[x])),
        "cities": cities == null
            ? null
            : List<dynamic>.from(cities!.map((x) => deviceValues.reverse[x])),
        "citiesExclude": List<dynamic>.from(citiesExclude.map((x) => x)),
        "isps": List<dynamic>.from(isps.map((x) => deviceValues.reverse[x])),
        "region":
            List<dynamic>.from(region.map((x) => deviceValues.reverse[x])),
        "flow": List<dynamic>.from(flow.map((x) => x)),
        "title": title,
        "url": url,
        "currency": currencyValues.reverse[currency],
        "status": statusValues.reverse[status],
        "cshp": cshpValues.reverse[cshp],
        "dcla": dclaValues.reverse[dcla],
        "created": created!.toIso8601String(),
        "modified": modified == null ? null : modified!.toIso8601String(),
        "payouts": List<dynamic>.from(payouts!.map((x) => x.toJson())),
        "creatives": List<dynamic>.from(creatives!.map((x) => x)),
        "iurl": iurl,
        "hashId": hashId,
        "advertiserId": advertiserIdValues.reverse[advertiserId],
        "id": id,
        "previewUrl": previewUrl,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "commModel": modelValues.reverse[commModel],
        "geo": List<dynamic>.from(geo.map((x) => geoValues.reverse[x])),
        "blockedPubs": List<dynamic>.from(blockedPubs.map((x) => x)),
        "fallbackUrl": fallbackUrl,
        "convTracking": convTrackingValues.reverse[convTracking],
        "convTrackingDomain":
            convTrackingDomainValues.reverse[convTrackingDomain],
        "visibility": visibilityValues.reverse[visibility],
        "subIdsBlocked": List<dynamic>.from(subIdsBlocked.map((x) => x)),
        "subIdsAllowed": List<dynamic>.from(subIdsAllowed.map((x) => x)),
        "blacklistPostbackPubs":
            List<dynamic>.from(blacklistPostbackPubs.map((x) => x)),
        "whitelistPostbackPubs":
            List<dynamic>.from(whitelistPostbackPubs.map((x) => x)),
        "redirectType": redirectType,
        "cancelBlockedPbConv": cancelBlockedPbConv,
        "defaultLpName": defaultLpNameValues.reverse[defaultLpName],
        "allowTrafficDiversion": allowTrafficDiversion,
        "description": description == null ? null : description,
        "kpi": kpi == null ? null : kpi,
        "os_ver": osVer == null ? null : osVer!.toJson(),
        "dclv": dclv == null ? null : dclv,
        "ucls": ucls == null ? null : ucls,
      };
}

enum AdvertiserId {
  THE_607833_EAF7_F5_B70_B565_A3188,
  THE_605_C51_F9_B9_C0390_EEC7_CCD20,
  THE_602_BA9193_C211_E593_C190_A74
}

final advertiserIdValues = EnumValues({
  "602ba9193c211e593c190a74": AdvertiserId.THE_602_BA9193_C211_E593_C190_A74,
  "605c51f9b9c0390eec7ccd20": AdvertiserId.THE_605_C51_F9_B9_C0390_EEC7_CCD20,
  "607833eaf7f5b70b565a3188": AdvertiserId.THE_607833_EAF7_F5_B70_B565_A3188
});

enum Device { ALL, MOBILE, TABLET }

final deviceValues = EnumValues(
    {"all": Device.ALL, "mobile": Device.MOBILE, "tablet": Device.TABLET});

enum Model { CPA }

final modelValues = EnumValues({"cpa": Model.CPA});

enum ConvTracking { POSTBACK, IFRAME_HTTPS }

final convTrackingValues = EnumValues({
  "iframe_https": ConvTracking.IFRAME_HTTPS,
  "postback": ConvTracking.POSTBACK
});

enum ConvTrackingDomain { AZZURE_GOTRACKIER_COM, TRK_MEDIADEL_IN }

final convTrackingDomainValues = EnumValues({
  "azzure.gotrackier.com": ConvTrackingDomain.AZZURE_GOTRACKIER_COM,
  "trk.mediadel.in": ConvTrackingDomain.TRK_MEDIADEL_IN
});

enum Cshp { APPROVED }

final cshpValues = EnumValues({"approved": Cshp.APPROVED});

enum Currency { INR, USD }

final currencyValues = EnumValues({"INR": Currency.INR, "USD": Currency.USD});

enum Dcla { NONE }

final dclaValues = EnumValues({"none": Dcla.NONE});

enum DefaultLpName { DEFAULT }

final defaultLpNameValues = EnumValues({"Default": DefaultLpName.DEFAULT});

enum Geo { ALL, IN }

final geoValues = EnumValues({"ALL": Geo.ALL, "IN": Geo.IN});

enum O { ALL, ANDROID }

final oValues = EnumValues({"all": O.ALL, "android": O.ANDROID});

class OsVer {
  OsVer({
    required this.android,
  });

  Android android;

  factory OsVer.fromJson(Map<String, dynamic> json) => OsVer(
        android: Android.fromJson(json["android"]),
      );

  Map<String, dynamic> toJson() => {
        "android": android.toJson(),
      };
}

class Android {
  Android({
    required this.min,
  });

  String min;

  factory Android.fromJson(Map<String, dynamic> json) => Android(
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
      };
}

class Payout {
  Payout({
    required this.region,
    required this.city,
    required this.id,
    required this.model,
    required this.revenue,
    required this.created,
    required this.currency,
    required this.campaignId,
    required this.landingPages,
    required this.pubIds,
    required this.payout,
    required this.geo,
    required this.allowedValues,
    required this.modified,
  });

  List<dynamic> region;
  List<dynamic> city;
  String id;
  Model? model;
  double revenue;
  DateTime created;
  Currency? currency;
  String campaignId;
  List<dynamic> landingPages;
  List<dynamic> pubIds;
  double payout;
  List<Geo> geo;
  List<dynamic> allowedValues;
  DateTime? modified;

  factory Payout.fromJson(Map<String, dynamic> json) => Payout(
        region: List<dynamic>.from(json["region"].map((x) => x)),
        city: List<dynamic>.from(json["city"].map((x) => x)),
        id: json["_id"],
        model: modelValues.map[json["model"]],
        revenue: json["revenue"].toDouble(),
        created: DateTime.parse(json["created"]),
        currency: currencyValues.map[json["currency"]],
        campaignId: json["campaignId"],
        landingPages: List<dynamic>.from(json["landingPages"].map((x) => x)),
        pubIds: List<dynamic>.from(json["pubIds"].map((x) => x)),
        payout: json["payout"].toDouble(),
        geo: List<Geo>.from(json["geo"].map((x) => geoValues.map[x])),
        allowedValues: List<dynamic>.from(json["allowedValues"].map((x) => x)),
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
      );

  Map<String, dynamic> toJson() => {
        "region": List<dynamic>.from(region.map((x) => x)),
        "city": List<dynamic>.from(city.map((x) => x)),
        "_id": id,
        "model": modelValues.reverse[model],
        "revenue": revenue,
        "created": created.toIso8601String(),
        "currency": currencyValues.reverse[currency],
        "campaignId": campaignId,
        "landingPages": List<dynamic>.from(landingPages.map((x) => x)),
        "pubIds": List<dynamic>.from(pubIds.map((x) => x)),
        "payout": payout,
        "geo": List<dynamic>.from(geo.map((x) => geoValues.reverse[x])),
        "allowedValues": List<dynamic>.from(allowedValues.map((x) => x)),
        "modified": modified == null ? null : modified!.toIso8601String(),
      };
}

enum Status { ACTIVE, PAUSED }

final statusValues =
    EnumValues({"active": Status.ACTIVE, "paused": Status.PAUSED});

enum Visibility { PERMISSION, PRIVATE, PUBLIC }

final visibilityValues = EnumValues({
  "permission": Visibility.PERMISSION,
  "private": Visibility.PRIVATE,
  "public": Visibility.PUBLIC
});

class Pagination {
  Pagination({
    required this.perPage,
  });

  int perPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        perPage: json["perPage"],
      );

  Map<String, dynamic> toJson() => {
        "perPage": perPage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
