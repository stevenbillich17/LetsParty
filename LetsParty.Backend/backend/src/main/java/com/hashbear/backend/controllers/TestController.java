package com.hashbear.backend.controllers;
import com.hashbear.backend.model.entity.Party;
import com.hashbear.backend.model.entity.Person;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;


@Controller
public class TestController {

    @RequestMapping("/persons")
    public List<Person> getPersons() {
        List<Person> persons = new ArrayList<>();
        // Add some dummy data
        persons.add(randomPerson());
        persons.add(randomPerson());
        persons.add(randomPerson());
        return persons;
    }

    // USE THIS METHOD JUST FOR TESTING
    // Helper method to create a random Person object
    private static Person randomPerson() {
        Random random = new Random();
        String name = "Person" + random.nextInt(100);
        String email = name.toLowerCase() + "@example.com";
        byte[] profileImage = null; // You can replace this with a real image data if needed
        Date dateOfBirth = new Date(); // You can replace this with a real date if needed
        List<Person> friends = new ArrayList<>(); // You can add friends to the person object if needed
        return Person.builder()
                .name(name)
                .email(email)
                .profileImage(profileImage)
                .dateOfBirth(dateOfBirth)
                .friends(friends)
                .build();
    }

    @RequestMapping("/parties")
    public List<Party> getParties() {
        List<Party> parties = new ArrayList<>();
        // Add some dummy data
        parties.add(randomParty());
        parties.add(randomParty());
        parties.add(randomParty());
        return parties;
    }

    // USE THIS METHOD JUST FOR TESTING
    // Helper method to create a random Party object
    private static Party randomParty() {
        Random random = new Random();
        String name = "Party" + random.nextInt(100);
        String details = "Details for " + name;
        Person owner = randomPerson();
        List<Person> invitedPeople = new ArrayList<>(); // You can add invited people to the party if needed
        return Party.builder()
                .name(name)
                .owner(owner)
                .details(details)
                .invitedPeople(invitedPeople)
                .build();
    }
}
