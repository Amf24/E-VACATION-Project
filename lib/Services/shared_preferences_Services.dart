import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  SharedPreferences prefs;
  SaveData(String ID) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("USER_ID", ID);
  }

  Future<String> GetData() async {
    String result = "";
    prefs = await SharedPreferences.getInstance();

    result = (prefs.getString("USER_ID"));
    return result;
  }
}
