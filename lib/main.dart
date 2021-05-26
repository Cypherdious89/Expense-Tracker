import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 699.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Cake',
      amount: 599,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmt) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmt,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                  color: Color.fromRGBO(242, 242, 242, 0.7),
                  elevation: 10,
                  child: Text('CHART !', textAlign: TextAlign.center),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}