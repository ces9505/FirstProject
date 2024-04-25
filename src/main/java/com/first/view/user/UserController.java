package com.first.view.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.first.biz.user.UserVO;
import com.first.biz.user.impl.UserService;
import com.mysql.cj.xdevapi.JsonArray;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) {
		
		System.out.println("유저 등록처리");
		userService.insertUser(vo);
		
		return "main.jsp";
	}
	@RequestMapping("/login.do")
	public String getUser(UserVO vo,HttpSession session) {
		
		System.out.println("유저 로그인처리");
		session.setAttribute("user", userService.getUser(vo));
		
		return "main.jsp";
	}
	
	@RequestMapping("/getEnterUser.do")
	public void getEnterUser(UserVO vo,HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		System.out.println(vo.getUserid());
		System.out.println(vo.getUserpw());
		PrintWriter out = response.getWriter();
		String result = "not";
		System.out.println("ajax 통해 유저 통과 확인");
		UserVO resultVO = userService.getUser(vo);
		
		if(resultVO != null) {
			
			try {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            Date blockDate = dateFormat.parse(resultVO.getBlockdate());
	            Date today = new Date();
	            System.out.println(blockDate);
	            if(blockDate.after(today)) {
	            	result="차단된 회원입니다 고객센터에 문의해주세요";
	            }else {
	            	result="success";
	            }
	            
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
		System.out.println(result);
		
		out.write(result);
	}
	
	
	@RequestMapping("/getUserList.do")
	public void getUserList(UserVO vo,HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		System.out.println("유저 리스트 처리");
		
		System.out.println(vo.getLevel());
		PrintWriter out = response.getWriter();
		List<UserVO> list = userService.getUserList(vo);
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(list);
		System.out.println(jsonString); 
		out.write(jsonString);
		//System.out.println(list.get(0).getName());
		
		
		//model.addAttribute("userList", userService.getUserList(vo));
		
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo,HttpSession session) {
		System.out.println("유저 업데이트처리");
		
		session.setAttribute("user", userService.updateUser(vo));
		
		return "mypage.jsp";
	}
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo , HttpSession session) {
		
		System.out.println("유저 삭제처리");
		userService.deleteUser(vo);
		session.invalidate();
		return "main.jsp";
	}
	
	@RequestMapping("/plusBlock.do")
	public String updateUserBlock(UserVO vo,HttpSession session) {
		
		System.out.println("유저 블록처리");
		userService.updateUserBlock(vo);
		session.setAttribute("BlockUser", vo);
		return "redirect:adminpage.jsp";
	}
	@RequestMapping("/clearBlock.do")
	public String updateClearBlock(UserVO vo,HttpSession session) {
		System.out.println("유저 블록클리어");
		userService.updateClearBlock(vo);
		session.setAttribute("ClearUser",vo);
		
		return "redirect:adminpage.jsp";
	}
	
	
	@RequestMapping("/logout.do")
	public String logoutUser(HttpSession session) {
		
		session.invalidate();
		
		return "main.jsp";
	}
	
}
