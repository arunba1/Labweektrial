import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labweektrial/Projectscreen.dart';
import 'package:labweektrial/Teamavailabilityscreen.dart';
import 'package:labweektrial/Teamcreation.dart';
import 'package:labweektrial/Usercreation.dart';
// import 'colors.dart' as color;
import 'colors.dart' as color;

class Formvalidtrialscreen extends StatefulWidget {
  const Formvalidtrialscreen({super.key});

  @override
  State<Formvalidtrialscreen> createState() => _FormvalidtrialscreenState();
}

class _FormvalidtrialscreenState extends State<Formvalidtrialscreen> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/photo.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  void _navigatetoScreen(String screenname) {
    switch (screenname) {
      case 'Userscreen':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Userscreen()),
        );
        break;
      case 'Teamcreation':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Teamcreation()),
        );
        break;
      case 'Teamexisting':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Teamexisting()),
        );
        break;
      case 'Projectscreen':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Projectscreen()),
        );
        break;
      default:
        //
        break;
    }
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
          padding: EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Employee Portal',
                    style: TextStyle(
                        fontSize: 30,
                        color: color.AppColor.homePageTitle,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  // color: color.AppColor.gradientFirst.withOpacity(0.8),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            color.AppColor.gradientFirst.withOpacity(0.7),
                            color.AppColor.gradientSecond.withOpacity(0.8)
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(60)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 10),
                            blurRadius: 20,
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.25))
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Employee',
                            style: TextStyle(
                                fontSize: 28,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Management App',
                            style: TextStyle(
                                fontSize: 28,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(),
                              Expanded(child: Container()),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      boxShadow: [
                                        BoxShadow(
                                          color: color.AppColor.gradientFirst,
                                          blurRadius: 10,
                                          offset: Offset(4, 8),
                                        )
                                      ]),
                                  child: Icon(
                                    Icons.people,
                                    color: Colors.white,
                                    size: 60,
                                  )),
                            ],
                          ),
                        ]),
                  )),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Purpose of this App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: color.AppColor.homePageTitle),
                  )
                ],
              ),
              Expanded(
                  child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: (info.length.toDouble() / 2).toInt(),
                      itemBuilder: (_, i) {
                        int a = 2 * i;
                        int b = 2 * i + 1;
                        return Row(
                          children: [
                            InkWell(
                              onTap: () => _navigatetoScreen(info[a]['screen']),
                              child: Container(
                                height: 170,
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 15, top: 15),
                                width:
                                    (MediaQuery.of(context).size.width - 90) /
                                        2,
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(info[a]['img']),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: color.AppColor.gradientSecond
                                            .withOpacity(0.1),
                                      ),
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5, -5),
                                        color: color.AppColor.gradientSecond
                                            .withOpacity(0.1),
                                      )
                                    ]),
                                // child: Center(
                                //   child: Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Text(
                                //       info[a]['title'],
                                //       style: TextStyle(
                                //           fontSize: 25,
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.w500),
                                //     ),
                                //   ),
                                // ),
                              ),
                            ),
                            InkWell(
                              onTap: () => _navigatetoScreen(info[b]['screen']),
                              child: Container(
                                height: 170,
                                width:
                                    (MediaQuery.of(context).size.width - 90) /
                                        2,
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 15, top: 15),
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(info[b]['img']),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: color.AppColor.gradientSecond
                                            .withOpacity(0.1),
                                      ),
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5, -5),
                                        color: color.AppColor.gradientSecond
                                            .withOpacity(0.1),
                                      )
                                    ]),
                                // child: Center(
                                //   child: Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Text(
                                //       info[b]['title'],
                                //       style: TextStyle(
                                //           fontSize: 25,
                                //           color: Colors.red,
                                //           fontWeight: FontWeight.w500),
                                //     ),
                                //   ),
                                // ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ))
            ],
          )),
    );
  }
}
