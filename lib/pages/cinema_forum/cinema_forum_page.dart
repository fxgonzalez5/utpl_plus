import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:utpl_plus/models/models.dart';
import 'package:utpl_plus/widgets/widgets.dart';

part 'cinema_forum_controller.dart';
part 'cinema_forum_binding.dart';

class CinemaForumPage extends GetView<CinemaForumController> {
  const CinemaForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Information information = ModalRoute.of(context)!.settings.arguments as Information;

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
            child: HeaderImage(information.image.url, clicked: controller.clicked.value,),
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 275,
                            height: 35,
                            child: CategoryCard(text: 'Información de la Película',)
                          ),

                          const Spacer(),

                          AcctionButton(image: information.image.url, title: information.title),
                        ],
                      ),
                      TitleFull(text: information.title, date: information.related[0].name, hour: information.related[1].name,),
                      Introduction(information.description),
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
