package com.hashbear.backend.model.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileResponse {
    private String id;
    private String name;
    private Long size;
    private String url;
    private String contentType;
}
