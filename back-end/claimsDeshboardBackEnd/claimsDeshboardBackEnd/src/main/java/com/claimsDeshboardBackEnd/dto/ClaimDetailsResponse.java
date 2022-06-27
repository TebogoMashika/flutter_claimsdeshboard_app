package com.claimsDeshboardBackEnd.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ClaimDetailsResponse {
    private Long claimNumber;
    private long policyNumber;

}
