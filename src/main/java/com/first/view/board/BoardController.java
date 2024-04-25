package com.first.view.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.first.biz.board.BoardVO;
import com.first.biz.board.impl.BoardService;

@Controller
public class BoardController {

	@Autowired
	public BoardService boardService;

	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IOException {
		System.out.println("insertBoard 호출 확인");
		List<MultipartFile> files = vo.getFiles();
		System.out.println("파일스 0번째 가죠오기:" + files.get(0).toString());
		System.out.println("Files: " + files);

		String fileList = "";

		if (vo.getPrice().length() <= 0) {
			vo.setPrice("가격 협의");
		}

		if (files.get(0).getOriginalFilename().length() > 0) {

			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = files.get(i);
				String fileName = file.getOriginalFilename();
				String newFileName = (int) (Math.random() * 1000000) + System.currentTimeMillis() + fileName;

				FileCopyUtils.copy(file.getBytes(), new File(
						"C:\\study\\spring\\FirstProject\\src\\main\\webapp\\resources\\productIMG\\" + newFileName));

				file.transferTo(new File(
						"C:\\study\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FirstProject\\resources\\productIMG"
								+ newFileName));
				/*
				 * file.transferTo(new File(
				 * "C:\\study\\spring\\FirstProject\\src\\main\\webapp\\resources\\productIMG\\"
				 * + newFileName));
				 */
				fileList += newFileName;
				if (i < files.size() - 1) {
					fileList += ",";
				}
			}
		}
		System.out.println(fileList);
		if (files.get(0).getOriginalFilename().length() > 0) {
			System.out.println("asdfasdf");
			vo.setImg(fileList);
		}
		boardService.insertBoard(vo);

		return "redirect:main.jsp";
	}

	@RequestMapping("/getCommonList.do")
	public String getCommonList(BoardVO vo, HttpSession session) {

		session.setAttribute("commonList", boardService.getCommonList(vo));

		return "commonList.jsp";
	}

	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, HttpSession session) {
		vo = boardService.getBoard(vo);

		session.setAttribute("board", vo);
		System.out.println("타임" + vo.getTime());
		System.out.println("넘버확인" + vo.getNumber());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(vo.getTime());
		session.setAttribute("time", formattedDate);

		return "getBoard.jsp";

	}

	@RequestMapping("/getPlaceList.do")
	public String getPlaceList(BoardVO vo, HttpSession session) {
		System.out.println(vo.getPlace() +"/플레이스검색");
		session.setAttribute("commonList", boardService.getPlaceList(vo));

		return "commonList.jsp";
	}
	
	@RequestMapping("/setBoardHeart.do")
	public void setBoardHeart(BoardVO vo,HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		boardService.setBoardHeart(vo);
		out.write("성공");
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo)
	{
		
		boardService.deleteBoard(vo);
		
		return "redirect:getCommonList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo) {
		
		boardService.updateBoard(vo);
		
		
		return"redirect:getCommonList.do";
	}
	@RequestMapping("/renting.do")
	public String renting(BoardVO vo) {
		
		if(vo.isRenting() == true) {
			vo.setRenting(false);
		}else
		{
			vo.setRenting(true);
		}
		boardService.renting(vo);
		
		return "redirect:getBoard.do?number=" + vo.getNumber();
	}
	
}
