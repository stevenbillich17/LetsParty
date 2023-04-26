package com.hashbear.backend.model.entity;

<<<<<<< Updated upstream
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.util.UUID;

=======
import jakarta.persistence.*;
import lombok.*;

>>>>>>> Stashed changes
@Builder
@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "invitations", schema = "public")
public class Invitations {
    @Id
    @GeneratedValue(generator = "increment")
    private Long id;
    private String invitedEmail;
<<<<<<< Updated upstream
    private UUID partyId;
=======
    @ManyToOne
    @JoinColumn(name = "party_id")
    private Party party;
>>>>>>> Stashed changes
    private int status;
}
