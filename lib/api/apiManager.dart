// ignore_for_file: missing_return

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frentic/Home_page.dart';
import 'package:frentic/api/AppConstant.dart';
import 'package:frentic/api/AppUrlConstant.dart';
import 'package:frentic/api/apiresponse/base_response.dart';
import 'package:frentic/api/apiresponse/campaign_response.dart';
import 'package:frentic/api/apiresponse/responseprofile.dart';
import 'package:frentic/api/sharedprefrence.dart';
import 'package:get/get.dart' as navigator;
import 'package:intl/intl.dart';

import 'apiresponse/responsefetchbrans.dart';
import 'apiresponse/responseslider.dart';
import 'apiresponse/responsewallet.dart';

class ApiManager extends ChangeNotifier {
  static bool kTry = true;

  final Dio dio = Dio();

  ///////////////////setVerify Otp Api//////////////////////////

  Future loginApi(String userName) async {
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({'username': userName});
      print(formData.fields);
      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.loginApi,
          data: formData);

      print(formData.fields);

      if (response.statusCode == 200) {
        if (response.data['error_code'].toString() == "1") {
          Fluttertoast.showToast(
              msg: response.data['data'].toString(),
              toastLength: Toast.LENGTH_LONG);
          await SharedPrefManager.savePrefString(AppConstant.NAME, userName);
          await SharedPrefManager.savePrefString(
              AppConstant.OTP, response.data['data'].toString());
        } else {
          Fluttertoast.showToast(msg: "Please register");
        }
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  ///////////////////verify Otp Api//////////////////////////

  Future verifyOtpApi(String userName, String otp) async {
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({
        'username': userName,
        'otp': otp,
      });
      print(formData.fields);
      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.verifyOtpApi,
          data: formData);

      print(formData.fields);

      if (response.statusCode == 200) {
        if (response.data['error_code'].toString() == "1") {
          Fluttertoast.showToast(
              msg: response.data['data'].toString(),
              toastLength: Toast.LENGTH_LONG);
          await SharedPrefManager.savePrefString(
              AppConstant.KEY, response.data['data'].toString());
          await SharedPrefManager.savePreferenceBoolean(true);
          navigator.Get.to(Home());
        }
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  ///////////////////register User Api//////////////////////////

  Future registerUserApi(String name, String phone, String email,
      String address, String latitude, String longitude) async {
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'latitude': latitude,
        'longitude': longitude
      });

      print(formData.fields);

      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.userRegister,
          data: formData);

      print(formData.fields);

      if (response.statusCode == 200) {
        if (response.data['error_code'].toString() == "1") {
          Fluttertoast.showToast(
              msg: response.data['data'].toString(),
              toastLength: Toast.LENGTH_LONG);

          await SharedPrefManager.savePrefString(
              AppConstant.KEY, response.data['data'].toString());

          await SharedPrefManager.savePreferenceBoolean(true);
          ////

          ///
          navigator.Get.to(Home());
        }
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  Future editProfileApi(String publisher_key) async {
    var dio = Dio();

    String key = await SharedPrefManager.getPrefrenceString(AppConstant.KEY);
    print("my key ----> " + key);
    try {
      FormData formData =
          new FormData.fromMap({'key': key, 'publisher_key': publisher_key});

      print(formData.fields);

      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.editProfileApi,
          data: formData);

      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  ///////////////////register User Api//////////////////////////
  ResponseProfile? responseProfile;
  Future<ResponseProfile?> fetchProfileApi() async {
    String key = await SharedPrefManager.getPrefrenceString(AppConstant.KEY);
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({'key': key});

      print(formData.fields);

      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.profileApi,
          data: formData);

      print(formData.fields);
      if (response.statusCode == 200) {
        responseProfile = ResponseProfile.fromJson(response.data);
        if (responseProfile!.errorCode.toString() == "1") {}
        return responseProfile;
      }
    } catch (e) {
      print(e);
    }
  }

  ///////////////////fetchBrandsApi//////////////////////////
  ResponseFetchBrands? responseFetchBrands;
  Future<ResponseFetchBrands?> fetchBrandApi() async {
    String key = await SharedPrefManager.getPrefrenceString(AppConstant.KEY);
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({'key': key});

      print(formData.fields);

      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.fetchBrandsApi,
          data: formData);

      print(formData.fields);

      if (response.statusCode == 200) {
        responseFetchBrands = ResponseFetchBrands?.fromJson(response.data);
        if (responseFetchBrands!.errorCode.toString() == "1") {}
        return responseFetchBrands;
      }
    } catch (e) {
      print(e);
    }
  }

  ///////////////////fetchCampaignsApi//////////////////////////
  Future<List<CampaignResponse>> fetchCampaigns(String campId) async {
    if (responseProfile == null) {
      await fetchProfileApi();
    }
    try {
      final data = responseProfile!.data;
      DateTime date = DateTime(DateTime.now().year, DateTime.now().month, 1);
      DateTime last =
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      String startDate = formatter.format(date);
      String endDate = formatter.format(last);
      FormData formData = new FormData.fromMap({
        'user_id': data!.id,
        'pub_id': "2", //data.publisherKey,
        "camp_ids": campId,
        "start_date": startDate,
        "end_date": endDate,
      });

      print(formData.fields);

      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.campaignApi,
          data: formData);

      print(formData.fields);

      if (response.statusCode == 200) {
        final res = BaseResponse<CampaignResponse>.fromJson(response.data);
        return res.data ?? [];
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  ///////////////////fetchProfileApi//////////////////////////
  ResponseWallet? responseWallet;
  Future<ResponseWallet?> fetchWalletApi() async {
    String key = await SharedPrefManager.getPrefrenceString(AppConstant.KEY);
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({'key': key});

      print(formData.fields);

      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.fetchWalletApi,
          data: formData);

      print(formData.fields);

      if (response.statusCode == 200) {
        responseWallet = ResponseWallet.fromJson(response.data);
        if (responseWallet!.errorCode.toString() == "1") {}
        return responseWallet;
      }
    } catch (e) {
      print(e);
    }
  }

  ///////////////////fetchSliderApi//////////////////////////
  ResponseSlider? responseSlider;
  Future<ResponseSlider?> fetchSliderApi() async {
    String key = await SharedPrefManager.getPrefrenceString(AppConstant.KEY);
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap({'key': key, 'type': "T"});

      print(formData.fields);

      final response = await dio.post(
          AppUrlConstant.baseUrl + AppUrlConstant.fetchSliderApi,
          data: formData);

      print(formData.fields);

      if (response.statusCode == 200) {
        responseSlider = ResponseSlider.fromJson(response.data);
        if (responseSlider!.errorCode.toString() == "1") {}
        return responseSlider;
      }
    } catch (e) {
      print(e);
    }
  }
}
