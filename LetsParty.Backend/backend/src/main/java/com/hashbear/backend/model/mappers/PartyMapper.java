package com.hashbear.backend.model.mappers;

import com.hashbear.backend.model.dtos.PartyDTO;
import com.hashbear.backend.model.entity.Party;
import com.hashbear.backend.services.FileService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

@NoArgsConstructor
@AllArgsConstructor
public class PartyMapper {

    @Autowired
    private FileService fileService;

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
                .image(fileService.getFile(partyDTO.getImage()).orElse(null))
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
                .image(party.getImage() != null ? party.getImage().getId() : null)
                .build();
    }
}
