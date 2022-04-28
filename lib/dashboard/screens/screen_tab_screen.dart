import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/widgets_reusing.dart';

class ScreenTabScreen extends StatefulWidget {
  const ScreenTabScreen({Key? key}) : super(key: key);

  @override
  _ScreenTabScreenState createState() => _ScreenTabScreenState();
}

class _ScreenTabScreenState extends State<ScreenTabScreen>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("data"),
        ),
        body: GetBody(),);
  }

  Widget GetBody() {
    List<String> tabList = ['First Tab', 'Second Tab'];

    return Column(
      children: [
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
                  child: WidgetsReusing.GetMaterialTabbar(
                      context, tabController, tabList),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Text("First Tab"),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
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
}
