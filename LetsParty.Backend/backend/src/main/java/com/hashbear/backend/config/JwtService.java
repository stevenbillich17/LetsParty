package com.hashbear.backend.config;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.function.Function;

@Service
public class JwtService {

    private static final String SECRET_KEY = "4B6250655368566D597133743677397A24432646294A404E635166546A576E5A7234753778214125442A472D4B6150645367556B58703273357638792F423F45";

    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject); // the subject is the email
    }

    private <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    /**
     * Method that extracts all the claims for given JWT token
     * @param token
     * @return all the claims that were stored in the jwt token
     */
    private Claims extractAllClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(getSignInKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    private Key getSignInKey() {
        byte[] keyBytes = Decoders.BASE64.decode(SECRET_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
