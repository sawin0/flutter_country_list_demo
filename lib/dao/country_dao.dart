import 'package:pegotech/database/db_helper.dart';
import 'package:pegotech/models/country.dart';
import 'package:sembast/sembast.dart';

class CountriesDao {
  static const String folderName = "Country";
  final _countryFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertCountry(Country country) async {
    await _countryFolder.add(await _db, country.toJson());
  }

  Future<List<Country>> getAllCountries() async {
    final recordSnapshot = await _countryFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final country = Country.fromJson(snapshot.value);
      return country;
    }).toList();
  }
}
