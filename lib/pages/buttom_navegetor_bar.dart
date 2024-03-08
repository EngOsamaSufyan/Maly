import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:maly/pages/otherservice.dart';
import 'package:maly/pages/simchargebalance.dart';
import 'package:maly/pages/wifibalance.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'homepage.dart';


class ButtomBarPages extends StatefulWidget {
  ButtomBarPages({Key? key}) : super(key: key);

  @override
  _ButtomBarPagesState createState() => _ButtomBarPagesState();
}

class _ButtomBarPagesState extends State<ButtomBarPages> {
  final _pageController = PageController();
  bool _showContainer = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: PageView(
          controller: _pageController,
          children:  <Widget>[
            HomePage(),
            ComingSoonPage()

          ],
        ),
        extendBody: true,
        bottomNavigationBar: RollingBottomBar(
          color: Color(0x5779BFFF),
          controller: _pageController,
          flat: true,
          useActiveColorByDefault: false,
          items: const [
            RollingBottomBarItem(
              Icons.home_sharp,
              label: 'Home',
              activeColor: Colors.blue,
            ),

            RollingBottomBarItem(
              Icons.videogame_asset,
              label: 'Geming',
              activeColor: Colors.blue,

            ),
          ],
          enableIconRotation: true,
          onTap: (index) {
            setState(() {
              if (index == 2) {
                _showContainer = true;
              } else {
                _showContainer = false;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                );
              }
            });
          },
        ),
        floatingActionButton: _showContainer
            ? FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () {
            setState(() {
              _showContainer = false;
            });
          },
          child: const Icon(Icons.keyboard_double_arrow_down,
            color: Colors.orangeAccent,

          ),
        )
            : FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () {
            setState(() {
              _showContainer = true;
            });
          },
          child: const Icon(Icons.keyboard_double_arrow_up ,color: Colors.orangeAccent,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomSheet: _showContainer
            ? Container(
          height: 200,
          width: 200,// Customize the height as needed
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      SizedBox(height: 40),
                      Text('yemen4G',style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),),
                      IconButton(
                        icon: Icon(
                          Icons.wifi,
                          color: Colors.orange,
                        ),

                        onPressed: () {
                          Get.to(WifiBalancePage());
                        },
                      )
                     ],
                    )
                ),
                Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(height: 40),
                        Text('balance',style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),),
                        IconButton(
                          icon: Icon(
                            Icons.sim_card_outlined,
                            color: Colors.orange,
                          ),
                          onPressed: () {
                            Get.to(SimchargeBalancePage());
                          },
                        )
                      ],
                    )
                ),

              ],
            )

        )
            : null,
      ),
    );
  }
}