package com.spring.javaProjectS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS.vo.BoardVO;

@Service
public interface BoardService {

	public List<BoardVO> getBoardList();

	public int setboardInput(BoardVO vo);

	public BoardVO getBoardContent(int idx);

}
