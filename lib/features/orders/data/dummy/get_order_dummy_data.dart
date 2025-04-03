// Method to generate a sample OrderModel with all required data
import 'package:ecommercedashboard/features/orders/data/models/order_model.dart';
import 'package:ecommercedashboard/features/orders/data/models/order_product_model.dart';
import 'package:ecommercedashboard/features/orders/data/models/shipping_address_model.dart';

OrderModel getSampleOrder() {
  return OrderModel(
    uID: "ORD12345",
    totalPrice: 149.99,
    paymentMethod: "Credit Card",
    shippingAddress: ShippingAddressModel(
      name: "John Doe",
      address: "1234 Elm Street",
      city: "New York",
      state: "NY",
      email: "iBtM1@example.com",
      phone: "123-456-7890",
      addressDetails: "Apt 5B, Near Central Park",
    ),
    orderProducts: [
      OrderProductModel(
        name: "Nike Running Shoes",
        code: "NK-001",
        price: 79.99,
        quantity: 1,
        imageUrl: "https://picsum.photos/150",
      ),
      OrderProductModel(
        name: "Adidas Sweatshirt",
        code: "AD-002",
        price: 69.99,
        quantity: 1,
        imageUrl: "https://picsum.photos/150",
      ),
    ],
  );
}
List<OrderModel> getSampleOrders() {
  return List.generate(8, (index) => getSampleOrder());
}
