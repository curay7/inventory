import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:get/get.dart';
import 'package:stockinv/app/modules/home/views/home_history.dart';
import 'package:stockinv/app/modules/home/views/home_product.dart';
import 'package:stockinv/app/modules/home/views/home_test.dart';
import 'package:stockinv/app/modules/home/views/home_view.dart';

import '../controllers/home_controller.dart';
import 'home_keep.dart';
import 'home_outstock.dart';

class HomeLayout extends GetView<HomeController> {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = SidebarXController(selectedIndex: 1, extended: true);
    final _key = GlobalKey<ScaffoldState>();
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: canvasColor,
                  leading: IconButton(
                    onPressed: () {
                      // if (!Platform.isAndroid && !Platform.isIOS) {
                      //   _controller.setExtended(true);
                      // }
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: ExampleSidebarX(controller: _controller),
          body: Row(
            children: [
              if (!isSmallScreen) ExampleSidebarX(controller: _controller),
              Expanded(
                child: Center(
                  child: _ScreensExample(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(),
          ),
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.search,
          label: 'Product',
        ),
        SidebarXItem(
          icon: Icons.history,
          label: 'History',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.add_circle,
          label: 'Stock In',
        ),
        const SidebarXItem(
          icon: Icons.archive,
          label: 'Keep',
        ),
        const SidebarXItem(
          icon: Icons.info,
          label: 'About Us',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageComponent =
            _getTitleByIndex(index: controller.selectedIndex, theme: theme);

        return pageComponent;
      },
    );
  }
}

Widget _getTitleByIndex({required int index, required ThemeData theme}) {
  switch (index) {
    case 0:
      return HomeProduct();
    case 1:
      return HomeHistory();
    case 2:
      return HomeOutStock();
    case 3:
      return HomeKeep();
    case 4:
      return HomeTest();
    case 5:
      return Container(
        child: Text(
          'Profile',
          style: theme.textTheme.headlineSmall,
        ),
      );
    case 6:
      return Container(
        child: Text(
          'Settings',
          style: theme.textTheme.headlineSmall,
        ),
      );
    default:
      return Container(
        child: Text(
          'Not found page',
          style: theme.textTheme.headlineSmall,
        ),
      );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
