import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/text_themes.dart';
import 'package:lottie/lottie.dart';

class WidgetsReusing {
  static BoxDecoration getListBoxDecoration() {
    return BoxDecoration(
        color: Colors.grey[200],
        //sifat
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1)
        ]);
  }

  static Widget getLoadWidget(context, {String? message, onPresseddd}) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            child: Lottie.asset('assets/jsons/internet_api_issue.json'),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "$message",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
                letterSpacing: .2,
                color: Colors.black87),
          ),
          SizedBox(
            height: 25,
          ),
          GetTextButton(context, "Reload", onPresseddd,
              EdgeInsets.symmetric(horizontal: 0))
        ],
      ),
    );
  }

  static Widget GetListSingleItem(String title, String value) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 62,
            height: 25,
            child: Text('${title}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          Text('${value}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700])),
        ],
      ),
    );
  }

  static Widget GetGoalItem(String image_path, String title, String value) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            "$image_path",
            width: 20,
            height: 20,
          ),
          SizedBox(width: 10),
          Text('${title}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          Spacer(),
          Text('${value}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ],
      ),
    );
  }

  static Widget GetListSingleItemWidthHeight(
      String title, String value, double item_width, double item_height) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: item_width,
            height: item_height,
            child: Text('${title}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          Text('${value}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700])),
        ],
      ),
    );
  }

  //=========== Tab bar Work =========================================

  static Material GetMaterialTabbar(context, tabController, tabList) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      child: TabBar(
        onTap: (vvv) {
          if (vvv == 0) {
            tabController.index = 0;
          } else if (vvv == 1) {
            tabController.index = 1;
          }
        },
        controller: tabController,
        isScrollable: false,
        // labelColor: Colors.orange,
        indicatorColor: Colors.white,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
        indicatorWeight: 3,
        // indicator: Decoration(),
        labelStyle:
            Theme.of(context).textTheme.headline4!.copyWith(fontSize: 18),
        tabs: GetTabs(context, tabList),
      ),
    );
  }

  static List<Widget> GetTabs(context, List<String> titles) {
    final myTabs = titles.map((title) {
      return Container(
        padding: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width / 2.5,
        child: Tab(text: title),
      );
    }).toList();
    return myTabs;
  }

  //=========== Tab bar Work =========================================

  static Widget GetTextButton(context, String text, onTap, edgeinsets) {
    return Container(
      width: double.infinity,
      margin: edgeinsets,
      height: 50,
      child: TextButton(
        style: Theme.of(context).textButtonTheme.style,
        onPressed: onTap,
        child: Text(
          text,
          style: TextThemes.button_text,
        ),
      ),
    );
  }

  static Widget GetElevatedButton(context, String text, onTap, edgeinsets) {
    return Container(
      width: double.infinity,
      margin: edgeinsets,
      height: 50,
      child: ElevatedButton(
        style: Theme.of(context).textButtonTheme.style,
        onPressed: onTap,
        child: Text(
          text,
          style: TextThemes.button_text,
        ),
      ),
    );
  }

  static getSnakeBar(@required BuildContext context, @required String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
          content: Text(message,
              style: Theme.of(context).appBarTheme.titleTextStyle),
          backgroundColor: Theme.of(context).colorScheme.secondary),
    );
  }

  static Widget GetContactBox(image_path, _title, text_form_style, _size) {
    return Column(
      children: [
        Image.asset(
          image_path,
          width: _size,
          height: _size,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          _title,
          style: text_form_style,
        ),
      ],
    );
  }

  static Widget GetKardaanRow(String kardaan_image, String kardaan_name,
      String kardaan_rating, String category_name) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "kardaan_image",
            ),
            // backgroundColor: Colors.red.shade800,
            radius: 38,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${kardaan_name}",
                    // "${snapshot.data.order.dateTime}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${kardaan_rating}",
                    // "${snapshot.data.order.dateTime}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600]),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.grade,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 5),
              Text(
                "${category_name}",
                // "${snapshot.data.order.dateTime}",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget GetDivider(Color container_color, Color divider_color,
      double _vertical, double _horizontal) {
    return Container(
      color: container_color,
      padding:
          EdgeInsets.symmetric(vertical: _vertical, horizontal: _horizontal),
      child: Divider(
        height: 1,
        thickness: 1,
        color: divider_color,
      ),
    );
  }

// static Widget GetImageBackground(BuildContext context) {
//   return Stack(
//     children: [
//       Container(
//         margin: EdgeInsets.symmetric(horizontal: 15),
//         height: 150,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.grey[100],
//         child: DashedRect(
//           color: Colors.black54,
//           strokeWidth: 2.0,
//           gap: 5,
//         ),
//       ),
//       Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//         color: Colors.grey[100],
//         child: Image.asset(
//           "assets/images/official_image_upload_icon.png",
//           height: 100,
//           width: 100,
//           color: Colors.black87,
//         ),
//       ),
//     ],
//   );
// }
}
