package com.claimsDeshboardBackEnd.dto;

import com.claimsDeshboardBackEnd.models.Perils;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class PerilDto {
    private int perilCd;
    private String perilName;
}
