package com.devkurly.board.service;

import com.devkurly.board.dao.BoardDao;
import com.devkurly.board.domain.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;

    @Override
    public List<BoardDto> selectReviewPage(Map map) throws Exception {
        return boardDao.selectReviewPage(map);
    }

    @Override
    public int remove(Integer bbs_id, Integer pdt_id, Integer user_id) throws Exception {
        return boardDao.delete(bbs_id, pdt_id, user_id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int modify(BoardDto boardDto) throws Exception {
        boardDao.update(boardDto);
        return boardDao.updateCn(boardDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(BoardDto boardDto) throws Exception {
        //1. 먼저 board_tb를 채운다.
        boardDao.insert(boardDto);
        //2. selectReviewPage를 한다.
        List<BoardDto> list = boardDao.selectAll();
        //3. 첫번째 글의 bbs_id를 수집한다.
        Integer bbs_id = list.get(0).getBbs_id();
        //4. bbs_id를 boardDto에 추가한다.
        boardDto.setBbs_id(bbs_id);
        //5. insertReview를 한다.
        boardDao.insertReview(bbs_id);
        //5. insertCn를 한다.
        return boardDao.insertCn(boardDto);
    }

    @Override
    public BoardDto readCn(Integer bbs_id) throws Exception {
        return boardDao.selectCn(bbs_id);
    }

    @Override
    public int getCount(String bbs_clsf_cd, Integer pdt_id) throws Exception {
        Map map = new HashMap();
        map.put("bbs_clsf_cd", bbs_clsf_cd);
        map.put("pdt_id", pdt_id);

        return boardDao.count(map);
    }
    @Override
    public int increaseLike(Integer bbs_id) throws Exception {
        return boardDao.increaseLike(bbs_id);
    }
}