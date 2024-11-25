package com.br.gdcampus.service;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.CommuteDao;
import com.br.gdcampus.dto.CommuteDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommuteServiceImpl implements CommuteService {

    private final CommuteDao commuteDao;

    @Override
    public int insertCheckIn(String userNo, String userName) {
        return commuteDao.insertCheckIn(userNo,userName);
    }

    // 퇴근 기록 업데이트
    @Override
    public int updateCheckOut(String userNo) {
        return commuteDao.updateCheckOut(userNo);
    }

}

