<?
    $connect = mysql_connect("localhost","root","apmsetup"); // DB 연결
    mysql_select_db("gunhee_db", $connect);                // DB 선택
 
    if ($mode == "insert")                       	   // 데이터 입력 모드
    {   
        $sql = "insert into biz_card (name, company, tel, hp, address) values";
        $sql .= "('$name', $company, $tel, $hp, $address)";
 
        $result = mysql_query($sql, $connect);
    }
    else if ($mode == "modify")
  {
    $sql = "update biz_card set ";  
    $sql .= "name='$name', company='$company', tel='$tel', hp='$hp', address='$address',"; 
    $sql .= "where num='$num'";  
    $result = mysql_query($sql, $connect);
  }
?>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<h3>1) 명함 입력 하기</h3>

<form action="biz_card.php?mode=insert" method='post'>
<table width="850" border="1" cellpadding="5">
    <tr><td> 이름 : <input type="text" size="6" name="name">&nbsp;
             회사 : <input type="text" size="3" name="company">&nbsp;
             전화번호 : <input type="text" size="3" name="tel">&nbsp;
             휴대폰번호 : <input type="text" size="3" name="hp">&nbsp;
             주소 : <input type="text" size="3" name="address">
             
	</td>
       <td align="center">
	    <input type="submit" value="입력하기">	
       </td>
    </tr>
 </table>
 </form>
 
<p>
<h3>2) 명함 출력 하기</h3>  
<p><a href ="score_list.php?mode=big_first">[성적순 정렬]</a> 
   <a href ="score_list.php?mode=small_first">[성적역순 정렬]</a></p>
<p>
 <!-- 제목 표시 시작 -->
 <table width="720" border="1" cellpadding="5">
  <tr align="center" bgcolor="#eeeeee">
   <td>번호</td>
   <td>이름</td>
   <td>회사</td>
   <td>전화번호</td>
   <td>휴대폰번호</td>
   <td>주소</td>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
 </tr>
 <!-- 제목 표시 끝 -->
 
 <?
 // select 문 수행
    
    $sql = "select * from biz_card";
 
    $result = mysql_query($sql);
 
    $count = 1;                        // 화면 출력 시 일렬번호
 
 // DB 데이터 출력 시작
    while ($row = mysql_fetch_array($result))
    {   
      
       $num = $row[num];

       echo "<tr align='center'>
                <td> $count     </td>
       		<td> $row[name] </td>
       		<td> $row[company] </td>
       		<td> $row[tel] </td>
       		<td> $row[hp] </td>
       		<td> $row[address] </td>
       		<td> <a href='score_delete.php?num=$num'>[삭제]</a></td>
          <td> <a href='score_change.php?num=$num'>[수정]</a></td>
	      </tr>
             ";
     
       $count++;
     }
 // DB 데이터 출력 끝
 
     mysql_close();                   // DB 접속 끊기
 ?>
  
 </table>
