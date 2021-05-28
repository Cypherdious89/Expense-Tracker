import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet !',
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  child: Card(
                      color: Colors.white,
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text('₹${transactions[index].amount}'),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
