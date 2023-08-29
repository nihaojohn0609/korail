package com.example.korail.service;

import com.example.korail.dto.CardinfoDto;
import com.example.korail.repository.CardinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CardinfoService {
    @Autowired
    CardinfoMapper cardinfoMapper;

    public int getPayment(CardinfoDto cardinfoDto){
        return cardinfoMapper.getPayment(cardinfoDto);
    }
    public int getPaymentUPdate(CardinfoDto cardinfoDto){
        return cardinfoMapper.getPaymentUPdate(cardinfoDto);
    }
}
