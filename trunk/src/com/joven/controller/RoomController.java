package com.joven.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joven.model.Desk;
import com.joven.model.MutiAdd;
import com.joven.model.Room;
import com.joven.model.RoomList;

@Controller
@RequestMapping("/room.do")
public class RoomController {
	
	/**
	 *  对比"params="method=input"时， method=RequestMethod.Get与method=RequestMethod.POST差别
	 * @return
	 */
	@RequestMapping(params="method=input",method=RequestMethod.GET)
	public String toInput(){
		return "input";
	}
	
	/**
	 * 基本类型传入
	 */
	@RequestMapping(params="method=addname")
	public String addroombyname(String name,String name2,HttpServletRequest request, HttpServletResponse response){
		System.out.println(name);
		System.out.println(name2);
		System.out.println(request.getParameter("name2"));
		System.out.println(request.getParameter("name3"));
		return "result";
	}
	
	/**
	 * 数组传入
	 */
	@RequestMapping(params="method=addnames")
	public String addroombynames(String[] name,HttpServletRequest request, HttpServletResponse response){
		for (String aname:name){
			System.out.println(aname);
		}
		return "result";
	}
	
	/**
	 * 对象简单属性传入
	 */
	@RequestMapping(params="method=add")
	public String addroom(Room room,ModelMap model, HttpServletRequest request, HttpServletResponse response){
		System.out.println(room.getName());
		return "result";
	}
	
	/**
	 * list类型传入
	 * 
	 */
	@RequestMapping(params="method=addlist")
	public String addroomlist(RoomList roomlist,ModelMap model){
		for (Room room:roomlist.getRoomlist()){
			System.out.println(room.getName());
		}
		return "result";
	}
	
	/**
	 * 两个对象传入
	 */
	@RequestMapping(params="method=mutiadd")
	public String mutiAdd(MutiAdd ma,ModelMap model, HttpServletRequest request, HttpServletResponse respons){
		System.out.println(ma.getRoom().getName());
		System.out.println(ma.getDesk().getName());
		return "result";
	}
	
	/**
	 * 主从表传入
	 */
	@RequestMapping(params="method=masterchild")
	public String addmasterchild(Room room,ModelMap model, HttpServletRequest request, HttpServletResponse respons){
		System.out.println(room.getName());
		for (Desk desk:room.getDesks()){
			System.out.println(desk.getName());
		}
		return "result";
	}
	
}
