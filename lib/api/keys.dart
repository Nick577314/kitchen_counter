import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

// https://stackoverflow.com/questions/67923733/what-is-the-best-way-to-store-api-keys-on-flutter

class Secret {
  final String apiKey;
  final String appID;
  Secret({this.apiKey = "", this.appID = ""});
  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    var secret = Secret(apiKey: jsonMap["api_key"], appID: jsonMap["app_ID"]);
    return secret;
  }
}

// the class Secret and the class SecretLoader work in tandum to load the secrets.json file which stores my apikey as well as api ID
// when loading it to github I will gitignore the secrets.json and look into other forms of securely storing keys.
class SecretLoader {
  final String secretPath;

  SecretLoader({required this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(secretPath, (jsonStr) async {
      var secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}
