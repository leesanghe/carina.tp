package com.future.my.free.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.future.my.free.vo.FreeBoardVO;
import com.future.my.free.service.FreeBoardService;

@Controller
public class FreeBoardController {
	
	@Autowired
	FreeBoardService freeBoardService;
	
	@RequestMapping("/freeList")
	public String freeBoardList(Model model
			) {
		List<FreeBoardVO> freeBoardList = 
				freeBoardService.getBoardList();
		model.addAttribute("freeList", freeBoardList);
		return "free/freeList";
	}

}
