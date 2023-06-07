package com.hashbear.backend.repositories;

import com.hashbear.backend.model.entity.Invitations;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface InvitationsRepository extends JpaRepository<Invitations, UUID> {
    List<Invitations> findByPartyId(UUID partyId);
    List<Invitations> findByInvitedEmail(String email);
    Invitations findByPartyIdAndInvitedEmail(UUID partyId, String email);
}
