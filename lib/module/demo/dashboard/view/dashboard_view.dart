import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    DashboardController controller = ref.watch(dashboardController);
    controller.view = this;

    return DefaultTabController(
        length: 4,
        initialIndex: controller.selectedIndex,
        child: Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex,
            children: [
              const HomeView1(),
              const ExampleView(),
              const CartItemView(),
              Container(
                color: Colors.blue[100],
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            selectedItemColor: Colors.grey[700],
            unselectedItemColor: Colors.grey[500],
            onTap: (index) {
              controller.selectedIndex = index;
              controller.notifyListeners();
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: "Order",
                icon: Icon(
                  Icons.list,
                ),
              ),
              BottomNavigationBarItem(
                label: "Favorite",
                icon: Icon(
                  Icons.favorite,
                ),
              ),
              BottomNavigationBarItem(
                label: "Me",
                icon: Icon(
                  Icons.person,
                ),
              ),
            ],
          ),
        ));
  }
}
