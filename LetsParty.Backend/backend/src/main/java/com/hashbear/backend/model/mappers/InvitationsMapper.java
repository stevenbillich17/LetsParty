package com.hashbear.backend.model.mappers;

import com.hashbear.backend.model.dtos.InvitationsDTO;
import com.hashbear.backend.model.entity.Invitations;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public class InvitationsMapper {
    public Invitations invitationsDTOtoInvitations(InvitationsDTO invitationsDTO) {
        return Invitations.builder()
                .partyId(invitationsDTO.getPartyId())
                .invitedEmail(invitationsDTO.getInvitedEmail())
                .status(invitationsDTO.getStatus())
                .build();
    }

    public InvitationsDTO invitationsToInvitationsDTO(Invitations invitations) {
        return InvitationsDTO.builder()
                .partyId(invitations.getPartyId())
                .invitedEmail(invitations.getInvitedEmail())
                .status(invitations.getStatus())
                .build();
    }
}
