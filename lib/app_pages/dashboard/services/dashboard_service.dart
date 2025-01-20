import 'package:flutter/material.dart';
import 'package:openbravo/app_pages/order_details/services/order_details_service.dart';
import 'package:openbravo/app_utils/helpers/alert_function.dart';

class DashboardService {
  getSalesOrder(BuildContext context) async {
    AlertService().showLoadingDialog(context);
    SalesOrderDetailsService().getSOrderDetails().then((res) {
      // AlertService().successToast('response success ${res['data']}');
      AlertService().hideLoadingDialog(context);
      if (res['data'].isNotEmpty) {
        final List<dynamic> orderDetails = res['data'];
        Navigator.pushNamed(
          context,
          "OrderDetailsPage",
          arguments: orderDetails,
        );
      } else {
        // Handle empty response scenario
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No order details found')),
        );
      }
    });
  }
}
