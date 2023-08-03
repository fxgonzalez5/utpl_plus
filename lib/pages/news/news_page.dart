import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:utpl_plus/models/models.dart';
import 'package:utpl_plus/widgets/widgets.dart';

part 'news_controller.dart';
part 'news_binding.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context)!.settings.arguments as Article;
    final List<String> categories = article.related.map((e) => e.name).toList();
    final String introduction = (article.description.indexOf('\n') != 0) 
      ? article.description.substring(0, article.description.indexOf('\n'))
      : article.description.substring(1, article.description.substring(1).indexOf('\n'));

    // Función para obtener solo la fecha formateada con formato "yyyy-MM-dd"
    String formatDate(DateTime dateTime) {
      return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    }

    final String formattedDate = formatDate(article.date);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[50],
        title: const Text('Detalle', style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.blueGrey,), onPressed: () => Get.back(),),
      ),

      body: Stack(
        children: [
          Obx(() => GestureDetector(
            onTap: () => controller.clicked.value = !controller.clicked.value,
            child: HeaderImage(article.image.url, clicked: controller.clicked.value,),
          )),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      _CategoryList(categories, image: article.image.url, title: article.title),
                      TitleFull(text: article.title, date: formattedDate),
                      Introduction(introduction),
                      const SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text((article.description.indexOf('\n') != 0) 
                          ? article.description.substring(article.description.indexOf('\n') + 2)
                          : article.description.substring(article.description.substring(1).indexOf('\n') + 5), 
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
   );
  }
}

class _CategoryList extends StatelessWidget {
  final List<String> categories;
  final String image;
  final String title;

  const _CategoryList(this.categories, {super.key, required this.image, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 275,
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: (index != categories.length - 1) ? const EdgeInsets.only(right: 10) : EdgeInsets.zero,
                child: CategoryCard(text: categories[index],),
              );
            },
          ),
        ),

        const Spacer(),

        AcctionButton(image: image, title: title,),
      ],
    );
  }
}


