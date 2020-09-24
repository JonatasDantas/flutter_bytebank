import 'package:bytebank/components/InputField.dart';
import 'package:bytebank/datasource/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Contato"),
      ),
      body: SingleChildScrollView(
        child: ContactFormInputs(),
      ),
    );
  }
}

class ContactFormInputs extends StatelessWidget {
  final TextEditingController accountNumberController =
      new TextEditingController();
  final TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputField(
          controller: nameController,
          label: "Nome",
          hint: "João da silva",
        ),
        InputField(
          controller: accountNumberController,
          label: "Número da conta",
          hint: "0000",
          keyboardType: TextInputType.number,
        ),
        RaisedButton(
          onPressed: () => createContact(context),
          child: Text("Confirmar"),
        )
      ],
    );
  }

  createContact(BuildContext context) {
    final int accountNumber = int.tryParse(accountNumberController.text);
    final String name = nameController.text;

    if (accountNumber != null && name != null) {
      final contact = Contact(1, name, accountNumber);
      save(contact).then((id) {
        print("aassasasa");
        Navigator.pop(context);
      });
    }
  }
}
