package com.example.korail.repository;

import com.example.korail.dto.CardinfoDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CardinfoMapper {
    int getPayment(CardinfoDto cardinfoDto);
    int getPaymentUPdate(CardinfoDto cardinfoDto);
}
