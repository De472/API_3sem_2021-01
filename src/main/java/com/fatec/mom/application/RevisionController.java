package com.fatec.mom.application;

import com.fatec.mom.domain.revision.Revision;
import com.fatec.mom.domain.revision.RevisionService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * A classe <code>RevisionController</code> é responsável por fornecer uma api para as revisões.
 *
 * @author Devanir
 * @version v01 07/05/2021
 */

@RestController
@RequestMapping("/revision")
public class RevisionController {

    @Autowired
    private RevisionService revisionService;

    @PostMapping("/save")
    @ApiOperation(value = "Cria uma nova ou atualiza uma Revision no banco")
    public ResponseEntity<Revision> saveRev (
            @RequestBody Revision rev) {

        var newRev = revisionService.saveRev(rev);

        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON)
                .body(newRev);
    }
}
