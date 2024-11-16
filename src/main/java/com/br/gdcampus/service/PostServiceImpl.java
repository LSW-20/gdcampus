
  package com.br.gdcampus.service;
  
  import java.util.ArrayList; import java.util.List; import java.util.Map;
  
  import org.springframework.transaction.annotation.Transactional;
  
  import com.br.gdcampus.dto.AttachDto; import com.br.gdcampus.dto.PageInfoDto;
  import com.br.gdcampus.dto.PostDto;
  
  public class PostServiceImpl implements PostService {
  
  @Override public int selectPostListCount() { return
  postDao.selectPostListCount(); }
  
  @Override public List<PostDto> selectPostList(PageInfoDto pi) { return
  postDao.selectPostList(pi); }
  
  @Override public int selectSearchListCount(Map<String, String> search) {
  return postDao.selectSearchListCount(search); }
  
  @Override public List<PostDto> selectSerchList(Map<String, String> search,
  PageInfoDto pi) { return postDao.selectSearchList(search, pi); }
  
  
  @Transactional
  
  @Override public int insertBoard(BoardDto b) {
  
  int result = boardDao.insertBoard(b);
  
  List<AttachDto> list = b.getAttachList(); if(result > 0 && !list.isEmpty()) {
  result = 0; for(AttachDto attach : list) { result +=
  boardDao.insertAttach(attach); } }
  
  return result; }
  
  @Override public int updateIncreaseCount(int boardNo) { return
  boardDao.updateIncreaseCount(boardNo); }
  
  @Override public BoardDto selectBoard(int boardNo) { return
  boardDao.selectBoard(boardNo); }
  
  @Override public int deleteBoard(int boardNo) { return
  boardDao.deleteBoard(boardNo); }
  
  @Override public List<ReplyDto> selectReplyList(int boardNo) { return
  boardDao.selectReplyList(boardNo); }
  
  @Override public int insertReply(ReplyDto r) { return
  boardDao.insertReply(r); }
  
  @Override public List<AttachDto> selectDelAttach(String[] delFileNo) { return
  delFileNo == null ? new ArrayList<>() : boardDao.selectDelAttach(delFileNo);
  }
  
  @Transactional
  
  @Override public int updateBoard(BoardDto b, String[] delFileNo) {
  
  // 1) board테이블에 update int result1 = boardDao.updateBoard(b);
  
  // 2) attachment테이블에 delete int result2 = 1; if(result1 > 0 && delFileNo !=
  null) { result2 = boardDao.deleteAttach(delFileNo); }
  
  // 3) attachment테이블에 insert List<AttachDto> list = b.getAttachList(); int
  result3 = 0; for(AttachDto at : list) { result3 += boardDao.insertAttach(at);
  }
  
  
  // 성공에 대한 조건 // result1이 1이여야됨 // result2가 0보다 커야됨 // result3가 list의 사이즈와 동일
  
  return result1 == 1 && result2 > 0 && result3 == list.size() ? 1 : -1;
  
  
  }
  
  @Override public int deleteReplyCompletely() { return
  boardDao.deleteReplyCompletely(); }
  
  @Override public int insertPost(PostDto p) { // TODO Auto-generated method
  stub return 0; }
  
  @Override public PostDto selectPost(int postNo) { // TODO Auto-generated
  method stub return null; }
  
  @Override public int deletePost(int postNo) { // TODO Auto-generated method
  stub return 0; }
  
  }
 