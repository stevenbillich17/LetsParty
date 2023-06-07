package com.hashbear.backend.controllers;

import com.hashbear.backend.model.dtos.InvitationsDTO;
import com.hashbear.backend.services.InvitationsService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/invitations")
public class InvitationsController {
    @Autowired
    private final InvitationsService invitationsService;

    @PostMapping
    public InvitationsDTO createInvitation(@RequestBody InvitationsDTO invitation) {
        return invitationsService.createInvitation(invitation);
    }

    @GetMapping("/party/{partyId}")
    public ResponseEntity getInvitationsForParty(@PathVariable("partyId") UUID partyId) {
        List<InvitationsDTO> invitations = invitationsService.getInvitationForParty(partyId);
        return ResponseEntity.ok(invitations);
    }

    //TODO: is not functional
    @GetMapping("/invited/{email}")
    public ResponseEntity getInvitationsForEmail(@PathVariable("email") String email) {
        return ResponseEntity.ok(invitationsService.getInvitationForEmail(email));
    }

    @PostMapping("/accept/{partyId}/{email}")
    public ResponseEntity acceptInvitation(@PathVariable("partyId") UUID partyId, @PathVariable("email") String email) {
        return ResponseEntity.ok(invitationsService.acceptInvitation(partyId, email));
    }

    @PostMapping("/decline/{partyId}/{email}")
    public ResponseEntity declineInvitation(@PathVariable("partyId") UUID partyId, @PathVariable("email") String email) {
        return ResponseEntity.ok(invitationsService.declineInvitation(partyId, email));
    }

    @GetMapping("/status/{partyId}/{email}")
    public ResponseEntity<Integer> getInvitationStatus(@PathVariable("partyId") UUID partyId, @PathVariable("email") String email) {
        return ResponseEntity.ok(invitationsService.getInvitationStatus(partyId, email));
    }
}
