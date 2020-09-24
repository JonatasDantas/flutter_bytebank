import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/loading.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions = List();

  @override
  Widget build(BuildContext context) {
    // transactions.add(Transaction(100.0, Contact(0, 'Alex', 1000)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: FutureBuilder<List<Transaction>>(
        initialData: List(),
        future: findAll(),
        builder: (context, snapshot) {
          final List<Transaction> transactions = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return LoadingIndicator();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (transactions != null && transactions.isNotEmpty) {
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final Transaction transaction = transactions[index];

                    return TransactionItem(transaction);
                  },
                );
              }

              return CenteredMessage(
                "Nenhuma transação encontrada",
                icon: Icons.warning,
              );

              break;
          }

          return Text("Erro");
        },
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(
          _transaction.value.toString(),
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          _transaction.contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
