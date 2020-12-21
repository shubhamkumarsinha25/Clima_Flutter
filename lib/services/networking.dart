import 'dart:convert';
import 'package:http/http.dart'as http;

class Networkhelper{
  Networkhelper(this.url);
  final String url;
  Future getdata()async{
    http.Response response=await http.get(url);
    if(response.statusCode==200) {
      String data = response.body;
      //var decodedata=jsonDecode(data);//dynamic variable
      return jsonDecode(data);

    }
    else{
      print(response.statusCode);
    }
  }
}
