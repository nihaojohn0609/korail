package com.example.korail.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDto {
    String id, pass, name, userEmail1, userEmail2, tel, phonenumber1, phonenumber2, phonenumber3 , year , month, date,
            gender;
    int rno, preferential;
    String mid, email , pnumber, birth , mdate,pagename,seatNum,ticketQty,adltTotAmt;
    String aid;
    String afile;
    String asfile;
    int permission;
    MultipartFile file1;

    public String getEmail() {
        if(userEmail1 != null) {
            email = userEmail1 +"@" + userEmail2;
        }
        return email;
    }

    public String getPnumber() {
        if(phonenumber1 != null) {
            pnumber = phonenumber1 + phonenumber2 + phonenumber3;
        }
        return pnumber;
    }
}
