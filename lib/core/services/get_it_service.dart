
import 'package:ecommercedashboard/core/repos/images_repo/images_repo.dart';
import 'package:ecommercedashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:ecommercedashboard/core/repos/product_repo/product_repo.dart';
import 'package:ecommercedashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:ecommercedashboard/core/services/database_service.dart';
import 'package:ecommercedashboard/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

import 'fire_storage.dart';
import 'fire_storage_service.dart';

final getIt = GetIt.instance;

void setupSingleton() {
  getIt.registerSingleton<FireStorageService>(FireStorage());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(fireStorageService: getIt.get<FireStorageService>()));
  getIt.registerSingleton<ProductsRepo>(ProductRepoImpl(
    getIt.get<DatabaseService>(),
  ));
}
