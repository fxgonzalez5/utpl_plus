part of 'cinema_forum_page.dart';

class CinemaForumBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<CinemaForumController>(() => CinemaForumController());
  }
}