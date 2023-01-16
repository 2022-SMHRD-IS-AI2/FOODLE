<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/all_style.css">
    <link rel="stylesheet" href="css/member_style.css">
    
    
    <% 
    	// request.getSession();
    	
    	MemberVO client = (MemberVO)session.getAttribute("client");
    %>
</head>
<body>
	 <div class = "wrap">
	 <img src="img/back2.jpg">

        <form class="join_form" method="post" action="ChangeCon">
        
        <div id="box">
         <div class="box_bg">
         
            <table class= "login">
                <colgroup> 
                    <col width="30%" > 
                    <col width="70%" > 
                </colgroup>
                <tr>
                    <td>ID : </td>
                    <td><%=client.getMb_id() %>
                </tr>
                <tr>
                    <td>PW : </td>
                    <td><input type="password" placeholder="비밀번호를 입력해주세요." name="mb_pw" value ="<%=client.getMb_pw() %>"></td>
                </tr>
                
                <tr>
                    <td>NAME : </td>
                    <td><input type="text" placeholder="이름을 입력해주세요." name="mb_name" value="<%=client.getMb_name() %>"></td>
                </tr>

                <tr >
                    <td>PHONE : </td>
                    <td><input type="text" placeholder="전화번호를 입력해주세요." name="mb_phone" value="<%=client.getMb_phone() %>"></td>
                </tr>
    
                <tr>
                    <td class="mt15">GENDER : </td>
                    <td class="gender mt15">
                        <input class="check" type="radio" name="mb_gender" value="man" checked="checked">
                        <span>남</span>
                        <input class="check" type="radio" name="mb_gender" value="woman" <%if(client.getMb_gender().equals("woman")){ %>checked="checked"<% }%>>
                        <span>여</span>
                    </td>
                </tr>
                <tr>
                    <td>BLOODTYPE : </td>
                    <td class="bloodtype">
                            <input class="check" type="radio" name="mb_bloodtype" value="A" <%if(client.getMb_bloodtype().equals("A")){ %>checked="checked"<% }%>> <span>A형</span>
                            <input class="check" type="radio" name="mb_bloodtype" value="B" <%if(client.getMb_bloodtype().equals("B")){ %>checked="checked"<% }%>> <span>B형</span>
                            <input class="check" type="radio" name="mb_bloodtype" value="O" <%if(client.getMb_bloodtype().equals("O")){ %>checked="checked"<% }%>> <span>O형</span>
                            <input class="check" type="radio" name="mb_bloodtype" value="AB" <%if(client.getMb_bloodtype().equals("AB")){ %>checked="checked"<% }%>> <span>AB형</span>
                    </td>
                </tr> 
                <tr >
                    <td  >HEIGHT : </td>
                    <td><input type="text" placeholder="키를 입력해주세요." name="mb_height" value="<%=client.getMb_height() %>"></td>
                </tr>
                <tr >
                    <td  >WEIGHT : </td>
                    <td><input type="text" placeholder="몸무게를 입력해주세요." name="mb_weight" value="<%=client.getMb_weight() %>"></td>
                </tr>
                <tr>
                    <td colspan="2">
                    <select class="nut_box" name="fav_ingredient">
                        <option value="none">관심 영양소</option>
                        <option value="f_ch">탄수화물</option>
                        <option value="f_pro">단백질</option>
                        <option value="f_fat">지방</option>
                        <option value="f_sugar">당류</option>
                        <option value="f_sodium">나트륨</option>
                        <option value="f_col">콜레스테롤</option>
                        <option value="f_fad">포화지방산</option>
                        <option value="f_trans">트랜스지방</option>
                    </select>
                    </td>
                </tr>
        
                <!-- 제출 -->
                <tr >
                    <td colspan="2" class="pr00" align="center">
                        <input class="pl00" type="submit" value=" 수정 ">
                    </td>
                </tr>

             </table>
            </div>
          </div>
        </form>
        
    </div>
</body>
</html>