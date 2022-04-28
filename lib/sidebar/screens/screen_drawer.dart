import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_admob_theme/app_theme_work/widgets_reusing.dart';
import 'package:flutter_admob_theme/data/database_user.dart';
import 'package:flutter_admob_theme/data/model_user.dart';
import 'package:flutter_admob_theme/login/screens/screen_phone_login.dart';
import 'package:flutter_admob_theme/sidebar/services/sidebar_service.dart';
import 'package:flutter_admob_theme/utilities/constant_functions.dart';
import 'package:flutter_admob_theme/utilities/rest_api_utils.dart';

class ScreenDrawer extends StatefulWidget {
  @override
  _ScreenDrawerState createState() => _ScreenDrawerState();
}

class _ScreenDrawerState extends State<ScreenDrawer> {
  ModalUser? modalUser;

  String user_name = "Fund Raiser";
  String user_avatar = "";
  String user_phone = "";

  DatabaseUser databaseUser = DatabaseUser();

  @override
  void initState() {
    super.initState();

    UpdateDataFunction();
  }

  void UpdateDataFunction() {
    databaseUser.initializeDatabase().then((value) {
      databaseUser.GetSingleRecord().then((value) {
        setState(() {
          modalUser = value;

          user_name = value.name == "" ? "Fund Raiser" : value.name;
          user_avatar = value.avatar;
          user_phone = value.phone_number;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      width: MediaQuery.of(context).size.width - 60,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: Column(
        children: [
          // naviagation drawer header
          Container(
            padding: EdgeInsets.only(top: 60, left: 0, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 0, top: 10),
                  child: Hero(
                    tag: "Profile_image",
                    child: modalUser?.avatar != ""
                        ? CircleAvatar(
                            backgroundColor: Colors.orange,
                            backgroundImage: NetworkImage(
                                "${RestApiUtils.ImageUrl}${modalUser?.avatar}"),
                            radius: 50,
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                          ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "${user_name}",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "${user_phone}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                WidgetsReusing.GetDivider(
                    Colors.transparent, Colors.white, 8, 0),
              ],
            ),
          ),

          // naviagation drawer item
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            /*  ModalUser _modalUser = await Navigator.push(
                                context,
                                ConstantFunctions.OpenNewActivity(
                                    ScreenProfileShow()));

                            setState(() {
                              modalUser = _modalUser;

                              user_name = _modalUser.name == ""
                                  ? "Fund Raiser"
                                  : _modalUser.name;
                              user_avatar = _modalUser.avatar;
                              user_phone = _modalUser.phone_number;
                            });*/
                          },
                          child: GetMenuList(Icons.person_outline_outlined,
                              "Profile", Colors.black87),
                        ),
                        /* InkWell(
                          onTap: () {},
                          child: GetMenuList(
                              Icons.history, "History", Colors.black87),
                        ),*/
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(Icons.lock_outline,
                              "Privacy Policy", Colors.black87),
                        ),
                        WidgetsReusing.GetDivider(
                            Colors.transparent, Colors.white, 8, 10),
                        InkWell(
                          onTap: () {
                            SideService.LogoutFunction(modalUser!.bearer).then(
                              (value) {
                                if (value.status == 200) {
                                  databaseUser.DeleteAllRecord();
                                  ConstantFunctions.OpenNewScreenClean(
                                      context, ScreenPhoneLogin());
                                  WidgetsReusing.getSnakeBar(
                                      context, "${value.message}");
                                } else {
                                  WidgetsReusing.getSnakeBar(
                                      context, "${value.message}");
                                }
                                Navigator.pop(context);
                              },
                            );
                          },
                          child: GetMenuList(
                              Icons.logout, "Logout", Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "version 1.1",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> ShowDialogLogout() {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogLogout();
  //     },
  //   );
  // }

  Widget GetMenuListKardaanPay(String image_path, String title, wallet_amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.transparent,
            child: Image.asset(image_path),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 17),
          ),
        ),
        Text(
          "Rs. 0",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget GetMenuList(IconData iconData, String title, Color _color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.transparent,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w500)),
        ),
        /* Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        )*/
      ],
    );
  }
}
