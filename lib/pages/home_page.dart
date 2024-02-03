import 'package:ecommerce_app/components/bttm_nav_bar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // index for controle bottom bar
  int selctIndex = 0;

// update selected index
  void NavigateBottomBar(int index) {
    setState(() {
      selctIndex = index;
    });
  }

  // page to display whith list widget
  List<Widget> pages = <Widget>[
    //shop page
    const ShopPage(),
// cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) {
            NavigateBottomBar(index);
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DrawerHeader(
                      child: Image.asset(
                        "lib/images/adidas_2.png",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: Colors.grey),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(Icons.home, color: Colors.white),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(Icons.info, color: Colors.white),
                        title: Text(
                          "About",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Text(
                      "Logoout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ]),
        ),
        body: pages[selctIndex]);
  }
}
