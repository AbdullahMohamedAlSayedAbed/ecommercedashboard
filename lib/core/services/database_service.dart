abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<dynamic> getData({
    required String path,
    String documentId,
    Map<String, dynamic>? query,
  });
  Stream<dynamic> streamData({
    required String path,
    Map<String, dynamic>? query,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
  // Future<void> updateData(String path, Map<String, dynamic> data);
  // Future<void> deleteData(String path);
  // Future<T?> getData<T>(String path);
}
