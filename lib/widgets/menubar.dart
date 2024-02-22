import 'package:resurge2/data/menu_items.dart';
import 'package:resurge2/model/menu_item.dart';
import 'package:resurge2/page/help.dart';
import 'package:resurge2/page/jobs.dart';
import 'package:resurge2/page/login.dart';
import 'package:resurge2/page/mentorship.dart';
import 'package:resurge2/page/messaging.dart';
import 'package:resurge2/page/personal.dart';
import 'package:resurge2/page/resources.dart';
import 'package:resurge2/page/usersupport.dart';
import 'package:resurge2/provider/menubar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resurge2/page/courses.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: Color.fromARGB(255, 0, 31, 63),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: Colors.white12,
                child: buildHeader(isCollapsed),
              ),
              const SizedBox(height: 6),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              const SizedBox(height: 6),
              Divider(color: Colors.white70),
              const SizedBox(height: 6),
              buildList(
                indexOffset: itemsFirst.length,
                items: itemsSecond,
                isCollapsed: isCollapsed,
              ),
              Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required bool isCollapsed,
    required List<MenuItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(PersonalDetailsPage());
        break;
      case 1:
        navigateTo(CoursePage());
        break;
      case 2:
        navigateTo(JobPage());
        break;
      case 3:
        navigateTo(MentorshipPage());
        break;
      case 4:
        navigateTo(ResourcePage());
        break;
      case 5:
        navigateTo(MessagingPage());
        break;
      case 6:
        navigateTo(UserSupportPage());
      case 7:
        navigateTo(Help());
      case 8:
        navigateTo(LoginPage());
    }
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text, style: TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

/*
  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? FlutterLogo(size: 24)
      : Row(
          children: [
            const SizedBox(width: 24),
            FlutterLogo(size: 28),
            const SizedBox(width: 16),
            Text(
              'Resurge',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ],
        );
*/

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? Image.asset(
          'assets/images/App_logo-_Long-2-removebg-preview.png', // Replace with the actual path to your image
          height: 48, // Adjust the height as needed
          width: 48, // Adjust the width as needed
        )
      : Image.asset(
          'assets/images/App_logo-_Long-2-removebg-preview.png', // Replace with the actual path to your image
          height: 48, // Adjust the height as needed
          width: 48, // Adjust the width as needed
        );
}
