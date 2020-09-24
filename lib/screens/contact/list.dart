import 'package:bytebank/datasource/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact/form.dart';
import 'package:bytebank/screens/transactions/form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: findAll(),
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando"),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ContactItem(contact);
                },
              );
              break;
          }

          return Text("Erro");
        },
      ),
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
            builder: (context) => ContactForm(),
          ))
              .then((value) {
            setState(() {
              widget.createState();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// class ContactListState extends State<ContactList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: findAll(),
//         builder: (context, snapshot) {
//           final List<Contact> contacts = snapshot.data;

//           ListView.builder(
//             itemCount: widget._contacts.length,
//             itemBuilder: (context, index) {
//               final contact = widget._contacts[index];
//               return ContactItem(contact);
//             },
//           );
//         },
//       ),
//       appBar: AppBar(
//         title: Text("Contatos"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           final Future<Contact> future = Navigator.push(
//               context, MaterialPageRoute(builder: (context) => ContactForm()));

//           future.then((value) {
//             debugPrint('contato voltando: $value');
//             if (value != null) {
//               setState(() {
//                 widget._contacts.add(value);
//               });
//             }
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class ContactItem extends StatelessWidget {
  final Contact _contact;

  ContactItem(this._contact);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TransactionForm(this._contact),
          ),
        );
      },
      leading: Icon(Icons.people),
      title: Text(
        _contact.name.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(_contact.accountNumber.toString()),
    ));
  }
}
