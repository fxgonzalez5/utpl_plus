part of 'home_page.dart';

class HomeController extends GetxController {
  final RxInt selected = 1.obs;
  final RxInt selectedFor = 1.obs;
  final RxBool isLoad = true.obs;
  final RxBool isLoadFor = true.obs;

  final NewsProvider newsProvider = NewsProvider();
  final CineForumProvider cineForumProvider = CineForumProvider();

  final RxList<Article> articles = <Article>[].obs;
  final RxList<Information> informations = <Information>[].obs;


  @override
  void onInit() async {
    articles.assignAll(await newsProvider.getNews());
    informations.assignAll(await cineForumProvider.getCineForum());
    isLoad.value = false;
    isLoadFor.value = false;
    super.onInit();
  }

  void changeCategory(int selectedIndex, String type) async {
    if (type == "news") {
      selected.value = selectedIndex;
      isLoad.value = true;
      articles.assignAll(await newsProvider.getNews(page: selectedIndex));
      isLoad.value = false;
    } else {
      selectedFor.value = selectedIndex;
      isLoadFor.value = true;
      informations.assignAll(await cineForumProvider.getCineForum(page: selectedIndex));
      isLoadFor.value = false;
    }
  }
}
