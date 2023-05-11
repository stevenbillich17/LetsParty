package com.hashbear.backend.model.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class FileResponse {
    private UUID id;
    private String name;
    private Long size;
    private String url;
    private String contentType;
}
