package com.hashbear.backend.model.mappers;

import com.hashbear.backend.model.dtos.InvitationsDTO;
import com.hashbear.backend.model.entity.Invitations;
import com.hashbear.backend.services.PartyService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.mapstruct.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@NoArgsConstructor
@AllArgsConstructor
@Mapper(componentModel = "spring")
public class InvitationsMapper {
    @Autowired
    private PartyService partyService;

    public Invitations invitationsDTOtoInvitations(InvitationsDTO invitationsDTO) {
        final PartyMapper partyMapper;

        return Invitations.builder()
                .partyId(invitationsDTO.getPartyId())
                .invitedEmail(invitationsDTO.getInvitedEmail())
                .status(invitationsDTO.getStatus())
                .build();
    }

    public InvitationsDTO invitationsToInvitationsDTO(Invitations invitations) {
        final PartyMapper partyMapper;
        return InvitationsDTO.builder()
                .partyId(invitations.getPartyId())
                .invitedEmail(invitations.getInvitedEmail())
                .status(invitations.getStatus())
                .build();
    }
}
