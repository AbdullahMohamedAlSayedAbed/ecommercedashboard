import 'dart:io';

import 'package:ecommercedashboard/core/services/fire_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

class FireStorage implements FireStorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extension = b.extension(file.path);
    var fileReference = storageRef.child('$path/$fileName.$extension');
    await fileReference.putFile(file);
    return await fileReference.getDownloadURL();
  }
}
