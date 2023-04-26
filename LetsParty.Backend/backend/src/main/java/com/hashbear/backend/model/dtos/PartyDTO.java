package com.hashbear.backend.model.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PartyDTO {
    private String name;
    private String description;
    private Date when;
    private Date rsvp;
    private String location;
    private String[] tags;
}
