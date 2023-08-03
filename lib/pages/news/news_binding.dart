part of 'news_page.dart';

class NewsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<NewsController>(() => NewsController());
  }
}