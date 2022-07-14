package com.tourist.www;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService{

    @Autowired(required = false)
    HomeMapper homeMapper;


    @Override
    public Long createData(JSONArray body) {
//        body.stream().map(row -> {
//
//        })


        return homeMapper.createData(body);
    }
}
