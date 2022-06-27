package com.claimsDeshboardBackEnd.service;

import com.claimsDeshboardBackEnd.dto.PerilDto;
import com.claimsDeshboardBackEnd.models.Perils;
import com.claimsDeshboardBackEnd.repo.PerilRepo;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PerilServices {

    private final PerilRepo perilRepo;

    public PerilServices(PerilRepo perilRepo) {
        this.perilRepo = perilRepo;
    }

    public List<PerilDto> findAllPerils(){
        List<Perils> perilsList = perilRepo.findAll();

        if (!perilsList.isEmpty()){

            List<PerilDto> perilDtoList = new ArrayList<>();

            for(Perils perils : perilsList){
                PerilDto perilDto = PerilDto.builder()
                        .perilCd(perils.getPerilCd())
                        .perilName(perils.getPerilName())
                        .build();
                perilDtoList.add(perilDto);
            }

            return perilDtoList;
        }
        return null;
    }
}
