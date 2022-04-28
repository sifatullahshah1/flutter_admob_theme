import 'package:flutter/material.dart';
import 'package:flutter_admob_theme/app_theme_work/textformfield_theme.dart';

import '../models/model_country.dart';

class PageCountryList extends StatefulWidget {
  const PageCountryList({Key? key}) : super(key: key);

  @override
  _PageCountryListState createState() => _PageCountryListState();
}

class _PageCountryListState extends State<PageCountryList> {
  List<ModelCountry> countries_filterd = [];

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      countries_filterd = ModelCountry.countries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, ModelCountry.countries[0]);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: isSearching
            ? TextFormFieldTheme.GetTextFormFieldUnderlineOnchange(
                context, "Enter country name here", "", "", null, null,
                (value) {
                if (value.length > 0) {
                  countries_filterd = [];
                  ModelCountry.countries.forEach((country) {
                    if (country.name
                        .toLowerCase()
                        .contains(value.toLowerCase())) {
                      countries_filterd.add(country);
                    }
                  });
                  setState(() {});
                } else {
                  setState(() {
                    countries_filterd = ModelCountry.countries;
                  });
                }
              })
            : Text("Chose a country"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                countries_filterd = ModelCountry.countries;
              });
            },
            icon: Icon(isSearching ? Icons.close : Icons.search),
          )
        ],
      ),
      body: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: countries_filterd.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.pop(context, countries_filterd[index]);
                },
                child: GetCard(countries_filterd[index]));
          }),
    );
  }

  Widget GetCard(ModelCountry modelCountry) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          height: 60,
          child: Row(
            children: [
              Text(
                modelCountry.flag,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  modelCountry.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              /* Container(
              child: Text(
                modalCountry.code,
                style: TextStyle(fontSize: 18),
              ),
            ),*/
            ],
          ),
        ),
        Divider(
          color: Colors.black87,
          thickness: .4,
          height: 1,
        )
      ],
    );
  }
}
