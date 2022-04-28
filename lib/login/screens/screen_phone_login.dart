import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/screen_theme.dart';
import 'package:flutter_admob_theme/app_theme_work/textformfield_theme.dart';
import 'package:flutter_admob_theme/app_theme_work/theme_colors.dart';
import 'package:flutter_admob_theme/app_theme_work/widgets_reusing.dart';
import 'package:flutter_admob_theme/dashboard/screens/screen_tab_screen.dart';
import 'package:flutter_admob_theme/data/database_user.dart';
import 'package:flutter_admob_theme/data/model_user.dart';
import 'package:flutter_admob_theme/login/models/model_login.dart';
import 'package:flutter_admob_theme/login/screens/page_country_list.dart';
import 'package:flutter_admob_theme/sidebar/screens/screen_setting.dart';
import 'package:flutter_admob_theme/utilities/app_assets.dart';
import 'package:flutter_admob_theme/utilities/constant_functions.dart';

import '../models/model_country.dart';

class ScreenPhoneLogin extends StatefulWidget {
  const ScreenPhoneLogin({Key? key}) : super(key: key);

  @override
  _ScreenPhoneLoginState createState() => _ScreenPhoneLoginState();
}

class _ScreenPhoneLoginState extends State<ScreenPhoneLogin> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  var text_title = " mobile number";
  var text_description =
      "We will send you OTP to authenticate your phone number";
  var text_button = "Verify";
  bool isCodeSend = false;
  late ModelCountry modelCountry;

  final bottom_side = BorderSide(
    color: Colors.grey[400]!,
    width: 1.8,
  );

  DatabaseUser _databaseUser = DatabaseUser();

  @override
  void initState() {
    super.initState();
    modelCountry = ModelCountry.countries[0];
    InitionalizeFirebase();
    _databaseUser.initializeDatabase();
  }

  InitionalizeFirebase() async {
    try {
      print('FirebaseUser fcm_token');
    } catch (e) {
      print('FirebaseUser e ${e}');
      WidgetsReusing.getSnakeBar(context, "${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    GestureTapCallback onTap = () {};

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: isCodeSend
            ? InkWell(
                onTap: () {
                  if (isCodeSend) {
                    setState(() {
                      text_title = "Enter Phone Number";
                      text_button = "Verify";
                      isCodeSend = false;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.transparent),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[700],
                    size: 25,
                  ),
                ),
              )
            : Container(),
        // backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  ConstantFunctions.OpenNewActivity(ScreenTabScreen()));
            },
            child: Icon(
              Icons.tab_rounded,
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, ConstantFunctions.OpenNewActivity(ScreenSetting()));
            },
            child: Icon(
              Icons.settings,
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, ConstantFunctions.OpenNewActivity(ScreenTheme()));
            },
            child: Icon(
              Icons.text_fields,
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.transparent,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                isCodeSend
                    ? AppAssets.login_otp_icon
                    : AppAssets.login_phone_icon,
                scale: 5,
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$text_title",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$text_description",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: 35),
              isCodeSend
                  ? TextFormFieldTheme.GetTextFormFieldUniversalController(
                      context, _codeController, "", "", null, null)
                  : getNumber(),
              SizedBox(height: 35),
              WidgetsReusing.GetElevatedButton(context, text_button, onTap,
                  EdgeInsets.symmetric(horizontal: 0)),
              SizedBox(height: 30),
              isCodeSend
                  ? InkWell(
                      onTap: () {
                        setState(
                          () {
                            text_title = "Enter your mobile \nnumber";
                            text_description =
                                "We will send you OTP to authenticate your phone number";
                            text_button = "Verify";
                            isCodeSend = false;
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Change phone number? ",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: ThemeColors.primary_dark_lt),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 0, right: 0),
      width: MediaQuery.of(context).size.width / 1,
      height: 60,
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              setCountryFromCountryPage();
            },
            child: Container(
              alignment: Alignment.center,
              width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.all(Radius.circular(2)),
                // border: Border(
                //   bottom: bottom_side,
                //   top: bottom_side,
                //   // right: bottom_side,
                //   left: bottom_side,
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 35,
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 2.0, left: 0),
                    child: Text(
                      modelCountry.flag,
                      style: TextStyle(fontSize: 30),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(modelCountry.code,
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormFieldTheme.GetTextFormFieldNoBorderController(
                    context, _phoneController, null, null)),
          ),
        ],
      ),
    );
  }

  ModalUser getUserModelData(ModelLogin modelLogin) {
    int id = modelLogin.profile!.id;
    dynamic name = modelLogin.profile!.name;
    dynamic email = modelLogin.profile!.email;
    String phoneNumber = modelLogin.profile!.phoneNumber;
    dynamic avatar = modelLogin.profile!.avatar;
    dynamic bearer = modelLogin.bearer;
    dynamic createdAt = modelLogin.profile!.createdAt;
    dynamic updatedAt = modelLogin.profile!.updatedAt;

    print("HelloValue : id $id");
    print("HelloValue : name ${name ?? ""}");
    print("HelloValue : email ${email ?? ""}");
    print("HelloValue : phoneNumber $phoneNumber");
    print("HelloValue : avatar ${avatar ?? ""}");
    print("HelloValue : bearer $bearer");
    print("HelloValue : createdAt $createdAt");
    print("HelloValue : updatedAt $updatedAt");

    return ModalUser(
      id: id,
      name: name ?? "",
      email: email ?? "",
      phone_number: phoneNumber,
      avatar: avatar ?? "",
      bearer: bearer,
      created_at: createdAt.toString(),
      updated_at: updatedAt.toString(),
    );
  }

  void setCountryFromCountryPage() async {
    ModelCountry _modelCountry = await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, _) {
          return FadeTransition(opacity: animation, child: PageCountryList());
        },
      ),
    );
    /*ModelCountry _modelCountry = await Navigator.push(
        context, MaterialPageRoute(builder: (builder) => PageCountryList()));*/
    setState(() {
      modelCountry = _modelCountry;
    });
  }
}
