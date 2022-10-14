// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart'; //.. is replacement of cd ..
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final df = new DateFormat('dd-MM-yyyy');
  final List<Transaction> transactions;
  TransactionList(this.transactions);
//   @override
//   State<TransactionList> createState() => _TransactionListState();
// }

// class _TransactionListState extends State<TransactionList> {
//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 't1',
//       title: 'New Shoes',
//       amount: 69.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       title: 'Weekly Groceries',
//       amount: 16.53,
//       date: DateTime.now(),
//     ),
//   ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              Text(
                'No transactions added yet!',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover)),
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                            child: Text('Rs${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      // style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transactions[index].amount}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Text(
                //             df.format(transactions[index].date), //ayaz
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
              // children: transactions.map((tx) {}).toList(),
            ),
    );
  }
}
