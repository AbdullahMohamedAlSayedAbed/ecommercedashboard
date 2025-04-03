import 'package:ecommercedashboard/core/enums/order_enum.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/order_entity.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/order_product_entity.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/shipping_address_entity.dart';

OrderEntity getSampleOrder() {
  return OrderEntity(
    status: OrderStatus.pending,
    uID: "ORD12345",
    totalPrice: 149.99,
    paymentMethod: "Credit Card",
    shippingAddress: ShippingAddressEntity(
      name: "John Doe",
      address: "1234 Elm Street",
      city: "New York",
      state: "NY",
      email: "iBtM1@example.com",
      phone: "123-456-7890",
      addressDetails: "Apt 5B, Near Central Park",
    ),
    orderProducts: [
      OrderProductEntity(
        name: "Nike Running Shoes",
        code: "NK-001",
        price: 79.99,
        quantity: 1,
        imageUrl: "https://picsum.photos/150",
      ),
      OrderProductEntity(
        name: "Adidas Sweatshirt",
        code: "AD-002",
        price: 69.99,
        quantity: 1,
        imageUrl: "https://picsum.photos/150",
      ),
    ],
  );
}
List<OrderEntity> getSampleOrders() {
  return List.generate(4, (index) => getSampleOrder());
}
