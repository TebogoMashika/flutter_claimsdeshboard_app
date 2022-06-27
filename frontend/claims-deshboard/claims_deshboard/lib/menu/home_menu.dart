import 'package:claims_deshboard/screens/claim_details.dart';
import 'package:claims_deshboard/screens/view_claims.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          submitClaimBtn(context),
          viewClaimBtn(context),
          searchClaimBtn(context),
        ],
      ),
    );
  }

  GestureDetector submitClaimBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ClaimDetails(),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(top: 70, bottom: 24),
        child: Container(
          color: Colors.purple.shade700,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            'Submit Claim'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector viewClaimBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ViewClaims(),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(24),
        child: Container(
          color: Colors.deepPurple.shade600,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            'View Claims'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector searchClaimBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(24),
        child: Container(
          color: Colors.blueGrey.shade600,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            'search claims'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
