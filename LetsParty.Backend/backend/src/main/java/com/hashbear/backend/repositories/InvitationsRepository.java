package com.hashbear.backend.repositories;

import com.hashbear.backend.model.entity.Invitations;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface InvitationsRepository extends JpaRepository<Invitations, Long> {
    List<Invitations> findByPartyId(UUID partyId);
<<<<<<< Updated upstream
=======
    List<Invitations> findByInvitedEmail(String email);
>>>>>>> Stashed changes
}
