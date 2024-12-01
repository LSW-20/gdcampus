package com.br.gdcampus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.br.gdcampus.dao.NoticeDao;
import com.br.gdcampus.dao.PostDao;
import com.br.gdcampus.dto.AttachDto;
import com.br.gdcampus.dto.CommentDto;
import com.br.gdcampus.dto.NoticeDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeDao noticeDao;
	private final PostDao postDao;
    // 공지사항 목록 조회
    @Override
    public List<NoticeDto> selectNoticeList() {
        return noticeDao.selectNoticeList();
    }

    // 공지사항 상단 고정 게시글 조회
    @Override
    public NoticeDto selectNotice(String no) {
        return noticeDao.selectNotice(no);
    }

    // 공지사항 등록
    @Transactional
    @Override
    public int insertNotice(NoticeDto n) {
        // 공지사항 등록
        int result = noticeDao.insertNotice(n);

        // 첨부파일 등록 처리
		List<AttachDto> list = n.getAttachList();
		if(result > 0 && !list.isEmpty()) {
			result = 0;
			for(AttachDto attach : list) {
				result += postDao.insertAttach(attach);
			}
		}

        return result;
    }

    // 공지사항 수정
    @Transactional
    @Override
    public int updateNotice(NoticeDto n) {
        return noticeDao.updateNotice(n);
    }

    // 공지사항 일괄 삭제
    @Transactional
    @Override
    public int deleteNotice(String[] deleteNo) {
        return noticeDao.deleteNotice(deleteNo);
    }

    // 공지사항 상세 조회
    @Override
    public NoticeDto selectNoticeDetail(String no) {
        return noticeDao.selectNoticeDetail(no);
    }

    // 공지사항 수정 시 첨부파일 처리
    @Transactional
    @Override
    public int updatePost(NoticeDto n, String[] delFileNo) {
        // 공지사항 테이블 업데이트
        int result1 = noticeDao.updateNotice(n);

        // 첨부파일 삭제
        int result2 = 1;
        if (result1 > 0 && delFileNo != null) {
            result2 = noticeDao.deleteAttach(delFileNo);
        }

        // 첨부파일 추가 등록
        List<AttachDto> attachList = n.getAttachList();
        int result3 = 0;
        if (attachList != null && !attachList.isEmpty()) {
            for (AttachDto attach : attachList) {
                attach.setPostNo(n.getNoticeNo());
                result3 += noticeDao.insertAttach(attach);
            }
        }

        // 성공 여부 판단
        return result1 == 1 && result2 > 0 && result3 == attachList.size() ? 1 : -1;
    }

    // 삭제할 첨부파일 조회
    @Override
    public List<AttachDto> selectDelAttach(String[] delFileNo) {
        return delFileNo == null ? new ArrayList<>() : noticeDao.selectDelAttach(delFileNo);
    }

    // 공지사항 댓글 조회
    @Override
    public List<CommentDto> selectCommentList(String no) {
        return noticeDao.selectCommentList(no);
    }
    
 // 게시판 상세 /조회수증가
	@Override
	public int noticeUpdateIncreaseCount(String noticeNo) {
		return noticeDao.noticeUpdateIncreaseCount(noticeNo);
	}

	@Override
	public List<AttachDto> selectAttachList(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteNotice(String no) {
		// TODO Auto-generated method stub
		return 0;
	}
}

