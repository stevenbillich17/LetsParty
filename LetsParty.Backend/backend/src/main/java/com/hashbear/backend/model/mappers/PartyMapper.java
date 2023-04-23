package com.hashbear.backend.model.mappers;

import com.hashbear.backend.model.dtos.PartyDTO;
import com.hashbear.backend.model.entity.Party;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public class PartyMapper {
    public Party partyDTOToParty(PartyDTO partyDTO) {
        String tags = "";

        for (String tag : partyDTO.getTags()) {
            tags += tag + ",";
        }

        return Party.builder()
                .name(partyDTO.getName())
                .description(partyDTO.getDescription())
                .when(partyDTO.getWhen())
                .rsvp(partyDTO.getRsvp())
                .location(partyDTO.getLocation())
                .tags(tags)
                .build();
    }

    public PartyDTO partyToPartyDTO(Party party) {
        String[] tags = party.getTags().split(",");

        return PartyDTO.builder()
                .name(party.getName())
                .description(party.getDescription())
                .when(party.getWhen())
                .rsvp(party.getRsvp())
                .location(party.getLocation())
                .tags(tags)
                .build();
    }
}
