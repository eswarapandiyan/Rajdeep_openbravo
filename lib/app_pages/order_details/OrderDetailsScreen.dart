import 'package:flutter/material.dart';
import 'package:openbravo/app_pages/order_details/widgets/order_details.dart';

class OrderDetailsTable extends StatefulWidget {
  final List<dynamic> orders;

  const OrderDetailsTable({super.key, required this.orders});

  @override
  State<OrderDetailsTable> createState() => _OrderDetailsTableState();
}

class _OrderDetailsTableState extends State<OrderDetailsTable> {
  List<dynamic> _filteredOrders = [];
  String? _selectedColumn;
  String? _selectedCategory;
  OrderDetails orderDetailsWid = OrderDetails();

  final List<String> _columns = [
    'All',
    'Customer Type',
    'Organization',
    'Material Value',
    'Sales Engineer',
  ];

  int _currentPage = 1;
  final int _itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _filteredOrders = widget.orders;
  }

  void _filterOrders() {
    if (_selectedColumn == 'All') {
      setState(() {
        _filteredOrders = widget.orders;
      });
    } else if (_selectedColumn != null && _selectedCategory != null) {
      setState(() {
        String key = _mapColumnToKey(_selectedColumn!);
        _filteredOrders = widget.orders
            .where((order) => order[key]?.toString() == _selectedCategory)
            .toList();
      });
    } else {
      setState(() {
        _filteredOrders = widget.orders;
      });
    }
    _currentPage = 1;
  }

  List<String> _getUniqueCategories(String columnKey) {
    return widget.orders
        .map((order) => order[columnKey]?.toString() ?? '')
        .toSet()
        .where((category) => category.isNotEmpty)
        .toList();
  }

  String _mapColumnToKey(String column) {
    switch (column) {
      case 'Customer Type':
        return 'customertype';
      case 'Organization':
        return 'organization';
      case 'Material Value':
        return 'materialvalue';
      case 'Sales Engineer':
        return 'salesengineer';
      default:
        return '';
    }
  }

  List<dynamic> _getPaginatedOrders() {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    return _filteredOrders.sublist(
      startIndex < _filteredOrders.length ? startIndex : 0,
      endIndex < _filteredOrders.length ? endIndex : _filteredOrders.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 50, 174),
      ),
      body: Column(
        children: [
          // Dropdowns
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter by :',
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 50, 174),
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedColumn,
                        items: _columns
                            .map((column) => DropdownMenuItem(
                                  value: column,
                                  child: Text(column,
                                      style: TextStyle(fontSize: 11)),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedColumn = value;
                            _selectedCategory = null;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Select Type',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        items:
                            _selectedColumn != null && _selectedColumn != 'All'
                                ? _getUniqueCategories(
                                        _mapColumnToKey(_selectedColumn!))
                                    .map((category) => DropdownMenuItem(
                                          value: category,
                                          child: Text(
                                            category,
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ))
                                    .toList()
                                : [], // Empty list when "All" is selected
                        onChanged:
                            _selectedColumn != null && _selectedColumn != 'All'
                                ? (value) {
                                    setState(() {
                                      _selectedCategory = value;
                                      _filterOrders();
                                    });
                                  }
                                : null,
                        decoration: const InputDecoration(
                          labelText: 'Select Category',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          orderDetailsWid.buildHeaderRow(screenWidth),
          const Divider(height: 1),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: _filteredOrders.isEmpty
                      ? const Center(child: Text('No matching orders found'))
                      : ListView.builder(
                          itemCount: _getPaginatedOrders().length,
                          itemBuilder: (context, index) {
                            final order = _getPaginatedOrders()[index];
                            final sino =
                                (_currentPage - 1) * _itemsPerPage + index + 1;
                            return _buildOrderRow(sino, order, screenWidth);
                          },
                        ),
                ),
                _buildPaginationControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderRow(int sino, dynamic order, double screenWidth) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              _buildDataCell('$sino', flex: 1),
              _buildDataCell(order['customertype'] ?? '', flex: 3),
              _buildDataCell(order['organization'] ?? '', flex: 4),
              _buildDataCell(order['materialvalue'] ?? '', flex: 3),
              _buildDataCell(order['salesengineer'] ?? '', flex: 4),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildDataCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              if (_currentPage > 1) {
                setState(() {
                  _currentPage--;
                });
              }
            },
            child: Icon(Icons.arrow_circle_left_outlined)),
        Text('Page $_currentPage'),
        TextButton(
          onPressed: () {
            if (_currentPage * _itemsPerPage < _filteredOrders.length) {
              setState(() {
                _currentPage++;
              });
            }
          },
          child: Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }

  final TextStyle _headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: Colors.black87,
  );
}
