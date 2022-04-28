import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/textformfield_theme.dart';
import 'package:flutter_admob_theme/app_theme_work/widgets_reusing.dart';
import 'package:flutter_admob_theme/utilities/constant_functions.dart';

class ScreenTheme extends StatefulWidget {
  const ScreenTheme({Key? key}) : super(key: key);

  @override
  _ScreenThemeState createState() => _ScreenThemeState();
}

class _ScreenThemeState extends State<ScreenTheme> {
  String editext = "empty box";

  @override
  Widget build(BuildContext context) {
    GestureTapCallback onLoadTap = () {
      WidgetsReusing.getSnakeBar(context, "message view style");
    };

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Appbar title text"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text("headline1",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: size.width * 0.13, fontWeight: FontWeight.w300)),
            getDivider(),
            Text("headline2",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: size.width * 0.11, fontWeight: FontWeight.w400)),
            getDivider(),
            Text("headline3", style: Theme.of(context).textTheme.headline3),
            getDivider(),
            Text("headline4", style: Theme.of(context).textTheme.headline4),
            getDivider(),
            Text("headline5", style: Theme.of(context).textTheme.headline5),
            Divider(
                thickness: 2, color: Theme.of(context).scaffoldBackgroundColor),
            Text("headline6", style: Theme.of(context).textTheme.headline6),
            getDivider(),
            Text("subtitle1", style: Theme.of(context).textTheme.subtitle1),
            getDivider(),
            Text("subtitle2", style: Theme.of(context).textTheme.subtitle2),
            getDivider(),
            Text("bodyText1", style: Theme.of(context).textTheme.bodyText1),
            Divider(
                thickness: 2, color: Theme.of(context).scaffoldBackgroundColor),
            Text("bodyText2", style: Theme.of(context).textTheme.bodyText2),
            getDivider(),
            Text("caption", style: Theme.of(context).textTheme.caption),
            getDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormFieldTheme.GetTextFormFieldUnderlineOnchange(
                  context, "lable", "hint", "error", null, null, (value) {
                setState(() {
                  editext = value;
                });
              }),
            ),
            Text("$editext"),
            getDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormFieldTheme.GetTextFormFieldUniversalController(
                  context, null, "lable", "hint", null, null),
            ),
            getDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormFieldTheme.GetTextFormFieldNoBorderController(
                  context, null, Icons.style, null),
            ),
            getDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ConstantFunctions.ShowProgressLoadingView(context),
            ),
            getDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: WidgetsReusing.getLoadWidget(context,
                  message: "Internet Issue", onPresseddd: onLoadTap),
            ),
            getDivider(),
            WidgetsReusing.GetTextButton(context, "Show Snackbar", onLoadTap,
                EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
            getDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: WidgetsReusing.GetListSingleItem("Title", "Description"),
            ),
            getDivider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: WidgetsReusing.GetListSingleItemWidthHeight(
                  "Title", "Description", 20, 20),
            ),
            getDivider(),
            Container(
              width: 220,
              height: 80,
              alignment: Alignment.center,
              decoration: WidgetsReusing.getListBoxDecoration(),
              child: Text("Container Decoration"),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget getDivider() {
    return Divider(
        thickness: 2, color: Theme.of(context).scaffoldBackgroundColor);
  }
}
