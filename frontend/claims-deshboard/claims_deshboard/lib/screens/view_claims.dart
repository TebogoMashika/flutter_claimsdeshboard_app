import 'package:claims_deshboard/components/my_cards.dart';
import 'package:claims_deshboard/model/claims_view_model.dart';
import 'package:flutter/material.dart';

class ViewClaims extends StatefulWidget {
  const ViewClaims({Key? key}) : super(key: key);

  @override
  State<ViewClaims> createState() => _ViewClaimsState();
}

class _ViewClaimsState extends State<ViewClaims> {
  late List<ClaimsViewModel> claimHistoryItems = [
    ClaimsViewModel('peril', 123456, 'pending'),
    ClaimsViewModel('peril', 123456, 'active'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Claim History',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple.shade600,
      ),
      body: ListView.builder(
        itemCount: claimHistoryItems.length,
        itemBuilder: (context, index) => CardView(
          claimHistoryItems[index].getClaimPeril,
          claimHistoryItems[index].getClaimPolicy,
          claimHistoryItems[index].getClaimStatus,
        ),
      ),
    );
  }
}
