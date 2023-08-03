part of 'home_page.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  }
}