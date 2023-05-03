package com.hashbear.backend.model.mappers;

import com.hashbear.backend.model.dtos.PartyDTO;
import com.hashbear.backend.model.entity.Party;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public class PartyMapper {
    public Party partyDTOToParty(PartyDTO partyDTO) {
        StringBuilder tags = new StringBuilder();

        for (String tag : partyDTO.getTags()) {
            tags.append(tag).append(",");
        }

        return Party.builder()
                .id(partyDTO.getId())
                .name(partyDTO.getName())
                .description(partyDTO.getDescription())
                .when(partyDTO.getWhen())
                .rsvp(partyDTO.getRsvp())
                .location(partyDTO.getLocation())
                .tags(tags.toString())
                .hostEmail(partyDTO.getHostEmail())
                .build();
    }

    public PartyDTO partyToPartyDTO(Party party) {
        String[] tags = party.getTags().split(",");

        return PartyDTO.builder()
                .id(party.getId())
                .name(party.getName())
                .description(party.getDescription())
                .when(party.getWhen())
                .rsvp(party.getRsvp())
                .location(party.getLocation())
                .tags(tags)
                .hostEmail(party.getHostEmail())
                .build();
    }
}
