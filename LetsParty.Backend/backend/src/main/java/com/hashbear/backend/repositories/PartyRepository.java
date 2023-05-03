package com.hashbear.backend.repositories;

import com.hashbear.backend.model.entity.Party;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PartyRepository extends JpaRepository<Party, UUID> {
    List<Party> findAllByHostEmail(String hostEmail);
    @Query("SELECT p FROM Party p JOIN p.invitations i WHERE i.invitedEmail = :invitedEmail")
    List<Party> findAllByInvitedEmail(@Param("invitedEmail") String invitedEmail);
}
