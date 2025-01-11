import 'package:flutter/material.dart';
import 'package:openbravo/app_utils/alert_service.dart';

import 'app_service/sales_order_details.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
//  double screenHeight = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 1, 50, 174),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/rajdeep-logo.png",
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: screenHeight / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDashboardCard(
                    title: 'Price List',
                    color: Colors.blue,
                    icon: Icons.view_list,
                    onTap: () {
                      Navigator.pushNamed(context, "ProductListPage");
                      print("Product List clicked");
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildDashboardCard(
                    title: 'Order Details',
                    color: Colors.green,
                    icon: Icons.shopping_cart,
                    onTap: () {
                      AlertService().successToast('Order details clicked');
                      // AlertService().showLoadingDialog(context);
                      getSalesOrder(context);

                      print("Order Details clicked");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDashboardCard(
                title: 'Outstanding Payment',
                color: Colors.red,
                icon: Icons.payment_sharp,
                onTap: () {
                  Navigator.pushNamed(context, "OutstandingPaymentPage");
                  print("Performance clicked");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getSalesOrder(BuildContext context) async {
    AlertService().showLoadingDialog(context);
    SalesOrderDetailsService().getSOrderDetails().then((res) {
      AlertService().successToast('response success');
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
