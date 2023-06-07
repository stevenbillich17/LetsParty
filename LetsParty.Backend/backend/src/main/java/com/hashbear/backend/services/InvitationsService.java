package com.hashbear.backend.services;

import com.hashbear.backend.model.dtos.InvitationsDTO;
import com.hashbear.backend.model.entity.Invitations;
import com.hashbear.backend.model.mappers.InvitationsMapper;
import com.hashbear.backend.repositories.InvitationsRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@AllArgsConstructor
public class InvitationsService {
    private final InvitationsRepository invitationsRepository;
    private final InvitationsMapper invitationsMapper = new InvitationsMapper();

    public InvitationsDTO createInvitation(InvitationsDTO invitation) {
        return invitationsMapper.invitationsToInvitationsDTO(invitationsRepository.save(invitationsMapper.invitationsDTOtoInvitations(invitation)));
    }

    public List<InvitationsDTO> getInvitationForParty(UUID partyId) {
        return invitationsRepository.findByPartyId(partyId).stream().map(invitationsMapper::invitationsToInvitationsDTO).toList();
    }

    public List<InvitationsDTO> getInvitationForEmail(String email) {
        return invitationsRepository.findByInvitedEmail(email).stream().map(invitationsMapper::invitationsToInvitationsDTO).toList();
    }

    public UUID acceptInvitation(UUID partyId, String email) {
        Invitations invitation = invitationsRepository.findByPartyIdAndInvitedEmail(partyId, email);
        invitation.setStatus(1);
        invitationsRepository.save(invitation);
        return partyId;
    }

    public UUID declineInvitation(UUID partyId, String email) {
        Invitations invitation = invitationsRepository.findByPartyIdAndInvitedEmail(partyId, email);
        invitation.setStatus(-1);
        invitationsRepository.save(invitation);
        return partyId;
    }

    public int getInvitationStatus(UUID partyId, String email) {
        Invitations invitation = invitationsRepository.findByPartyIdAndInvitedEmail(partyId, email);
        return invitation.getStatus();
    }
}
