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

</head>
<body>
	 <div class = "wrap">

        <form class="join_form" method="get" action="#">
            <table class= "login">
                <colgroup> 
                    <col width="30%" /> 
                    <col width="70%" /> 
                </colgroup>
                <tr>
                    <td>ID : </td>
                    <td><input type="text" placeholder="아이디를 입력해주세요."></td>
                </tr>
                <tr>
                    <td>PW : </td>
                    <td><input type="password" placeholder="비밀번호를 입력해주세요."></td>
                </tr>
                
                <tr>
                    <td>NAME : </td>
                    <td><input type="text" placeholder="이름을 입력해주세요."></td>
                </tr>

                <tr >
                    <td>PHONE : </td>
                    <td><input type="text" placeholder="전화번호를 입력해주세요."></td>
                </tr>
    
                <tr>
                    <td class="mt15">GENDER : </td>
                    <td class="gender mt15">
                        <input class="check" type="radio" name="gender" value="man">
                        <span>남</span>
                        <input class="check" type="radio" name="gender" value="woman">
                        <span>여</span>
                    </td>
                </tr>
                <tr>
                    <td>BLOODTYPE : </td>
                    <td class="bloodtype">
                            <input class="check" type="radio" name="bloodtype" value="A"> <span>A형</span>
                            <input class="check" type="radio" name="bloodtype" value="B"> <span>B형</span>
                            <input class="check" type="radio" name="bloodtype" value="O"> <span>O형</span>
                            <input class="check" type="radio" name="bloodtype" value="AB"> <span>AB형</span>
                    </td>
                </tr> 
                <tr >
                    <td  >HEIGHT : </td>
                    <td><input type="text" placeholder="키를 입력해주세요."></td>
                </tr>
                <tr >
                    <td  >WEIGHT : </td>
                    <td><input type="text" placeholder="몸무게를 입력해주세요."></td>
                </tr>
                <tr>
                    <td colspan="2">
                    <select class="nut_box" name="nutrients">
                        <option value="">관심 영양소</option>
                        <option value="">탄수화물</option>
                        <option value="">단백질</option>
                        <option value="">지방</option>
                        <option value="">당류</option>
                        <option value="">나트륨</option>
                        <option value="">콜레스테롤</option>
                        <option value="">포화지방산</option>
                        <option value="">트랜스지방</option>
                    </select>
                    </td>
                </tr>
        
                <!-- 제출 -->
                <tr >
                    <td colspan="2" class="pr00" align="center">
                        <input class="pl00" type="submit" value=" next > ">
                    </td>
                </tr>

            
            </table>
        </form>
        
    </div>
</body>
</html>