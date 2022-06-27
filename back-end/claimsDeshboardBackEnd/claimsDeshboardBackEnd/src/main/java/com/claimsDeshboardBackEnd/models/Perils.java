package com.claimsDeshboardBackEnd.models;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "perils")
public class Perils {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "perilCd")
    private int perilCd;
    @Column(name = "perilName")
    private String perilName;

}
