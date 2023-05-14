package com.hashbear.backend.model.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.util.UUID;

@Builder
@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "invitations", schema = "public")
public class Invitations {
    @Id
    @GeneratedValue(generator = "UUID")
    private UUID id;
    private String invitedEmail;
    private UUID partyId;
    private int status;
}
