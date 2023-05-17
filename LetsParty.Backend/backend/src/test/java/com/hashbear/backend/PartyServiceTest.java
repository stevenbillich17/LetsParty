package com.hashbear.backend;

import com.hashbear.backend.model.dtos.PartyDTO;
import com.hashbear.backend.model.entity.Party;
import com.hashbear.backend.model.mappers.PartyMapper;
import com.hashbear.backend.repositories.PartyRepository;
import com.hashbear.backend.services.PartyService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class PartyServiceTest {

	@Mock
	private PartyRepository partyRepository;

	@InjectMocks
	private PartyService partyService;

	private PartyMapper partyMapper = new PartyMapper();

	private PartyDTO partyDTO;
	private Party party;
	private UUID id = UUID.randomUUID();

	@BeforeEach
	void setUp() {
		//is not ok
		partyDTO = PartyDTO.builder().id(id).tags(new String[]{}).build();

		party = partyMapper.partyDTOToParty(partyDTO);
	}

	@Test
	void testCreateParty() {
		when(partyRepository.save(any(Party.class))).thenReturn(party);

		PartyDTO result = partyService.createParty(partyDTO);

		assertEquals(partyDTO.getId(), result.getId());
		verify(partyRepository, times(1)).save(any(Party.class));
	}

	@Test
	void testGetParty() {
		when(partyRepository.existsById(id)).thenReturn(true);
		when(partyRepository.findById(id)).thenReturn(Optional.of(party));

		PartyDTO result = partyService.getParty(id);

		assertEquals(partyDTO.getId(), result.getId());
		verify(partyRepository, times(1)).existsById(id);
		verify(partyRepository, times(1)).findById(id);
	}

	@Test
	void testDeleteParty() {
		when(partyRepository.existsById(id)).thenReturn(true);

		partyService.deleteParty(id);

		verify(partyRepository, times(1)).existsById(id);
		verify(partyRepository, times(1)).deleteById(id);
	}

	@Test
	void testDeleteParty_NotFound() {
		when(partyRepository.existsById(id)).thenReturn(false);

		Exception exception = assertThrows(RuntimeException.class, () -> partyService.deleteParty(id));

		assertEquals("Party not found with id: " + id, exception.getMessage());
		verify(partyRepository, times(1)).existsById(id);
		verify(partyRepository, times(0)).deleteById(id);
	}

	@Test
	void testGetAllParties() {
		List<Party> parties = new ArrayList<>();
		parties.add(party);
		when(partyRepository.findAll()).thenReturn(parties);

		PartyDTO[] result = partyService.getAllParties();

		assertEquals(1, result.length);
		assertEquals(partyDTO.getId(), result[0].getId());
		verify(partyRepository, times(1)).findAll();
	}

}
