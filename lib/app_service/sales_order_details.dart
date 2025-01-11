// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:openbravo/app_service/connection.dart';

class SalesOrderDetailsService {
  getSOrderDetails() async {
    Connection connection = Connection();
    var url =
        'https://erp.rajdeep.in/rajdeeperp/ws/com.digiopen.mobileapps.salesinvoice?fromdate=2024-11-21&todate=2024-11-21';
    var response = await connection.getWithoutToken(url);

    return response;
  }
}
