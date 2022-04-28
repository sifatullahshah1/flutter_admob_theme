import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_admob_theme/app_theme_work/screen_theme.dart';
import 'package:flutter_admob_theme/app_theme_work/widgets_reusing.dart';
import 'package:flutter_admob_theme/dashboard/models/model_dashboard.dart';
import 'package:flutter_admob_theme/dashboard/services/dashboard_service.dart';
import 'package:flutter_admob_theme/data/database_user.dart';
import 'package:flutter_admob_theme/data/model_user.dart';
import 'package:flutter_admob_theme/login/screens/screen_phone_login.dart';
import 'package:flutter_admob_theme/sidebar/screens/screen_drawer.dart';
import 'package:flutter_admob_theme/utilities/constant_functions.dart';

class ScreenDashboard extends StatefulWidget {
  final ModalUser modalUser;
  const ScreenDashboard({required this.modalUser});

  @override
  _ScreenDashboardState createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  Future<ModelDashboard>? future_goal_dashboard;

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  DatabaseUser databaseUser = DatabaseUser();
  ModalUser? modalUserfinal;
  @override
  void initState() {
    super.initState();
    modalUserfinal = widget.modalUser;
    setState(() {
      future_goal_dashboard =
          DashboardService.DashboardFunction(modalUserfinal!.bearer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: _drawerKey,
      floatingActionButton: AddGoalFloatingButton(),
      drawer: ScreenDrawer(),
      body: FutureBuilder(
          future: future_goal_dashboard ??
              DashboardService.DashboardFunction(modalUserfinal!.bearer),
          builder: (context, AsyncSnapshot<ModelDashboard>? snapshot) {
            if (snapshot!.hasData) {
              if (snapshot.data!.status == 405) {
                databaseUser.initializeDatabase().then((value) {
                  databaseUser.DeleteAllRecord();
                });

                ConstantFunctions.OpenNewScreenClean(
                    context, ScreenPhoneLogin());

                return Container();
              } else {
                if (snapshot.data!.user != null &&
                    snapshot.data!.user!.goals!.length > 0) {
                  ModelDashboard model_dashboard = snapshot.data!;

                  ModalUser modalUser1 = ModalUser(
                      id: 1,
                      name: model_dashboard.user!.name ?? "",
                      email: model_dashboard.user!.email ?? "",
                      phone_number: widget.modalUser.phone_number,
                      avatar: model_dashboard.user!.avatar ?? "",
                      bearer: widget.modalUser.bearer,
                      created_at: model_dashboard.user!.createdAt.toString(),
                      updated_at: model_dashboard.user!.updatedAt.toString());
                  databaseUser.AddUpdateRecord(modalUser1).then((value) {
                    modalUserfinal = modalUser1;
                    // ConstantFunctions.getSnakeBar(context, "Loaded");
                  });
                  return Container(
                    child: GetBody(model_dashboard),
                  );
                } else {
                  // ConstantFunctions.getSnakeBar(context, snapshot.data!.message);
                  return Column(
                    children: [
                      TopAppBarArea(),
                      snapshot.data!.status == 200
                          ? Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.status == 200
                                          ? "Create your first goal by clicking + button"
                                          : "${snapshot.data!.message}",
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: GetLoadData("${snapshot.data!.message}"),
                            )
                    ],
                  );
                }
              }
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  TopAppBarArea(),
                  Container(
                    child: Text("Some Error occured"),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  TopAppBarArea(),
                  Expanded(
                    child: Center(
                        child:
                            ConstantFunctions.ShowProgressLoadingView(context)),
                  ),
                ],
              );
            }
          }),
    );
  }

  Widget GetLoadData(String message) {
    return Center(
      child: WidgetsReusing.getLoadWidget(
        context,
        message: message,
        onPresseddd: () {
          setState(() {
            future_goal_dashboard =
                DashboardService.DashboardFunction(modalUserfinal!.bearer);
          });
        },
      ),
    );
  }

  Widget TopAppBarArea() {
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 35),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  _drawerKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu, color: Colors.white),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        ConstantFunctions.OpenNewActivity(ScreenTheme()));
                  },
                  child: Text(
                    "Fundo Meter",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(Icons.notifications_none_outlined,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget GetBody(ModelDashboard model_dashboard) {
    List<String> tabList = ['My Goal', 'My Contributions'];

    return Column(
      children: [
        TopAppBarArea(),
        Expanded(
            child: DefaultTabController(
          length: WidgetsReusing.GetTabs(context, tabList).length,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Material(
                        color: Theme.of(context).colorScheme.secondary,
                        child: TabBar(
                          onTap: (vvv) {
                            if (vvv == 0) {
                              setState(() {
                                tabController.index = 0;
                              });
                            } else if (vvv == 1) {
                              setState(() {
                                tabController.index = 1;
                              });
                            }
                          },
                          controller: tabController,
                          isScrollable: false,
                          // labelColor: Colors.orange,
                          indicatorColor: Colors.white,
                          indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
                          indicatorWeight: 3,
                          // indicator: Decoration(),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 17),
                          tabs: WidgetsReusing.GetTabs(context, tabList),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      Container(
                        child: Text("First Tab"),
                      ),
                      Container(
                        child: Text("Second Tab"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  FloatingActionButton AddGoalFloatingButton() {
    return FloatingActionButton(
      onPressed: GoToAddGoalScreen,
      // onPressed: null,
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        alignment: Alignment.center,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void GoToAddGoalScreen() async {
    // bool isUpdated = await Navigator.push(
    //   context,
    //   ConstantFunctions.OpenNewActivity(
    //     ScreenAddGoal(),
    //   ),
    // );
    // print("HelloFromGoalDetails $isUpdated");
    // if (isUpdated) {
    //   databaseUser.GetSingleRecord().then((value) {
    //     setState(() {
    //       future_goal_dashboard =
    //           DashboardService.DashboardFunction(value.bearer);
    //     });
    //   });
    // }
  }
}
