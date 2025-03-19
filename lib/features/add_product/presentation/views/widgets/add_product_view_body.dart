import 'dart:io';
import 'package:ecommercedashboard/core/helper/show_custom_toast.dart';
import 'package:ecommercedashboard/core/widgets/custom_buttton.dart';
import 'package:ecommercedashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommercedashboard/features/add_product/domin/entities/add_product_input_entity.dart';
import 'package:ecommercedashboard/features/add_product/domin/entities/review_entity.dart';
import 'package:ecommercedashboard/features/add_product/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:ecommercedashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:ecommercedashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:ecommercedashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationMonth, calories, unitAmount;
  bool isFeatured = false, isOrganic = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormField(
                onSaved: (value) => name = value!,
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) => price = num.parse(value!),
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) => expirationMonth = num.parse(value!),
                hintText: 'Expiration Month',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) => calories = num.parse(value!),
                hintText: 'number of calories',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) => unitAmount = num.parse(value!),
                hintText: 'unit amount',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) => code = value!.toLowerCase(),
                hintText: 'Product Code',
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) => description = value!,
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              ImageField(
                onImagePicked: (value) {
                  fileImage = value;
                },
              ),
              SafeArea(
                child: CustomButton(
                  onTap: () {
                    if (fileImage != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        AddProductInputEntity
                        addProductInputEntity = AddProductInputEntity(
                          title: name,
                          code: code,
                          reviews: [
                            ReviewEntity(
                              name: "Abdullah",
                              image:
                                  "https://firebasestorage.googleapis.com/v0/b/fruits-hup-ea3fb.appspot.com/o/images%2FczNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvZnJwaW5lYXBwbGVfZnJ1aXRfd2hpdGVfYmFja2dyb3VuZC1pbWFnZS1qb2I2MjFfMS5wbmc.jpg..jpg?alt=media&token=811e117c-4fcd-46e0-9418-d82e230319fd",
                              ratting: "4",
                              data: DateTime.now().toString(),
                              reviewDescription: "this is a good product",
                            ),
                          ],
                          description: description,
                          price: price,
                          isFeatured: isFeatured,
                          image: fileImage!,
                          isOrganic: isOrganic,
                          expirationsMonth: expirationMonth.toInt(),
                          numberOfCalories: calories.toInt(),
                          unitAmount: unitAmount.toInt(),
                        );
                        context.read<AddProductCubit>().addProduct(
                          addProductInputEntity,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      showCustomToast(
                        message: 'Please select an image',
                        type: ToastType.error,
                      );
                    }
                  },
                  text: 'Add Product',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
