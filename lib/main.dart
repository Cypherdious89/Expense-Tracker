import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense-Track',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: "t1", title: "Shoes", amount: 599, date: DateTime.now()),
    Transaction(id: "t2", title: "Cake", amount: 399, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Expense App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Card(
                  color: Color.fromRGBO(242, 242, 242, 0.7),
                  elevation: 10,
                  child: Text('CHART !', textAlign: TextAlign.center),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            Column(
              children: transactions.map((tx) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Card(
                      color: Colors.white,
                      elevation: 5,
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
                                  tx.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${tx.date.day}/${tx.date.month}/${tx.date.year}",
                                  style: TextStyle(
                                      fontSize: 16,
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
                              '₹ ${tx.amount}',
                              style: TextStyle(
                                  color: Colors.purple[700],
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                );
              }).toList(),
            )
          ],
        ));
  }
}
