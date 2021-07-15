import 'package:flutter/material.dart';
import 'package:pegotech/models/languages.dart';

class LanguageWidget extends StatelessWidget {
  final List<Languages> _languageList;

  LanguageWidget(this._languageList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(_languageList[index].name),
          );
        },
        itemCount: _languageList.length,
      ),
    );
  }
}
