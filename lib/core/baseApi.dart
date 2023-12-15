
abstract class BaseApi {
  Future<dynamic> get(String url, {Map<String, dynamic> params});
  Future<dynamic> post(String url, {Map<String, dynamic> params});
  Future<dynamic> put(String url, {Map<String, dynamic> params});
  Future<dynamic> delete(String url, {Map<String, dynamic> params});
  Future<dynamic> patch(String url, {Map<String, dynamic> params});
}