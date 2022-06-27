class ClaimDetailsModel {
  var incidentDate;
  var incidentTime;
  var policyNumber;
  var claimedItems;
  var peril;
  var claimDescription;
  var contactPersonName;
  var contactPersonEmailAddress;
  var contactPersonPhone;

  ClaimDetailsModel(
    this.incidentDate,
    this.incidentTime,
    this.policyNumber,
    //this.claimedItems,
    this.peril,
    this.claimDescription,
    this.contactPersonName,
    this.contactPersonEmailAddress,
    this.contactPersonPhone,
  );
}
