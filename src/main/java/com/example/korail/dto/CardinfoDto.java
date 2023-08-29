package com.example.korail.dto;

import lombok.Data;

@Data
public class CardinfoDto {
    private String cardnum,recognizenum,birthday,cardcomp,cardNum1,cardNum2,cardNum3,cardNum4,cardMonth,cardYear,cardPw,cid,paymentmethod;

    public String getCardnum() {
        if(cardNum1 != null) {
            cardnum = cardNum1 + "-"+ cardNum2 +"-"+ cardNum3 + "-" + cardNum4;
        }
        return cardnum;
    }
}
