package com.example.korail.service;

import com.example.korail.dto.*;
import com.example.korail.repository.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    OrderMapper orderMapper;

    public int getCardnum(String cardnum, String email){
        return orderMapper.selectcard(cardnum,email);
    }
    public ArrayList<OrderDto> getSelect(OrderDto orderDto){
        return orderMapper.select(orderDto);
    }
    public int getPayment(OrderDto orderDto){
        return orderMapper.payment(orderDto);
    }
    public ArrayList<SeatNumberDto> getSeatnum(ReservationDto rvo){
        System.out.println("setTrnumber service -->"+rvo.getTrnumber());
        List<SeatNumberDto> list = orderMapper.seatnum(rvo);

        return (ArrayList<SeatNumberDto>)list;
    }
    public String getCancelResult(String reservnum) {
        int result = orderMapper.cancel(reservnum);
        return String.valueOf(result);
    }

    public OrderDto getSelected(String reservnum){
        return orderMapper.selected(reservnum);
    }

    public ArrayList<SeatNumberDto> getSeatnumUp(UpdateDto uvo){
        List<SeatNumberDto> list = orderMapper.seatnumUp(uvo);

        return (ArrayList<SeatNumberDto>)list;
    }

    public int getPaymentUpdate(OrderDto orderDto){
        return orderMapper.updatePayment(orderDto);
    }

    public List<OrderDto> list(PageDto pageDto) {
        return orderMapper.list(pageDto);
    }

    public List<OrderDto> getOrderSearch(PageDto pageDto){
        return orderMapper.search(pageDto);
    }

}
