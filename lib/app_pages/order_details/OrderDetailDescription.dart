import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> productDetails = [
      {"siNo": "1", "productName": "Jazz series – JZ", "price": "₹50"},
      {"siNo": "2", "productName": "SG10", "price": "₹100"},
      {"siNo": "3", "productName": "SG20", "price": "₹100"},
      {"siNo": "4", "productName": "SGH10", "price": "₹100"},
      {"siNo": "5", "productName": "SGH50", "price": "₹100"},
      {"siNo": "6", "productName": "AG05", "price": "₹100"},
      {"siNo": "7", "productName": "AG06", "price": "₹100"},
      {"siNo": "8", "productName": "AG07", "price": "₹100"},
      {"siNo": "9", "productName": "AG08", "price": "₹100"},
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Order Detail',
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: const Color.fromARGB(255, 1, 50, 174),
      // ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/rajdeep-logo.png",
            height: 130,
            width: 130,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Order Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.blue[800],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("PO No.: ${order["poNo"]}",
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Invoice No.: ${order["invoiceNo"]}",
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Order Initiated Date: ${order["initiatedDate"]}",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Order Date: ${order["orderDate"]}",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),

          const Divider(thickness: 1),
          const SizedBox(
            height: 10,
          ),
          // Second Half - Product Details Table
          Expanded(
            child: Column(
              children: [
                // Table Header
                Container(
                  color: Colors.green[400],
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1, child: Text('SI. No.', style: _headerStyle)),
                      Expanded(
                          flex: 3,
                          child: Center(
                              child:
                                  Text('Product Name', style: _headerStyle))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('Price', style: _headerStyle))),
                    ],
                  ),
                ),
                // const Divider(height: 1),
                // Table Rows
                Expanded(
                  child: ListView.builder(
                    itemCount: productDetails.length,
                    itemBuilder: (context, index) {
                      final product = productDetails[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      product["siNo"],
                                      style: const TextStyle(fontSize: 12),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Text(
                                        product["productName"],
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                        product["price"],
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const Divider(height: 1),
                        ],
                      );
                    },
                  ),
                ),
                // Subtotal, Tax, and Total
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blueGrey[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSummaryRow("Subtotal:", "₹250"),
                      _buildSummaryRow("Tax (10%):", "₹25"),
                      const Divider(thickness: 1),
                      _buildSummaryRow("Total:", "₹275", bold: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle _headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: Colors.white,
  );
}
