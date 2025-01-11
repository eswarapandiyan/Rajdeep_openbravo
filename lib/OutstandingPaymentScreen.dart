import 'package:flutter/material.dart';

class Outstandingpaymentscreen extends StatefulWidget {
  @override
  _OutstandingpaymentscreenState createState() =>
      _OutstandingpaymentscreenState();
}

class _OutstandingpaymentscreenState extends State<Outstandingpaymentscreen> {
  final List<Map<String, dynamic>> orders = [
    {
      "siNo": "1",
      "poNo": "PO1234",
      "invoiceNo": "5678",
      "orderId": "7890",
      "orderAmount": "₹250",
      "orderDate": "2023-12-01",
      "initiatedDate": "2023-11-01",
      "paymentStatus": "pending"
    },
    {
      "siNo": "2",
      "poNo": "PO5678",
      "invoiceNo": "1234",
      "orderId": "4567",
      "orderAmount": "₹500",
      "orderDate": "2023-10-15",
      "initiatedDate": "2023-10-01",
      "paymentStatus": "pending"
    },
  ];

  String selectedFilter = "All";
  late List<Map<String, dynamic>> filteredOrders;

  @override
  void initState() {
    super.initState();
    filteredOrders = orders;
  }

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;
      DateTime now = DateTime.now();

      if (filter == "Last 30 Days") {
        DateTime thirtyDaysAgo = now.subtract(const Duration(days: 30));
        filteredOrders = orders
            .where((order) =>
                DateTime.parse(order["orderDate"]).isAfter(thirtyDaysAgo))
            .toList();
      } else if (filter == "Last 2 Months") {
        DateTime twoMonthsAgo = DateTime(now.year, now.month - 2, now.day);
        filteredOrders = orders
            .where((order) =>
                DateTime.parse(order["orderDate"]).isAfter(twoMonthsAgo))
            .toList();
      } else if (filter == "Last 3 Months") {
        DateTime threeMonthsAgo = DateTime(now.year, now.month - 3, now.day);
        filteredOrders = orders
            .where((order) =>
                DateTime.parse(order["orderDate"]).isAfter(threeMonthsAgo))
            .toList();
      } else {
        filteredOrders = orders;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Outstanding Payment',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 50, 174),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "View By:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedFilter,
                  items: const [
                    DropdownMenuItem(
                      value: "Last 30 Days",
                      child: Text("Last 30 Days"),
                    ),
                    DropdownMenuItem(
                      value: "Last 2 Months",
                      child: Text("Last 2 Months"),
                    ),
                    DropdownMenuItem(
                      value: "Last 3 Months",
                      child: Text("Last 3 Months"),
                    ),
                    DropdownMenuItem(
                      value: "All",
                      child: Text("All"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) applyFilter(value);
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blueGrey[50],
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: const Row(
              children: [
                Expanded(flex: 1, child: Text('SI. No.', style: _headerStyle)),
                Expanded(
                    flex: 2,
                    child: Center(child: Text('PO No.', style: _headerStyle))),
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text('Invoice No.', style: _headerStyle))),
                Expanded(
                    flex: 2,
                    child:
                        Center(child: Text('Order Id', style: _headerStyle))),
                Expanded(
                    flex: 2, child: Text('Order Amount', style: _headerStyle)),
                Expanded(
                    flex: 2,
                    child: Text('Payment Status', style: _headerStyle)),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                return Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                order["siNo"],
                                style: const TextStyle(fontSize: 12),
                              )),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  order["poNo"],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  order["invoiceNo"],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  order["orderId"],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  order["orderAmount"],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  order["paymentStatus"],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.red[600]),
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
        ],
      ),
    );
  }
}

const TextStyle _headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 12,
  color: Colors.black87,
);
