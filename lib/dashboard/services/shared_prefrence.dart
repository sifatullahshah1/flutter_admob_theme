class SharedPrefrence {
  // String city_admin_number = await getValueModeString("city_admin_number");

/*  static SaveCityData(City city) {
    saveValueModeInt("city_id", city.id);
    saveValueModeString("city_name", city.name);
    saveValueModeString("city_percentage", city.percentage);
    saveValueModeString("city_perKmCharges", city.perKmCharges);
    saveValueModeString("city_limitForPerKmCharges", city.limitForPerKmCharges);
    saveValueModeString("city_serviceCharges", city.serviceCharges);
    saveValueModeString("city_limitForPercentage", city.limitForPercentage);
    saveValueModeInt("city_visitCharges", city.visitCharges);
    saveValueModeInt(
        "city_awardRewardOnFirstOrder", city.awardRewardOnFirstOrder);
    saveValueModeInt("city_awardRewardPercentage", city.awardRewardPercentage);
    saveValueModeString("city_peakFromTime", city.peakFromTime);
    saveValueModeString("city_peakToTime", city.peakToTime);
    saveValueModeString("city_multiplier", city.multiplier);
    saveValueModeString("city_minOrderAmount", city.minOrderAmount);
    saveValueModeString("city_spClearanceAmount", city.spClearanceAmount);
    saveValueModeDouble("city_latitude", city.latitude);
    saveValueModeDouble("city_longitude", city.longitude);
    saveValueModeInt("city_cityTax", city.cityTax);
    saveValueModeInt("city_dontPlaceStartTime", city.dontPlaceStartTime);
    saveValueModeInt("city_dontPlaceEndTime", city.dontPlaceEndTime);
    saveValueModeString(
        "city_dontScheduleStartTime", city.dontScheduleStartTime.toString());
    saveValueModeString(
        "city_dontScheduleEndTime", city.dontScheduleEndTime.toString());
    // saveValueModeString("city_createdAt", city.createdAt.toString());
    // saveValueModeString("city_updatedAt", city.updatedAt.toString());
  }

  static SaveCountryData(ModelCountry modelCountry) {
    saveValueModeString("country_name", modelCountry.name);
    saveValueModeString("country_flag", modelCountry.flag);
    saveValueModeString("country_code", modelCountry.code);
    saveValueModeString("country_iso", modelCountry.iso);
    saveValueModeString("country_iso_code", modelCountry.iso_code);
    saveValueModeString("country_currency", modelCountry.currency);
    saveValueModeString(
        "country_currency_symbol", modelCountry.currency_symbol);
    saveValueModeString("country_time_zone", modelCountry.time_zone);
    saveValueModeDouble("country_latitude", modelCountry.latitude);
    saveValueModeDouble("country_longitude", modelCountry.longitude);
  }

  //====================Get Values======================================================

  static Future<City> GetCityData() async {
    int city_id = await getValueModeInt("city_id");
    String name = await getValueModeString("city_name");
    String percentage = await getValueModeString("city_percentage");
    String perKmCharges = await getValueModeString("city_perKmCharges");
    String limitForPerKmCharges =
        await getValueModeString("city_limitForPerKmCharges");
    String serviceCharges = await getValueModeString("city_serviceCharges");
    String limitForPercentage =
        await getValueModeString("city_limitForPercentage");
    int visitCharges = await getValueModeInt("city_visitCharges");
    int awardRewardOnFirstOrder =
        await getValueModeInt("city_awardRewardOnFirstOrder");
    int awardRewardPercentage =
        await getValueModeInt("city_awardRewardPercentage");
    String peakFromTime = await getValueModeString("city_peakFromTime");
    String peakToTime = await getValueModeString("city_peakToTime");
    String multiplier = await getValueModeString("city_multiplier");
    String minOrderAmount = await getValueModeString("city_minOrderAmount");
    String spClearanceAmount =
        await getValueModeString("city_spClearanceAmount");
    double latitude = await getValueModeDouble("city_latitude");
    double longitude = await getValueModeDouble("city_longitude");
    int cityTax = await getValueModeInt("city_cityTax");
    int dontPlaceStartTime = await getValueModeInt("city_dontPlaceStartTime");
    int dontPlaceEndTime = await getValueModeInt("city_dontPlaceEndTime");
    String dontScheduleStartTime =
        await getValueModeString("city_dontScheduleStartTime");
    String dontScheduleEndTime =
        await getValueModeString("city_dontScheduleEndTime");
    String city_admin_number = await getValueModeString("city_admin_number");
    // String createdAt = await getValueModeString("city_createdAt");
    // String updatedAt = await getValueModeString("city_updatedAt");

    return City(
      id: city_id,
      name: name,
      percentage: percentage,
      perKmCharges: perKmCharges,
      limitForPerKmCharges: limitForPerKmCharges,
      serviceCharges: serviceCharges,
      limitForPercentage: limitForPercentage,
      visitCharges: visitCharges,
      awardRewardOnFirstOrder: awardRewardOnFirstOrder,
      awardRewardPercentage: awardRewardPercentage,
      peakFromTime: peakFromTime,
      peakToTime: peakToTime,
      multiplier: multiplier,
      minOrderAmount: minOrderAmount,
      spClearanceAmount: spClearanceAmount,
      latitude: latitude,
      longitude: longitude,
      cityTax: cityTax,
      dontPlaceStartTime: dontPlaceStartTime,
      dontPlaceEndTime: dontPlaceEndTime,
      dontScheduleStartTime: dontScheduleStartTime,
      dontScheduleEndTime: dontScheduleEndTime,
      // createdAt: DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt)),
      // updatedAt: DateTime.fromMillisecondsSinceEpoch(int.parse(updatedAt)),
    );
  }

  static Future<ModelCountry> GetCountryData() async {
    String name = await getValueModeString("country_name");
    String flag = await getValueModeString("country_flag");
    String code = await getValueModeString("country_code");
    String iso = await getValueModeString("country_iso");
    String iso_code = await getValueModeString("country_iso_code");
    String currency = await getValueModeString("country_currency");
    String currency_symbol =
        await getValueModeString("country_currency_symbol");
    String time_zone = await getValueModeString("country_time_zone");
    double latitude = await getValueModeDouble("country_latitude");
    double longitude = await getValueModeDouble("country_longitude");

    return ModelCountry(
        name: name,
        flag: flag,
        code: code,
        iso: iso,
        iso_code: iso_code,
        currency: currency,
        currency_symbol: currency_symbol,
        time_zone: time_zone,
        latitude: latitude,
        longitude: longitude);
  }*/

  ///=================================================
/*
  static Future<bool> getSharePrefModebool(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool return_key = (prefs.getBool(_key) ?? false);
    print("isDarkMode isDarkModeOn $return_key");
    return return_key;
  }

  static Future<String> getValueModeString(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String return_key = (prefs.getString(_key) ?? "no_value");
    print("isDarkMode return_key $return_key");
    return return_key;
  }

  static Future<int> getValueModeInt(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int return_key = (prefs.getInt(_key) ?? 1);
    print("isDarkMode return_key $return_key");
    return return_key;
  }

  static Future<double> getValueModeDouble(String _key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double return_key = (prefs.getDouble(_key) ?? 1);
    print("isDarkMode return_key $return_key");
    return return_key;
  }

  //========== Save Values =======================================

  static void saveValueModebool(String _key, bool _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, _value);
    print("isDarkMode isDarkModeOn $_value");
  }

  static void saveValueModeString(String _key, String _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _value);
    print("isDarkMode isDarkModeOn $_value");
  }

  static void saveValueModeInt(String _key, int _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, _value);
    print("isDarkMode isDarkModeOn $_value");
  }

  static void saveValueModeDouble(String _key, double _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_key, _value);
    print("isDarkMode isDarkModeOn $_value");
  }*/
}
