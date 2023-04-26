package com.hashbear.backend.services;

import com.hashbear.backend.model.auth.AuthenticationRequest;
import com.hashbear.backend.model.auth.AuthenticationResponse;
import com.hashbear.backend.model.auth.RegisterRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationService {

    public AuthenticationResponse register(RegisterRequest request) {
    }

    public AuthenticationResponse authenticate(AuthenticationRequest request) {
    }
}
