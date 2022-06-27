import 'package:claims_deshboard/api/api_service.dart';
import 'package:claims_deshboard/components/auto_suggest_search.dart';
import 'package:claims_deshboard/model/claim_details.dart';
import 'package:claims_deshboard/model/peril_list_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'claim_items.dart';

class ClaimDetails extends StatefulWidget {
  const ClaimDetails({Key? key}) : super(key: key);

  @override
  State<ClaimDetails> createState() => _ClaimDetailsState();
}

class _ClaimDetailsState extends State<ClaimDetails> {
  TextEditingController policyNumberTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController contactPersonNameTextController =
      TextEditingController();
  TextEditingController contactPersonEmailTextController =
      TextEditingController();
  TextEditingController contactPersonNumberTextController =
      TextEditingController();

  var autoSearchResults;
  var capturedDay;
  var capturedTime;
  DateTime currentDateAndTime = DateTime.now();

  List<PerilList> searchListOfPerils = [];

  EdgeInsets topAndLeftSize =
      const EdgeInsets.only(top: 5, left: 20, right: 20);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getListOfPerilsData();
  }

  void _getListOfPerilsData() async {
    searchListOfPerils = (await ApiService().getPerils())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    policyNumberTextController;
    descriptionTextController;
    contactPersonNameTextController;
    contactPersonEmailTextController;
    contactPersonNumberTextController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    autoSearchResults ??= 'Choose cause of incident ...';
    DateTime showCurrentDate = DateTime(
      currentDateAndTime.year,
      currentDateAndTime.month,
      currentDateAndTime.day,
    );

    TimeOfDay showCurrentTime = TimeOfDay.fromDateTime(currentDateAndTime);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
      ),
      body: ListView(
        children: [
          incidentDetailsLabel(context),
          Container(
            margin: topAndLeftSize,
            child: Column(
              children: [
                incidentDatelabel(context, 'Date of incident'),
                GestureDetector(
                  onTap: () async {
                    DateTime? captureDateFromDatePicker = await showDatePicker(
                      context: context,
                      initialDate: showCurrentDate,
                      firstDate: DateTime(
                        currentDateAndTime.year,
                        currentDateAndTime.month,
                        currentDateAndTime.day,
                      ),
                      lastDate: DateTime(3000),
                    );

                    setState(() {
                      if (captureDateFromDatePicker != null) {
                        capturedDay =
                            returnCapturedDate(captureDateFromDatePicker);
                      }
                    });
                  },
                  child: showDateOfIncident(context),
                ),
              ],
            ),
          ),
          Container(
            margin: topAndLeftSize,
            child: Column(
              children: [
                incidentDatelabel(context, 'Time of incident'),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? timePickerDialog = await showTimePicker(
                      context: context,
                      initialTime: showCurrentTime,
                    );

                    setState(() {
                      if (timePickerDialog != null) {
                        capturedTime = timePickerDialog.format(context);
                      }
                    });
                  },
                  child: viewCapturedTime(context),
                ),
              ],
            ),
          ),
          policyTextInput(),
          Container(
            margin: topAndLeftSize,
            child: TextField(
              textInputAction: TextInputAction.none,
              keyboardType: TextInputType.none,
              showCursor: false,
              decoration: const InputDecoration(
                label: Text('Claim items'),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ClaimItems(),
                  ),
                );
              },
            ),
          ),
          autoSearchMenu(),
          getIncidentDescription(context),
          incidentCardMessage(context),
          const Divider(thickness: 1),
          contactPersonDetails(context),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () {
                    setState(() {
                      ClaimDetailsModel claimDetailsModel = ClaimDetailsModel(
                        capturedDay,
                        capturedTime,
                        policyNumberTextController.text,
                        autoSearchResults,
                        descriptionTextController.text,
                        contactPersonNameTextController.text,
                        contactPersonEmailTextController.text,
                        contactPersonNumberTextController.text,
                      );
                    });
                  },
                  child: const Text('DONE'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container policyTextInput() {
    return Container(
      margin: topAndLeftSize,
      child: TextField(
        controller: policyNumberTextController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text('Policy'),
        ),
      ),
    );
  }

  Container viewCapturedTime(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.07,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (capturedTime != null) ...[
            Text('$capturedTime')
          ] else ...[
            const Text("Select Time ....")
          ]
        ],
      ),
    );
  }

  String returnCapturedDate(DateTime date) {
    return DateFormat.yMMMMd().format(date);
  }

  Column contactPersonDetails(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: topAndLeftSize,
          height: MediaQuery.of(context).size.height * 0.03,
          child: const Text(
            'Contact person',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: topAndLeftSize,
          child: TextField(
            controller: contactPersonNameTextController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
          ),
        ),
        Container(
          margin: topAndLeftSize,
          child: TextField(
            controller: contactPersonEmailTextController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Email Adrress'),
            ),
          ),
        ),
        Container(
          margin: topAndLeftSize,
          child: TextField(
            controller: contactPersonNumberTextController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Contact number'),
            ),
          ),
        ),
      ],
    );
  }

  Card incidentCardMessage(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        padding: const EdgeInsets.all(10),
        child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibu'),
      ),
    );
  }

  Container incidentDetailsLabel(BuildContext context) {
    return Container(
      margin: topAndLeftSize,
      height: MediaQuery.of(context).size.height * 0.03,
      child: const Text(
        'Incident Details',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container showDateOfIncident(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.07,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (capturedDay != null) ...[
            Text('$capturedDay')
          ] else ...[
            const Text("Select date ....")
          ]
        ],
      ),
    );
  }

  Container incidentDatelabel(BuildContext context, String nameLabel) {
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Text(
        nameLabel,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }

  Container getIncidentDescription(BuildContext context) {
    return Container(
      margin: topAndLeftSize,
      height: MediaQuery.of(context).size.height * 0.2,
      child: TextField(
        controller: descriptionTextController,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: null,
        expands: true,
        decoration: const InputDecoration(
          label: Text('Description of incident'),
        ),
      ),
    );
  }

  autoSearchMenu() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: MediaQuery.of(context).size.height * 0.07,
          margin: topAndLeftSize,
          child: const Text(
            'Cause of incident',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            autoSearchResults = await showSearch(
              context: context,
              delegate: AutoSuggestSearch(searchListOfPerils),
            );

            if (autoSearchResults == null) {
              autoSearchResults = 'Choose cause of incident ...';
            }
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height * 0.07,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.only(left: 5),
            margin: topAndLeftSize,
            child: Text(
              '$autoSearchResults',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
