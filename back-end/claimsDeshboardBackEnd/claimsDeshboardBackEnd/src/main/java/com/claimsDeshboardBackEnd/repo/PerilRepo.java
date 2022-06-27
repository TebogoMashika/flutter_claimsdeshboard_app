package com.claimsDeshboardBackEnd.repo;

import com.claimsDeshboardBackEnd.models.Perils;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PerilRepo extends JpaRepository<Perils, Long> {
}
