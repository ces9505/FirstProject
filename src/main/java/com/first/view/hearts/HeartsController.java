package com.first.view.hearts;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.first.biz.hearts.HeartsVO;
import com.first.biz.hearts.impl.HeartsService;

@Controller
public class HeartsController {

	@Autowired
	public HeartsService heartsService;

	@RequestMapping("/insertHearts.do")
	public void insertHearts(HeartsVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HeartsVO invo = heartsService.getHearts(vo);
		if (invo == null) {
			heartsService.insertHearts(vo);

		} else {
			heartsService.deleteHearts(vo);

		}
		System.out.println("찜갯수//" + heartsService.getCountHearts(vo));
		out.write(heartsService.getCountHearts(vo));

	}

	@RequestMapping("/myHeartList.do")
	public void getMyHeartList(HeartsVO vo, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		ObjectMapper objectMapper = new ObjectMapper();
		List<HeartsVO> list = heartsService.getHeartList(vo);
		String jsonString = objectMapper.writeValueAsString(heartsService.getHeartList(vo));
		System.out.println("제이슨 하트리스트"+jsonString);
		out.write(jsonString);
	}

}
