package com.joven.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/upload.do")
public class ServerFileController {
	
	//编辑器上传图片(没做权限控制)
	@RequestMapping(params="method=editorUpload")
	@ResponseBody
	public void editorUpload(ModelMap model,MultipartHttpServletRequest request,HttpServletResponse response) throws IOException{
		JSONObject json=new JSONObject();
		
		MultipartFile file=request.getFile("filedata");
		if (!file.isEmpty()) {
				//生成文件名
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
				String fileName="uploads/editorimgs/"+sdf.format(new Date())+file.getOriginalFilename().toString();
				fileName=fileName.replace(" ", "");
		        File source = new File(request.getSession().getServletContext().getRealPath("/")+fileName);
		        source.mkdirs();
		        //保存文件
		        try {
					file.transferTo(source);
				} catch (Exception e) {
					json.put("err","文件保存失败");
				}
				json.put("err","");
		        json.put("msg",fileName);
		   }
		
		response.getWriter().println(json.toString());
	}
}
