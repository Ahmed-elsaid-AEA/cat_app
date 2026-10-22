abstract class ApiConumer {
  Future<dynamic> get({required String path});
  Future<dynamic> post({required String path, required dynamic body});
  Future<dynamic> put({required String path, required dynamic body});
  Future<dynamic> delete({required String path});
}
