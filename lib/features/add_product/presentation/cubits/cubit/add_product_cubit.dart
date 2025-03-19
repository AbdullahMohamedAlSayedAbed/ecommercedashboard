import 'package:bloc/bloc.dart';
import 'package:ecommercedashboard/core/repos/images_repo/images_repo.dart';
import 'package:ecommercedashboard/core/repos/product_repo/product_repo.dart';
import 'package:ecommercedashboard/features/add_product/domin/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductEntity) async {
    emit(AddProductLoading());
    final imageUrl = await imagesRepo.uploadImage(addProductEntity.image);
    imageUrl.fold((l) => emit(AddProductFailure(l.message)), (url) async {
      addProductEntity.imageUrl = url;
      var product = await productsRepo.addProduct(addProductEntity);
      product.fold((l) => emit(AddProductFailure(l.message)), (r) {
        emit(AddProductSuccess());
      });
    });
  }
}
