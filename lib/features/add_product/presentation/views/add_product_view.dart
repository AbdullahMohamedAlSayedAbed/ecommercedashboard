import 'package:ecommercedashboard/core/helper/custom_app_bar.dart';
import 'package:ecommercedashboard/core/repos/images_repo/images_repo.dart';
import 'package:ecommercedashboard/core/repos/product_repo/product_repo.dart';
import 'package:ecommercedashboard/core/services/get_it_service.dart';
import 'package:ecommercedashboard/features/add_product/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:ecommercedashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AddProductCubit(
            getIt.get<ImagesRepo>(),
            getIt.get<ProductsRepo>(),
          ),
      child: Scaffold(
        appBar: customAppBar(title: 'Add Product'),
        body: AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}
