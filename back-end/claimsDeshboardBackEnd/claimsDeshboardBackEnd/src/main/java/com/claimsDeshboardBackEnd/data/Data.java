package com.claimsDeshboardBackEnd.data;

import com.claimsDeshboardBackEnd.models.Perils;
import com.claimsDeshboardBackEnd.repo.PerilRepo;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Data implements CommandLineRunner {

    private final PerilRepo perilRepo;

    public Data(PerilRepo perilRepo) {
        this.perilRepo = perilRepo;
    }
    @Override
    public void run(String... args) throws Exception {

        Perils peril1 = new Perils();
        peril1.setPerilCd(12);
        peril1.setPerilName("Accidental Damage");

        perilRepo.save(peril1);

        Perils peril2 = new Perils();
        peril2.setPerilCd(13);
        peril2.setPerilName("Theft");

        perilRepo.save(peril2);

        Perils peril3 = new Perils();
        peril3.setPerilCd(14);
        peril3.setPerilName("Storm");

        perilRepo.save(peril3);

        Perils peril4 = new Perils();
        peril4.setPerilCd(15);
        peril4.setPerilName("Malicious Damage");

        perilRepo.save(peril4);

        Perils peril5 = new Perils();
        peril5.setPerilCd(6);
        peril5.setPerilName("Attempted theft");

        perilRepo.save(peril5);


    }
}
