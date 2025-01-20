// import 'package:hive_flutter/hive_flutter.dart';

// // Box Storage Class to Store User Details
// class BoxStorage {
//   var box = Hive.box('box_Welleazy');

//   save(key, value) {
//     box.put(key, value);
//   }

//   //Get Details Based on Key
//   get(key) {
//     return box.get(key);
//   }

//   //Save User Details
//   saveUserDetails(userdetails) {
//     box.put('user', userdetails);
//   }

//   //Get User Details
//   getUserDetails() {
//     return box.get('user');
//   }

//   //Get User Details
//   deleteUserDetails() {
//     return box.delete('user');
//   }

//   //save login info
//   saveLoginInfo(name, password, rememberMe) {
//     box.put('logInfo',
//         {'username': name, 'password': password, 'rememberMe': rememberMe});
//   }

//   //get login info
//   getLoginInfo() {
//     return box.get('logInfo');
//   }

//   //Delete login info
//   deleteLoginInfo() {
//     box.delete('logInfo');
//   }
// }
