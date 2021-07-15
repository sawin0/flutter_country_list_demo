import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pegotech/provider/country_provider.dart';
import 'package:pegotech/widgets/country_widget.dart';
import 'package:provider/provider.dart';

import 'models/country.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CountryProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CountryProvider>(context, listen: false).getLocalData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Country> _countryList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _countryList =
        Provider.of<CountryProvider>(context, listen: true).countryData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Country List"),
      ),
      body: Container(
        child: _countryList.isEmpty
            ? Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CountryWidget(_countryList[index]);
                },
                itemCount: _countryList.length,
              ),
      ),
    );
  }
}
