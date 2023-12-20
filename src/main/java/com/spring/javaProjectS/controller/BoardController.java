package com.spring.javaProjectS.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaProjectS.pagination.PageProcess;
import com.spring.javaProjectS.pagination.PageVO;
import com.spring.javaProjectS.service.BoardService;
import com.spring.javaProjectS.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardListGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "board", "", "");
		
		List<BoardVO> vos = boardService.getBoardList(pageVO.getStartIndexNo(), pageSize);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/boardInput", method = RequestMethod.GET)
	public String boardInputGet() {
		return "board/boardInput";
	}
	
	@RequestMapping(value = "/boardInput", method = RequestMethod.POST)
	public String boardInputPost(BoardVO vo) {
		// content에 이미지가 저장되어 있다면, 저장된 이미지만 골라서 /resources/data/board/폴더에 저장시켜준다.
		if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgCheck(vo.getContent());
		
		// 이미지들의 모든 복사작업을 마치면, ckeditor폴더경로를 borad폴더 경로로 변경처리한다.('/data/ckeditor/' ==> 'data/board/')
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/board/"));
		
		// content안의 내용정리가 끝나면 변경된 vo를 DB에 저장시켜준다.
		int res = boardService.setBoardInput(vo);
		
		if(res == 1) return "redirect:/message/boardInputOk";
		else return "redirect:/message/boardInputNo";
	}
	
	@RequestMapping(value = "/boardContent", method = RequestMethod.GET)
	public String boardContentGet(int idx, Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize) {
		BoardVO vo = boardService.getBoardContent(idx);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		
		return "board/boardContent";
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDeleteGet(int idx,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize) {
		//게시글에 사진이 존재한다면 서버에 저장된 사진파일을 먼저 삭제시키낟.
		BoardVO vo = boardService.getBoardContent(idx);
		if(vo.getContent().indexOf("src=\"/")!=-1)boardService.imgDelete(vo.getContent());
		// 이전 처리가 끝나면. DB에 존재하는 게시글을 삭제처리.
		int res=boardService.setBoardDelete(idx);
		if(res!=1) {
			return "redirect:/message/boardDeletNo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize;
		}
		return "redirect:/message/boardDeletOk?idx="+idx+"&pag="+pag+"&pageSize="+pageSize;
		
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String boardUpdateGet(Model model, int idx,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize) {
		//수정화면으로 이동할 때 원본 파일의 그림파일이 있다면, 현재폴더의ㅜ 그림파일을 ckeditor폴더로 복사시킨다.
		BoardVO vo = boardService.getBoardContent(idx);
		if(vo.getContent().indexOf("src=\"/")!=-1)boardService.imgBackup(vo.getContent());
		
		model.addAttribute("vo", vo);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);		
		
		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdatePost(Model model, BoardVO vo,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize) {
		//수정된 자료가 원본자료와 완전히 동일하다면 수정할 필요가 없다. 즉, DB에 저장된 원본자료를 불러와서 현재 vo에 담긴 내용(content)과 비교해본다.
		BoardVO origVo = boardService.getBoardContent(vo.getIdx());
		
		//수정되었으면 그림파일의 처리유무 결정
		if(!origVo.getContent().equals(vo.getContent())) {
			//수정하기 버튼을 클릭하면 , 기존 board폴더의 그림파일을 모두 삭제시킨다
			if(origVo.getContent().indexOf("src=\"/")!=-1) boardService.imgDelete(vo.getContent());
			//board폴더를 ckeditor로 경로를 변경처리한다
			vo.setContent(vo.getContent().replace("/data/board/", "/data/ckeditor/"));
			
			//앞의 작업이 끝나면 파일을 처음 업로드할때와 똑같이 처리한다.
			//content 안에 이미지가 저장되어있다면, 저장된 이미지만 골라서  '/data/board/'폴더로 복사해서 저장시킨다. 
			boardService.imgCheck(vo.getContent());
			//복사가 끝나면 경로변경처리 (/data/ckeditor/ ==> /data/board/)
			vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/board/"));
		}
		//content 안의 내용과 그림파일까지 Update
		int res= boardService.setBoardUpdate(vo);
		
		model.addAttribute("idx", vo.getIdx());
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);		
		
		if(res==1) return "redirect:/message/boardUpdateOk";
		else return "redirect:/message/boardUpdateNo";
		
	}
}
