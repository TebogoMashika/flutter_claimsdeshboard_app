package com.claimsDeshboardBackEnd.service;

import com.claimsDeshboardBackEnd.dto.ClaimDetailsRequest;
import com.claimsDeshboardBackEnd.dto.ClaimDetailsResponse;
import com.claimsDeshboardBackEnd.models.ClaimsDetails;
import com.claimsDeshboardBackEnd.repo.ClaimDetailsRepo;
import org.springframework.stereotype.Service;

@Service
public class ClaimDetailsService {

    private final ClaimDetailsRepo claimDetailsRepo;

    public ClaimDetailsService(ClaimDetailsRepo claimDetailsRepo) {
        this.claimDetailsRepo = claimDetailsRepo;
    }

    public ClaimDetailsResponse saveClaimDetails( ClaimDetailsRequest claimDetailsRequest){

        ClaimsDetails claimsDetails = ClaimsDetails.builder()
                .incidentDate(claimDetailsRequest.getClaimsDetails().getIncidentDate())
                .incidentTime(claimDetailsRequest.getClaimsDetails().getIncidentTime())
                .policy(claimDetailsRequest.getClaimsDetails().getPolicy())
                .claimedItem(claimDetailsRequest.getClaimsDetails().getClaimedItem())
                .causeOfIncident(claimDetailsRequest.getClaimsDetails().getCauseOfIncident())
                .incidentDescription(claimDetailsRequest.getClaimsDetails().getIncidentDescription())
                .contactPersonEmailAddress(claimDetailsRequest.getClaimsDetails().getContactPersonEmailAddress())
                .contactPersonName(claimDetailsRequest.getClaimsDetails().getContactPersonName())
                .contactPersonNumber(claimDetailsRequest.getClaimsDetails().getContactPersonNumber())
                .build();

        claimDetailsRepo.save(claimsDetails);

        ClaimDetailsResponse claimDetailsResponse = getClaimDetails(claimDetailsRequest.getClaimsDetails().getPolicy());

        return claimDetailsResponse;

    }

    private ClaimDetailsResponse getClaimDetails(long policy) {
        ClaimsDetails claimsDetails = claimDetailsRepo.getClaimNumberByPolicy(policy);

        ClaimDetailsResponse claimDetailsResponse = ClaimDetailsResponse.builder()
                .claimNumber(claimsDetails.getId())
                .policyNumber(claimsDetails.getPolicy())
                .build();

        return claimDetailsResponse;


    }

}
