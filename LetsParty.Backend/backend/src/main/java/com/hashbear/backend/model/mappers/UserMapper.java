package com.hashbear.backend.model.mappers;

import com.hashbear.backend.model.dtos.UserDTO;
import com.hashbear.backend.model.entity.User;
import lombok.RequiredArgsConstructor;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
@RequiredArgsConstructor
public class UserMapper {

    public UserDTO userToUserDTO(User user) {
        return UserDTO.builder()
                .email(user.getEmail())
                .name(user.getName())
                .build();
    }
}
