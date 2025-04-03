import 'package:bloc/bloc.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/order_entity.dart';
import 'package:ecommercedashboard/features/orders/domin/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.orderRepo) : super(GetOrdersInitial());
  final OrderRepo orderRepo;
  void getOrders() async {
    emit(GetOrdersLoading());
    await for (var order in orderRepo.getOrders()) {
      order.fold(
        (failure) {
          emit(GetOrdersFailure(failure.message));
        },
        (orders) {
          emit(GetOrdersSuccess(orders));
        },
      );
    }
  }
}
