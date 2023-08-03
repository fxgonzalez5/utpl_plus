import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:utpl_plus/models/models.dart';
import 'package:utpl_plus/providers/providers.dart';
import 'package:utpl_plus/widgets/widgets.dart';

part 'home_controller.dart';
part 'home_binding.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Función para obtener solo la fecha formateada con formato "yyyy-MM-dd"
    String formatDate(DateTime dateTime) {
      return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SectionHeader(
              text: 'Noticias',
              onPressed: () {},
            ),
        
            Obx(() => _CategoryButtons(
              onSelected: (value) => controller.changeCategory(value, 'news'),
              selected: controller.selected.value,
            )),

            Obx(() => _CardList(
              records: controller.articles,
              route: '/news',
              isLoading: controller.isLoad.value,
              itemBuilder: (index) => Obx(() => BigCard(
                image: controller.articles[index].image.url,
                title: controller.articles[index].title,
                date: formatDate(controller.articles[index].date),
              ),),
            ),),
        
            const SizedBox(
              height: 10,
            ),
        
            SectionHeader(
              text: 'Cine Foro',
              onPressed: () {},
            ),
        
            Obx(() =>_CategoryButtons(
              onSelected: (value) => controller.changeCategory(value, 'cineforum'),
              selected: controller.selectedFor.value,
            ),),
        
            Obx(() =>_CardList(
              records: controller.informations,
              route: '/cinemaforum',
              isLoading: controller.isLoadFor.value,
              itemBuilder: (index) => Obx(() => SmallCard(
                image: controller.informations[index].image.url,
                title: controller.informations[index].title,
                date: controller.informations[index].related[0].name,
              ),),
            ),),
          ],
        ),
      ),
    );
  }
}

class _CategoryButtons extends StatelessWidget {
  final int selected;
  final Function(int) onSelected;

  const _CategoryButtons({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HeaderButton(
          id: 1,
          selectedIndex: selected,
          text: 'Últimas',
          onPressed: () => onSelected(1),
        ),
        HeaderButton(
          id: 2,
          text: 'Populares',
          selectedIndex: selected,
          onPressed: () => onSelected(2),
        ),
        HeaderButton(
          id: 3,
          text: 'Investigación',
          selectedIndex: selected,
          onPressed: () => onSelected(3),
        ),
      ],
    );
  }
}

class _CardList extends StatelessWidget {
  final List<dynamic> records;
  final String route;
  final Widget? Function(int) itemBuilder;
  final bool isLoading;
  
  const _CardList({
    super.key, required this.records, required this.route, required this.itemBuilder, required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading 
      ? SizedBox(
        height: 235,
        child: Center(
            child: CircularProgressIndicator(color: Colors.lightBlue[900],),
          ),
      )
      : SizedBox(
          height: 235,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: records.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: (index != records.length - 1) ? const EdgeInsets.only(right: 15) : EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(route, arguments: records[index]),
                    child: itemBuilder(index)
                  ),
                );
              },
            ),
          ),
        );
  }
}
