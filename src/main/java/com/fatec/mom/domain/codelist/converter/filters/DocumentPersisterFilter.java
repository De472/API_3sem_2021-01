package com.fatec.mom.domain.codelist.converter.filters;

import com.fatec.mom.domain.document.Document;
import com.fatec.mom.domain.document.DocumentService;
import com.fatec.mom.domain.file.FileInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;

/**
 * A classe <code>DocumentPersisterFilter</code> é responsável por persistir os documentos retornados da corrente.
 *
 * @author Tobias Lino
 * @version v01 26/03/2021
 */
@Component
public class DocumentPersisterFilter extends AbstractConverterFilter {

    @Autowired
    private DocumentService documentService;

    @Override
    public List<Document> doFilter(Document referenceDocument, FileInfo fileInfo, List<Document> documents) throws IOException {
        var savedDocuments = documentService.saveAll(documents);

        return doNextFilter(referenceDocument, fileInfo, savedDocuments);
    }
}