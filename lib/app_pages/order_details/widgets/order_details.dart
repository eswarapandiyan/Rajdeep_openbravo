import 'package:flutter/material.dart';

class OrderDetails {
  buildHeaderCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  buildHeaderRow(double screenWidth) {
    return Container(
      color: Colors.blueGrey[50],
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          buildHeaderCell('SI. No.', flex: 1),
          buildHeaderCell('Customer Type', flex: 3),
          buildHeaderCell('Organization', flex: 4),
          buildHeaderCell('Material Value', flex: 3),
          buildHeaderCell('Sales Engineer', flex: 4),
        ],
      ),
    );
  }
}
