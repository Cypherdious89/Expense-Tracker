import "package:flutter/material.dart";
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: ListView.builder(itemBuilder: (ctx, index) {
        return Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Card(
              color: Colors.white,
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${transactions[index].date.day}/${transactions[index].date.month}/${transactions[index].date.year}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3.0, color: Color(0xFFFF7F7F)))),
                    child: Text(
                      '₹ ${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
