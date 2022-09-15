
import 'package:get_storage/get_storage.dart';

class StorageManager{

  GetStorage gs = GetStorage();

  StorageManager(){
    getToken();
  }

  saveToken({token}){
    gs.write('token', token);
    accessToken = token;
  }

  getToken(){
    accessToken = gs.read('token');
    return gs.read('token');
  }
}

var accessToken;
var fname;
var lname;
var mobile;
var email;
var password;