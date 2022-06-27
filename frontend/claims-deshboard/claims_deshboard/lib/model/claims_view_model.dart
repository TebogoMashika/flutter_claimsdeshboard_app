class ClaimsViewModel {
  var _claimPeril;
  var _claimPolicy;
  var _claimStatus;

  ClaimsViewModel(this._claimPeril, this._claimPolicy, this._claimStatus);

  get getClaimPeril {
    return _claimPeril;
  }

  get getClaimPolicy {
    return _claimPolicy;
  }

  get getClaimStatus {
    return _claimStatus;
  }
}
