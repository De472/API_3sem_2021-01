package com.fatec.mom.domain.trait;

import com.fatec.mom.domain.block.Block;
import com.fatec.mom.domain.document.Document;
import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "MOM_TRACO")
@SequenceGenerator(name = "MOM_TRACO_SQ", sequenceName = "MOM_TRACO_SQ", allocationSize = 1)
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "number")
public class Trait {

    @Id
    @GeneratedValue(generator = "MOM_TRACO_SQ", strategy = GenerationType.SEQUENCE)
    @Column(name = "TRA_COD")
    private Long id;

    @Column(name = "TRA_NUM")
    private Integer number;

    @ManyToOne
    @JoinColumn(name = "DOC_COD")
    private Document document;

    @ManyToOne
    @JoinColumn(name = "BLC_COD")
    private Block block;
}
