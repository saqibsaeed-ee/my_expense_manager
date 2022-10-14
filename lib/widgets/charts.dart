import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTranctions;
  Chart(this.recentTranctions);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalsum = 0.0;

      for (var i = 0; i < recentTranctions.length; i++) {
        if (recentTranctions[i].date.day == weekDay.day &&
            recentTranctions[i].date.month == weekDay.month &&
            recentTranctions[i].date.year == weekDay.year) {
          totalsum += recentTranctions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalsum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalsum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
