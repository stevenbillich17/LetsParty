package com.hashbear.backend.model.mappers;

import com.hashbear.backend.model.dtos.InvitationsDTO;
import com.hashbear.backend.model.entity.Invitations;
<<<<<<< Updated upstream
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
=======
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
        final PartyMapper partyMapper = new PartyMapper();

        Invitations invitations = Invitations.builder()
                .party(partyMapper.partyDTOToParty(partyService.getParty(invitationsDTO.getPartyId())))
                .invitedEmail(invitationsDTO.getInvitedEmail())
                .status(invitationsDTO.getStatus())
                .build();

        return invitations;
    }

    public InvitationsDTO invitationsToInvitationsDTO(Invitations invitations) {
        final PartyMapper partyMapper = new PartyMapper();
        return InvitationsDTO.builder()
                .partyId(partyMapper.partyToPartyDTO(invitations.getParty()).getId())
>>>>>>> Stashed changes
                .invitedEmail(invitations.getInvitedEmail())
                .status(invitations.getStatus())
                .build();
    }
}