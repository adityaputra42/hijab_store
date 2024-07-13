import 'package:barakallah_hijab/core/network/api_client.dart';
import 'package:barakallah_hijab/core/network/api_response_data.dart';

import '../../../../core/network/request_header.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResponseData> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<ApiResponseData> login({
    required String email,
    required String password,
  });
  Future<ApiResponseData> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiClient client = ApiClient();
  @override
  Future<ApiResponseData> getCurrentUserData() async {
    try {
      RequestHeaders requestHeaders = RequestHeaders();
      client.headers = requestHeaders.setAuthHeaders();
      String url = 'auth/identity/users/me';
      var response = await client.get(url);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponseData> login(
      {required String email, required String password}) async {
    try {
      RequestHeaders requestHeaders = RequestHeaders();
      client.headers = requestHeaders.setAuthHeaders();
      var body = {
        "email": email,
        "password": password,
      };
      String url = 'auth/identity/login';
      var response = await client.post(url, body);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponseData> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      RequestHeaders requestHeaders = RequestHeaders();
      client.headers = requestHeaders.setAuthHeaders();
      var body = {
        "username": name,
        "email": email,
        "password": password,
      };
      String url = 'auth/identity/register';
      var response = await client.post(url, body);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
