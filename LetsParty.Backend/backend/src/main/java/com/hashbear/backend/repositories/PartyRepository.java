package com.hashbear.backend.repositories;

import com.hashbear.backend.model.entity.Party;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface PartyRepository extends JpaRepository<Party, UUID> {
}
