<%--
  Created by IntelliJ IDEA.
  User: "Mr.KKu"
  Date: 2018-12-20
  Time: 오전 12:13
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="kr.or.ddit.attachment.model.AttachmentVo" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setCharacterEncoding("UTF-8");

    AttachmentVo attVo = (AttachmentVo)request.getAttribute("attVo");

    // 파일 업로드된 경로
    String root = request.getSession().getServletContext().getRealPath("/");
    String savePath = root + "upload-dir";

    // 서버에 실제 저장된 파일명

    /*String filename = attVo.getAtt_path().substring(attVo.getAtt_path().indexOf("/"),attVo.getAtt_path().length());*/
    String filename = attVo.getAtt_name();

    // 실제 내보낼 파일명
    String orgfilename = attVo.getAtt_name();

    InputStream in = null;
    OutputStream os = null;
    File file = null;
    boolean skip = false;
    String client = "";

    // 파일을 읽어 스트림에 담기
    try{
        // 파일을 읽어 스트림에 담기
        try{
//            in = new FileInputStream(file);
            in = new ByteArrayInputStream(attVo.getAtt_file());
        }catch(Exception fe){
            skip = true;
        }
        client = request.getHeader("User-Agent");

        // 파일 다운로드 헤더 지정
        response.reset() ;
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Description", "JSP Generated Data");


        if(!skip){


            // IE
            if(client.indexOf("MSIE") != -1){
                response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));

            }else{
                // 한글 파일명 처리
                orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");

                response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
                response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
            }

            response.setHeader ("Content-Length", ""+attVo.getAtt_file().length );



            os = response.getOutputStream();
//            byte b[] = new byte[(int)file.length()];
            byte b[] = new byte[attVo.getAtt_file().length];
            int leng = 0;

            while( (leng = in.read(b)) > 0 ){
                os.write(b,0,leng);
            }

        }else{
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");

        }

        in.close();
        os.close();

    }catch(Exception e){
        e.printStackTrace();
    }
%>
