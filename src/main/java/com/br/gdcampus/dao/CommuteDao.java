package com.br.gdcampus.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CommuteDao {

    private final SqlSessionTemplate sqlSession;

    // 출근 기록 삽입
    public int insertCheckIn(String userNo,String userName) {
    	Map<String,String> params = new HashMap<>();
    	params.put("userNo", userNo);
    	params.put("userName", userName);
        return sqlSession.insert("holimapper.insertCheckIn", params);
    }

    // 퇴근 기록 업데이트
    public int updateCheckOut(String userNo) {
        return sqlSession.update("holimapper.updateCheckOut", userNo);
    }
}

