package com.tourist.www;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONArray;


@Mapper
public interface HomeMapper {
    Long createData(JSONArray body);
}
