package com.hashbear.backend.services;

import com.hashbear.backend.model.entity.User;
import com.hashbear.backend.repositories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Optional;

@Service
@AllArgsConstructor
public class UserService {
    @Autowired
    private final UserRepository userRepository;

    public String getUserName(String email) {
        Optional<User> user = userRepository.findByEmail(email);
        if (user.isEmpty()) {
            return null;
        }
        return user.get().getName();
    }

    public HashMap<String, String> getAllUsers() {
        try {
            HashMap<String, String> users = new HashMap<>();
            for (User user : userRepository.findAll()) {
                users.put(user.getEmail(), user.getName());
            }
            return users;
        } catch (Exception e) {
            return new HashMap<>();
        }
    }
}
