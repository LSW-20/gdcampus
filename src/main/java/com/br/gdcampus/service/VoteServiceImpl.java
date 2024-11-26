
package com.br.gdcampus.service;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dto.VoteDto;

@Service
public interface VoteServiceImpl {

    // 투표 게시글 목록 조회 (페이징 및 조건 검색)
    List<VoteDto> selectVoteList(Map<String, Object> paramMap);

    // 특정 투표 게시글 조회
    VoteDto selectVoteById(String voteId);

    // 투표 게시글 등록
    int insertVote(VoteDto vote);

    // 투표 게시글 수정
    int updateVote(VoteDto vote);

    // 투표 게시글 삭제
    int deleteVote(String voteId);

    // 투표 게시글 총 개수 조회 (페이징 처리용)
    int countVoteList(Map<String, Object> paramMap);
}
