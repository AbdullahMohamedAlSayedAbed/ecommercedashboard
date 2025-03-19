import 'package:ecommercedashboard/core/helper/show_custom_toast.dart';
import 'package:ecommercedashboard/core/widgets/custom_progress_h_u_d.dart';
import 'package:ecommercedashboard/features/add_product/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:ecommercedashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          showCustomToast(message: 'product added successfully', type: ToastType.success);
        }else if (state is AddProductFailure) {
          showCustomToast(message: state.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody());
      },
    );
  }
}
