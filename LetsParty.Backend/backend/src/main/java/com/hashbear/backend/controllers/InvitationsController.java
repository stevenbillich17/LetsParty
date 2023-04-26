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

<<<<<<< Updated upstream
    @GetMapping("/{partyId}")
=======
    @GetMapping("/party/{partyId}")
>>>>>>> Stashed changes
    public ResponseEntity getInvitationsForParty(@PathVariable("partyId") UUID partyId) {
        List<InvitationsDTO> invitations = invitationsService.getInvitationForParty(partyId);
        return ResponseEntity.ok(invitations);
    }
<<<<<<< Updated upstream
=======

    @GetMapping("/email/{email}")
    public ResponseEntity getInvitationsForEmail(@PathVariable("email") String email) {
        List<InvitationsDTO> invitations = invitationsService.getInvitationForEmail(email);
        return ResponseEntity.ok(invitations);
    }
>>>>>>> Stashed changes
}
