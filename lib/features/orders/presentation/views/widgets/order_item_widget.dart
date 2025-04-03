import 'package:ecommercedashboard/core/utils/app_style.dart';
import 'package:ecommercedashboard/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';

// Assuming your model classes (OrderModel, ShippingAddressModel, OrderProductModel) are already imported

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;

  const OrderItemWidget({super.key, required this.order});

  // Define custom TextStyles for consistency
  final TextStyle headerStyle = AppStyle.body16Semibold;
  final TextStyle subHeaderStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  final TextStyle bodyStyle = AppStyle.body13Semibold;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID and Total Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order ID: ${order.uID}", style: headerStyle),
                Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      "\$${order.totalPrice.toStringAsFixed(2)}",
                      style: headerStyle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Shipping Address Section
            Text(
              "Shipping Address",
              style: headerStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(order.shippingAddress.name ?? '', style: bodyStyle),
            Text(
              "${order.shippingAddress.address ?? ''}, ${order.shippingAddress.city ?? ''}",
              style: bodyStyle,
            ),
            const SizedBox(height: 8),

            // Payment Method Section
            Row(
              children: [
                const Icon(Icons.payment, color: Colors.blue),
                const SizedBox(width: 4),
                Text("Payment: ${order.paymentMethod}", style: headerStyle),
              ],
            ),
            const SizedBox(height: 12),

            // Order Products Section Header
            Text(
              "Products",
              style: headerStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // List of Ordered Products
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.orderProducts.length,
              separatorBuilder:
                  (context, index) =>
                      const Divider(color: Colors.grey, height: 16),
              itemBuilder: (context, index) {
                final product = order.orderProducts[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  leading: SizedBox(
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        product.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(product.name, style: subHeaderStyle),
                  subtitle: Text(
                    "Code: ${product.code}\nQuantity: ${product.quantity}",
                    style: bodyStyle,
                  ),
                  trailing: Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: headerStyle,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
