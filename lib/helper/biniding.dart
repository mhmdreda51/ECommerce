import 'package:e_commerce/core/card_view_model.dart';
import 'package:e_commerce/core/services/view_model/Control_view_model.dart';
import 'package:e_commerce/core/services/view_model/Home_view_model.dart';
import 'package:e_commerce/core/services/view_model/auth_view_model.dart';
import 'package:e_commerce/core/services/view_model/checkout_viewmodel.dart';
import 'package:e_commerce/helper/local_storge_data.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CardViewModel());
    Get.lazyPut(() => LocalStorgeData());
    Get.lazyPut(() => CheckOutViewModel());
  }
}
