package com.myspring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {
 
    @RequestMapping(value="/multiplePhotoUpload", method=RequestMethod.POST)
    public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
    	
       try {
          // 파일 정보
          String sFileInfo = "";
          //파일명을 받는다 - 일반 원본파일명
          String filename = request.getHeader("file-name");
          //파일 확장자
          String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
          //확장자를 소문자로 변경
          filename_ext = filename_ext.toLowerCase();
          //파일 기본경로
          String filePath = request.getSession().getServletContext().getRealPath("/")+"\\resources\\upload\\vetImage\\";

          File file = new File(filePath);
          // 폴더 없으면 생성
          if(!file.exists()) {
             file.mkdirs();
          }
          String realFileNm = "";
          SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
          String today = formatter.format(new java.util.Date());
          realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
          String rlFileNm = filePath + realFileNm;
          // 서버에 파일쓰기 시작
          InputStream is = request.getInputStream();
          OutputStream os = new FileOutputStream(rlFileNm);
          int numRead;
          byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
          while((numRead = is.read(b,0,b.length)) != -1) {
             os.write(b,0,numRead);
          }
          if(is != null) {
             is.close();
          }
          // 서버에 파일쓰기 끝
          
          // 정보 출력
          sFileInfo += "&bNewLine=true";
          // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
          sFileInfo += "&sFileName=" + filename;
          sFileInfo += "&sFileURL="+"http://localhost:9090/pet/resources/upload/vetImage/"+realFileNm;
          PrintWriter print = response.getWriter();
          print.print(sFileInfo);
          print.flush();
          print.close();
       } catch(Exception e) {
          e.printStackTrace();
       }
    }      
}
