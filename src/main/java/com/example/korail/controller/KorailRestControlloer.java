package com.example.korail.controller;

import com.example.korail.dto.*;
import com.example.korail.service.*;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class KorailRestControlloer {
    @Autowired
    OrderService orderService;

    @Autowired
    MemberService memberService;

    @Autowired
    MailSendService mailSendService;

    @Autowired
    NoticeService noticeService;

    @Autowired
    PageService pageService;

    @Autowired
    BoardService boardService;

    @Autowired
    MileageService mileageService;

    @GetMapping("board_delete_proc_json/{bid}")
    public String board_delete_proc_json(@PathVariable String bid){
        System.out.println("컨트롤러는 와지나?");
        int result = boardService.delete(bid);
        System.out.println("result -->"+result);
        return String.valueOf(result);
    }
    @PostMapping("board_update_proc_json/{bid}")
    public String board_update_proc_json(@PathVariable String bid,BoardDto boardDto){
        int result = boardService.update(boardDto);
        return String.valueOf(result);
    }

    @GetMapping("board_update_json/{bid}")
    public BoardDto board_update_json(@PathVariable String bid){

        return boardService.boardupdate(bid);
    }
    @GetMapping("board_content_json/{bid}")
    public BoardDto board_content_json(@PathVariable String bid){

        return boardService.content(bid);
    }

    @PostMapping("board_write_proc")
    public String board_write_proc(BoardDto boardDto){
        int result=boardService.getRegistration(boardDto);
        return String.valueOf(result);
    }
    @GetMapping("board_list_json/{page}")
    public Map board_list_json(@PathVariable String page){
        Map map = new HashMap();
        PageDto pageDto = pageService.getPageResult(new PageDto(page,"board"));
        //System.out.println("pageDto" + pageDto);
        List<BoardDto> list = boardService.list(pageDto);
        map.put("list",list);
        map.put("page",pageDto);
        return map;
    }

    @GetMapping("mailCheck/{email}")
    public String mailCheck(@PathVariable String email){
        return mailSendService.mailCheck(email);
    }


    @GetMapping("train_reservation_satschc_json/{trnumber}")
    public String train_reservation_satschc_json(HttpSession session,@PathVariable String trnumber){
        ReservationDto rvo = (ReservationDto)session.getAttribute("rvo");
        rvo.setTrnumber(trnumber);

        ArrayList<SeatNumberDto> list =(ArrayList<SeatNumberDto>)orderService.getSeatnum(rvo);
        JsonArray seatList = new JsonArray();
        JsonObject slist = new JsonObject();

        for(SeatNumberDto seatDto : list){
            String chairNum = seatDto.getChairnum();
            String[] chairNumArray = chairNum.split(",");

            for(String chair : chairNumArray){
                String seatNum = chair.substring(4,6);
                JsonObject jobj = new JsonObject();
                jobj.addProperty("seat", seatNum);
                seatList.add(jobj);
            }
        }
        slist.add("seatList",seatList);

        return new Gson().toJson(slist);
    }

    @GetMapping("reservationlist_update_chair_json/{trnumber}")
    public String reservationlist_update_chair_json(HttpSession session, @PathVariable String trnumber){
        UpdateDto uvo = (UpdateDto)session.getAttribute("uvo");
        uvo.setTrnumber(trnumber);
        ArrayList<SeatNumberDto> list =(ArrayList<SeatNumberDto>)orderService.getSeatnumUp(uvo);
        JsonArray seatList = new JsonArray();
        JsonObject slist = new JsonObject();

        for(SeatNumberDto seatDto : list){
            String chairNum = seatDto.getChairnum();
            String[] chairNumArray = chairNum.split(",");

            for(String chair : chairNumArray){
                String seatNum = chair.substring(4,6);
                JsonObject jobj = new JsonObject();
                jobj.addProperty("seat", seatNum);
                seatList.add(jobj);
            }
        }
        slist.add("seatList",seatList);

        return new Gson().toJson(slist);
    }

    @GetMapping("id_check")
    public String id_check(String id){
        int result = memberService.getIdCheckResult(id);
        return String.valueOf(result);
    }

    @GetMapping("email_check")
    public String email_check(String email){
        int result = memberService.getEmailCheckResult(email);
        return String.valueOf(result);
    }


    @GetMapping("reservCancel_check/{reservnum}/{userId}")
    public String reservCancel_check(@PathVariable String reservnum, @PathVariable String userId){
        // 사용자 식별을 위한 변수를 List로 수령
        List<OrderDto> stationInfo = mileageService.getStation(userId, reservnum);
            if (mileageService.getStation(userId, reservnum).size() > 0) {
                // 마일리지 조회 내력에 등록할 문구 생성
                String specifics = "예매 취소  " + stationInfo.get(0).getSstation() + "↔" + stationInfo.get(0).getDstation() + " " + stationInfo.get(0).getStime();
                // 예상 누적 금액 삭제 및 마일리지 사용 db 수정
                mileageService.prepareUpdateProc(userId, reservnum);
                mileageService.updateProc(specifics, userId, reservnum);
            }

        return orderService.getCancelResult(reservnum);
    }

    @GetMapping("notice_list_json_data/{page}/")
    public Map notice_list_json_data(@PathVariable String page) {
        Map map = new HashMap();
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "notice"));
        List<NoticeDto> list = noticeService.list(pageDto);

        map.put("list", list);
        map.put("page", pageDto);

        return map;
    }

    @GetMapping("notice_content_json_data/{nid}/")
    public NoticeDto notice_content_json_data(@PathVariable String nid) {
        Map map = new HashMap();
        NoticeDto noticeDto = noticeService.content(nid);

        if(noticeService.content(nid) != null) {
            noticeService.updateHits(nid);
        }

        return noticeDto;
    }

    @GetMapping("notice_search_json_data/{category}/{cvalue}/{page}/")
    public Map notice_search_json_data(@PathVariable String category, @PathVariable String cvalue, @PathVariable String page) {

        Map map = new HashMap();
        PageDto pageDto = new PageDto(page, "notice", category, cvalue);
        pageDto = pageService.getPageResult(pageDto);
        ArrayList<NoticeDto> slist = noticeService.getSearch(pageDto);

        map.put("page", pageDto);
        map.put("slist", slist);

        return map;
    }

    @GetMapping("admin_reservationlist_json_data/{page}")
    public Map admin_reservationlist_json_data(@PathVariable String page){
        //System.out.println("page-->"+page);
        Map map = new HashMap();
        PageDto pageDto = pageService.getPageResult(new PageDto(page,"adminReserv"));
        List<OrderDto> list = orderService.list(pageDto);

        map.put("list", list);
        map.put("page", pageDto);

        return map;
    }
    /*@PostMapping("admin_reservationlist_search/{page}/{category}/{cvalue}/")
    public Map admin_reservationlist_search(@PathVariable String page, @PathVariable String category, @PathVariable String cvalue) {

        Map map = new HashMap();

        if(category.equals("total")){
            PageDto pageDto = pageService.getPageResult(new PageDto(page,"adminReserv"));
        }else {
            PageDto pageDto = pageService.getPageResult(new PageDto(page, "adminReserv", category, cvalue));
        }

        List<OrderDto> orderList = orderService.getOrderSearch(pageDto);

        map.put("list", orderList);
        map.put("page", pageDto);

        return map;
    }*/


}