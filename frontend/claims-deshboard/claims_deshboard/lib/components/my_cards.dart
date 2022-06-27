import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  var claimPeril;
  var claimPolicy;
  var claimStatus;

  CardView(this.claimPeril, this.claimPolicy, this.claimStatus, {Key? key})
      : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(18),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Peril: ${widget.claimPeril}'.toUpperCase()),
            Text('Policy: ${widget.claimPolicy}'.toUpperCase()),
            Text(
              'Claim Status: ${widget.claimStatus}'.toUpperCase(),
              style: TextStyle(
                backgroundColor: Colors.yellow.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
