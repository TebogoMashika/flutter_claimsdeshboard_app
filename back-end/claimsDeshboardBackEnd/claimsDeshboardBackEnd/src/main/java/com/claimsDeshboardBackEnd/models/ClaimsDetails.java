package com.claimsDeshboardBackEnd.models;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "claims_details")
public class ClaimsDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date incidentDate;
    private String incidentTime;

    @Column(name = "policy")
    private int policy;
    private String claimedItem;
    private String causeOfIncident;
    private String incidentDescription;
    private String contactPersonName;
    private String contactPersonEmailAddress;
    private long contactPersonNumber;

}
