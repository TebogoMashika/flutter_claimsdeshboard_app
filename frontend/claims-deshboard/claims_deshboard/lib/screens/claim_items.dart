import 'package:flutter/material.dart';

class ClaimItems extends StatefulWidget {
  const ClaimItems({Key? key}) : super(key: key);

  @override
  State<ClaimItems> createState() => _ClaimItemsState();
}

class _ClaimItemsState extends State<ClaimItems> {
  var _checkedVehicle = false;
  var _CheckedPP = false;
  var _CheckedPP2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
            height: MediaQuery.of(context).size.height * 0.03,
            child: const Text(
              'Vehicle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CheckboxListTile(
            title: const Text('Type of vehicle'),
            value: _checkedVehicle,
            secondary: const Icon(Icons.car_repair_outlined),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                _checkedVehicle = value!;
              });
            },
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
            height: MediaQuery.of(context).size.height * 0.03,
            child: const Text(
              'Portable Possessions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CheckboxListTile(
            title: const Text('Phone'),
            value: _CheckedPP,
            secondary: const Icon(Icons.phone_android_outlined),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                _CheckedPP = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Phone'),
            value: _CheckedPP2,
            secondary: const Icon(Icons.phone_iphone_outlined),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                _CheckedPP2 = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
