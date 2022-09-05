import 'package:banking_app/view_models/transctions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("All tranasactions"),
        ),
        body: Consumer<TransactionViewModel>(
          builder: (context, transactionsData, child) {
            print(transactionsData.isLoading);
            return ListView(
              children: List.generate(
                transactionsData.universalItems.length,
                (index) => ListTile(
                  title: Text(
                    transactionsData.universalItems[index].dateTime.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
