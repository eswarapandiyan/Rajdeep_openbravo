// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import '../../../app_utils/index_utils.dart';

class SalesOrderDetailsService {
  getSOrderDetails() async {
    HttpConnection connection = HttpConnection();
    String username = "APIUser";
    String password = "EPiQn5QETv6mU4";
    var url =
        'https://erp.rajdeep.in/rajdeeperp/ws/com.digiopen.mobileapps.salesinvoice?fromdate=2024-11-21&todate=2024-11-21';
    var response = await connection.getWithoutToken(url, username, password);
    // AlertService().toast('res ${response}');
    return response;
  }
}
