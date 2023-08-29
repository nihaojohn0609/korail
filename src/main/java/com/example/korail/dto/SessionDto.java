package com.example.korail.dto;

import lombok.Data;

@Data
public class SessionDto {
    int loginResult;
    String name, id,pass, cardnum, email;
    String aid;
}
