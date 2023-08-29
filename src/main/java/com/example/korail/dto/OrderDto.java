package com.example.korail.dto;

import lombok.Data;

@Data
public class OrderDto {
    private String price,sstation, rdate, stime, dtime, dstation, reservnum, chairnum, id, depPlaceId, arrPlaceId, depPlandTime, cardnum, cdate,email, cid, cardcomp, recognizenum;
    private int rno, trainnum, ticketqty, cancel;
}
