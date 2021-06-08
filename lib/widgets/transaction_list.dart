import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text('No transactions added yet !',
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 20),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
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
                        backgroundColor: Colors.deepPurple[50],
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '₹${transactions[index].amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
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
                      trailing: MediaQuery.of(context).size.width > 450
                          ? TextButton.icon(
                              onPressed: () =>
                                  deleteTransaction(transactions[index].id),
                              icon: Icon(Icons.delete),
                              label: Text('Delete'),
                              style: TextButton.styleFrom(
                                  primary: Theme.of(context).errorColor),
                            )
                          : IconButton(
                              onPressed: () =>
                                  deleteTransaction(transactions[index].id),
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              );
            },
            itemCount: transactions.length,
          );
  }
}
