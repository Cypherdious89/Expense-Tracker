import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    required ValueKey<String> key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor = Colors.purple;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.deepPurple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: Card(
          color: Colors.white,
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _bgColor,
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                    '₹${widget.transaction.amount}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            title: Text(
              widget.transaction.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(widget.transaction.date),
            ),
            trailing: MediaQuery.of(context).size.width > 450
                ? TextButton.icon(
                    onPressed: () =>
                        widget.deleteTransaction(widget.transaction.id),
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).errorColor),
                  )
                : IconButton(
                    onPressed: () =>
                        widget.deleteTransaction(widget.transaction.id),
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
