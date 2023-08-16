package com.springboot.gga.dto;

import lombok.Data;

@Data
public class IndexSearchDto {
    String movieId, movieTitle, mainPoster, genre, movieName,
            nid, ntitle, nhits, ndate,
            bid, btitle, bhits, mid, bdate,
            pid, pname, gfile;
    int mrno, nrno, brno, prno ;
}
