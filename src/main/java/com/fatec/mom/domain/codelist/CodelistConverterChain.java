package com.fatec.mom.domain.codelist;

import com.fatec.mom.domain.codelist.converter.filters.AbstractConverterFilter;
import com.fatec.mom.domain.document.Document;
import com.fatec.mom.domain.file.FileInfo;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;

/**
 * Corresponde ao cliente que realiza uma solicitação no Design Pattern Chain of Responsibility.
 *
 * @author Tobias Lino
 * @version v01 26/03/2021
 */
@Component
public class CodelistConverterChain {

    @Getter @Setter
    private AbstractConverterFilter converterFilter;

    public List<Document> doFilters(Document referenceDocument, FileInfo fileInfo, List<Document> documents) throws IOException {
        return converterFilter.doFilter(referenceDocument, fileInfo, documents);
    }
}