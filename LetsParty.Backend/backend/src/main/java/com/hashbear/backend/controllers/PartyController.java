package com.hashbear.backend.controllers;

import com.hashbear.backend.model.dtos.PartyDTO;
import com.hashbear.backend.services.PartyService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/parties")
public class PartyController {

    @Autowired
    private final PartyService partyService;

    @PostMapping
    public ResponseEntity createParty(@RequestBody PartyDTO party) {
        PartyDTO newParty = partyService.createParty(party);
        return ResponseEntity.ok(newParty);
    }

    @GetMapping("/{id}")
    public ResponseEntity getParty(@PathVariable("id") UUID id) {
        PartyDTO party = partyService.getParty(id);
        return ResponseEntity.ok(party);
    }

    @GetMapping
    public ResponseEntity getAllParties() {
        PartyDTO[] parties = partyService.getAllParties();
        return ResponseEntity.ok(parties);
    }

    @GetMapping("/host/{email}")
    public ResponseEntity getHostedParties(@PathVariable("email") String email) {
        PartyDTO[] parties = partyService.getHostedParties(email);
        return ResponseEntity.ok(parties);
    }

    @GetMapping("/invited/{email}")
    public ResponseEntity getInvitedParties(@PathVariable("email") String email) {
        PartyDTO[] parties = partyService.getAllPartiesForInvitedEmail(email);
        return ResponseEntity.ok(parties);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteParty(@PathVariable("id") UUID id) {
        partyService.deleteParty(id);
        return ResponseEntity.ok().build();
    }
}
