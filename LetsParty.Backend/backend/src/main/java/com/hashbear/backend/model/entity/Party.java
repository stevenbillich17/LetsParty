package com.hashbear.backend.model.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Builder
@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "parties", schema = "public")
public class Party {
    @Id
    @GeneratedValue(generator = "UUID")
    private UUID id;
    private String name;
    private String description;
    @Column(name = "party_date")
    private Date when;
    private Date rsvp;
    private String location;
    private String tags;

    @OneToMany(mappedBy = "partyId", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Invitations> invitations;
}
