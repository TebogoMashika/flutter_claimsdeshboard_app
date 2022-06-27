package com.claimsDeshboardBackEnd.repo;

import com.claimsDeshboardBackEnd.models.ClaimsDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ClaimDetailsRepo extends JpaRepository<ClaimsDetails,Long> {

    @Query(value = "SELECT * FROM claims_details x where x.policy = ?1", nativeQuery = true)
    ClaimsDetails getClaimNumberByPolicy(long policy);
}
