package com.hashbear.backend;

import com.hashbear.backend.model.entity.File;
import com.hashbear.backend.repositories.FileRepository;
import com.hashbear.backend.services.FileService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

public class FileServiceTest {

    @Mock
    private FileRepository fileRepository;

    @InjectMocks
    private FileService fileService;

    private File file;
    private MockMultipartFile multipartFile;

    @BeforeEach
    void setUp() throws IOException {
        MockitoAnnotations.initMocks(this);

        UUID id = UUID.randomUUID();
        multipartFile = new MockMultipartFile("data", "filename.txt", "text/plain", "some xml".getBytes());

        file = new File();
        file.setId(id);
        file.setName(StringUtils.cleanPath(multipartFile.getOriginalFilename()));
        file.setContentType(multipartFile.getContentType());
        file.setData(multipartFile.getBytes());
        file.setSize(multipartFile.getSize());
    }

    @Test
    void testSave() throws IOException {
        fileService.save(multipartFile);

        verify(fileRepository, times(1)).save(any(File.class));
    }

    @Test
    void testGetFile() {
        UUID id = file.getId();
        when(fileRepository.findById(id)).thenReturn(Optional.of(file));

        Optional<File> result = fileService.getFile(id);

        assertTrue(result.isPresent());
        assertEquals(id, result.get().getId());
        verify(fileRepository, times(1)).findById(id);
    }

    @Test
    void testGetAllFiles() {
        when(fileRepository.findAll()).thenReturn(Collections.singletonList(file));

        List<File> result = fileService.getAllFiles();

        assertEquals(1, result.size());
        assertEquals(file.getId(), result.get(0).getId());
        verify(fileRepository, times(1)).findAll();
    }
}
