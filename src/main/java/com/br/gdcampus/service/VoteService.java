package com.br.gdcampus.service;

import java.util.List;
import java.util.Map;

import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.PageInfoDto;
import com.br.gdcampus.dto.VoteDto;

public interface VoteService {
	
	// 현재 게시글의 갯수가 몇개 인지 알아야하기떄문에 int형
	// 투표 게시글 목록 조회 (페이징 처리)
	int selectVoteListCount();
	List<VoteDto> selectVoteList(PageInfoDto pi);
	// 매개변수랑 반환형은 같아야 한다.

	
	/* 검색결과가 총 몇개인지 조회해서 반환해야함 
	 * 검색과 관련된 정보를 넘겨줘야함다. 
	 * 어떤조건으로 어떤정보관련으로 넘겨줄건지 정보가 필요함 
	 * 작성자/아이디/ 
	 * 검색기능은 mybatis에서 진행했었음*/
	
	// 투표 게시글 검색 조회 ( 페이지 처리)
    int selectSearchListCount(Map<String, String> search);
    List<VoteDto> selectSearchListCount(Map<String, String> search, PageInfoDto pi);
    
    /*
     * 투표 정보 모든걸 다 받아서 넘길 예쩡 
     * 인설트할 보트 객체가 담겨있는 정보를 모든걸 다 전달 받아서 보트 객체에 인설트 할거다
     * */
    // 투표 게시글 등록
    int insertVote(VoteDto v);
    
    /*
     * 내가 작성한 글이 아니면 조회수 증가 하게 만들거임
     *  몇번 게시글인지 넘겨 받을수 있고 그걸로 조회 가능 하고 
     *  처리된 행수 넘 겨 받을수있따. 
     * */
    // 투표 게시글 상세 - 조회수 증가
    int updateIncreaseCount(int voteId);
    
    /*
     * 한행 조회이고 보드객체를 받아올거당 
     */
    // 투표 게시글 상세 - 게시글 조회 
    VoteDto selectVote(int voteId);
    
    // 특정 투표 게시글 조회
    VoteDto selectVoteById(String voteId);

    /*
     * 게시글에 딸려있는 첨부파일 목록들도 한번에 다 삭제 할 예쩡
     * 삭제할 글 번호를 넘 겨 받아야 하기때문에 int형으로 반환해야함
     */
    // 투표 게시글 삭제
    int deleteVote(int voteId);

    /*
     * 수준을 올려서 수정한다고 하심
     */
    // 투표 게시글 수정
//    int updateVote(VoteDto vote);
    
    /*
     * 게시글 페이지에 댓글 목록 할 예정 
     * 댓글 객체가 여러개 담겨있는 list를 반환할거고 
     * 모든댓글을 조회하는게 아니라, 내가 조회한 게시글을 조회 받도록 할거임
     * 
     * 
     */
    // 댓글 목록 조회 
    List<CommentDto> selectCommentList(int postNo);
    
    // 댓글 등록
    int insertComment(CommentDto c);
    

 
}
