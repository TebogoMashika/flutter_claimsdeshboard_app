package com.claimsDeshboardBackEnd.controller;


import com.claimsDeshboardBackEnd.dto.ClaimDetailsRequest;
import com.claimsDeshboardBackEnd.dto.ClaimDetailsResponse;
import com.claimsDeshboardBackEnd.dto.PerilDto;
import com.claimsDeshboardBackEnd.service.ClaimDetailsService;
import com.claimsDeshboardBackEnd.service.PerilServices;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.claimsDeshboardBackEnd.controller.PathConstants.BASE_URL;


@RestController

@RequestMapping(BASE_URL)
@CrossOrigin(origins = {"http://192.168.2.106/"})
public class ClaimsController extends PathConstants{

    private final PerilServices perilServices;
    private final ClaimDetailsService claimDetailsService;

    public ClaimsController(PerilServices perilServices, ClaimDetailsService claimDetailsService) {
        this.perilServices = perilServices;
        this.claimDetailsService = claimDetailsService;
    }

    @GetMapping(VIEW_PERILS)
    public List<PerilDto> requestAllPerils(){
        return  perilServices.findAllPerils();
    }

    @PostMapping(SAVE_CLAIM_DETAILS)
    public ClaimDetailsResponse saveClaimDetails(@RequestBody ClaimDetailsRequest claimDetailsRequest  ){
        ClaimDetailsResponse claimDetailsResponse = claimDetailsService.saveClaimDetails(claimDetailsRequest);

        return claimDetailsResponse;
    }
}
