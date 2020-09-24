import 'package:bytebank/screens/contact/list.dart';
import 'package:bytebank/screens/transactions/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "images/thumbnail_cleartech.png",
              width: 400,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TabItem(
                  "Contatos",
                  Icons.monetization_on,
                  onTap: () => navigateContacts(context),
                ),
                TabItem(
                  "Transferências",
                  Icons.description,
                  onTap: () => navigateTransactions(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateContacts(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ContactList()),
    );
  }

  void navigateTransactions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TransactionsList()),
    );
  }
}

class TabItem extends StatelessWidget {
  final String _name;
  final IconData _icon;
  final Function onTap;

  TabItem(this._name, this._icon, {@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => this.onTap(),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 100,
          width: 150,
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                _icon,
                color: Colors.white,
                size: 24,
              ),
              Text(
                _name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Speedometer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Center(
//         child: Speedometer(
//           size: 250,
//           minValue: 0,
//           maxValue: 180,
//           currentValue: 76,
//           warningValue: 180,
//           displayText: 'Mbps',
//           backgroundColor: Colors.white,
//           meterColor: Colors.blue[300],
//           kimColor: Colors.black,
//           displayNumericStyle: TextStyle(
//             fontSize: 32.0,
//             fontWeight: FontWeight.bold,
//           ),
//           displayTextStyle: TextStyle(
//             fontSize: 18.0,
//             color: Colors.grey
//           ),
//         ),
//       ),
//     );
//   }

// }
