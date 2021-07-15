import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pegotech/models/country.dart';

import 'language_widget.dart';

class CountryWidget extends StatelessWidget {
  final Country _country;

  CountryWidget(this._country);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: _country.flag,
            height: 80.0,
            width: 80.0,
            placeholder: (context, url) => CupertinoActivityIndicator(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _country.name,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    _country.capital,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  LanguageWidget(_country.languages),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
