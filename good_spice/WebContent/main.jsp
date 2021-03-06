<%@page import="com.model.AnswerDAO"%>
<%@page import="com.model.AnswerVO"%>
<%@page import="com.model.QuesVO"%>
<%@page import="com.model.QuesDAO"%>
<%@page import="com.model.PostVO"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.model.PostDAO"%>
<%@page import="com.model.ProductVO"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Best Moment</title>
<meta charset="EUC-kr" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="stylesheet" href="assets/css/main.css" />
<noscript>
   <link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>

<body class="is-preload">
   <!-- ???? -->
   <%   
   MemberVO vo = (MemberVO) session.getAttribute("member");
   MemberDAO dao = new MemberDAO();
   ArrayList<MemberVO> al = dao.selectAll();
   
   //<!-- ??ǰ -->
   ProductDAO Pdao = new ProductDAO();
   ArrayList<ProductVO> Pal =new ArrayList<ProductVO>();
   boolean ch = true;
   if(vo!=null){
      Pal = Pdao.selectAll(vo.getid());
   }
   
   /* ?Խñ? */
   PostDAO Postdao = new PostDAO();
   ArrayList<PostVO> Postal = Postdao.PostList();
   
   
   /* ???? */
   QuesDAO Qdao = new QuesDAO();
   ArrayList<QuesVO> Qal = Qdao.QuesList();
   
   /* ???? */
   AnswerDAO Adao = new AnswerDAO();
   ArrayList<AnswerVO> Aal = Adao.AnswerList();
   %>
   <!-- Wrapper -->

   <div id="wrapper">

      <!-- Header -->
      <!-- Header -->
      <header id="header">
         <div class="logo">
            <span class="icon fa-gem"></span>
            <nav></nav>
         </div>
         <div class="content">
            <div class="inner">
               <h1>Smart Spice</h1>
               <p>May your life be happy with this Spice</p>
               <%if (vo != null) {%>
               <%String GetId = vo.getid();%>
                  <% if (GetId.equals("admin")) {%>
                     <h2>?????ڴ? ȯ???մϴ?</h2>
                  <%} else {%>
                  <h2><%=vo.getid() %>?? ȯ???մϴ?</h2>
                  <%} %>
               <%} %>
            </div>
         </div>
         <nav>
            <ul class>
               <li><a href="#intro">Intro</a></li>

               <li><select onchange="if(this.value) location.href=(this.value);" id="select" onclick="menu()">

                     <option disabled selected>Recipe</option>
                     <option value="#KOREA">?ѽ?</option>
                     <option value="#CHINA">?߽?</option>
                     <option value="#USA">????</option>
                     <option value="#JAPAN">?Ͻ?</option>
               </select></li>

               <script>
                  function menu(){
                     $("#select").val("Recipe");                     
                  }
                  </script>
               <li><a href="#POST">Post</a></li>
               <li><a href="#QNA">Q&A</a></li>

               <%if (vo == null) {%>
               <li><a href="#Login">Login</a></li>
               <li><a href="#Join">Join</a></li>
               <%} else {%>
               
               <%String GetIdd = vo.getid();%>
            
                  <%if (GetIdd.equals("admin")) {%>
                  
                  <li><select
                     onchange="if(this.value) location.href=(this.value);"
                     id="Adminpage" onclick="admin()">
                        <option disabled selected>Admin</option>
                        <option value="#recipepost">??????</option>
                        <option value="#MemberInfo">ȸ??????</option>
                  </select></li>
   
                  <script>
                           function admin(){
                              $("#Adminpage").val("Admin");               
                                    }
                           </script>
   
                  <li><a href="LogoutService">Logout</a></li>
               
                  <%} else {%>
                  
                  <li><select
                     onchange="if(this.value) location.href=(this.value);"
                     id="selMypage" onclick="info()">
                        <option disabled selected>Mypage</option>
                        <option value="#ChangeInfo">????????</option>
                        <option value="#Product">????????</option>
                  </select></li>
   
                  <script>
                     function info() {
                        $("#selMypage").val("Mypage");
                     }
                  </script>
   
                  <li><a href="LogoutService">Logout</a></li>
                  
                  <%}%>
            <%}%>

            </ul>
         </nav>

      </header>
      <!-- header ?? -->

      <!-- Main -->
      <div id="main">

         <!-- Intro ??ǰ?Ұ? -->
         <article id="intro">
            <h2 class="major">??ǰ?Ұ?</h2>

            <span class="image main"> 
               <img src = "images/goodspice.jpg">
            </span>
            <P>???? "????Ʈ ??????"?? ?丮?? ???? ???ְ? ?????? ???? ?????? ??ǰ?Դϴ?. 
            <br>?丮?? ???? ?????? ?? ???ߴ????? ???? ?????ϰ?, ???? ?Ϻ??ϰ? ?? ?? ?ֵ???
            <br>???? ???? ?? ???Դϴ?.</P>
            <p>?????? ??Ź?? ?ູ?? ?????ϱ⸦ ?ٶ??ϴ?.</p>
            <p align = "center">
               ????ó : <a href="https://www.smhrd.or.kr/">????Ʈ???簳?߿?</a>
            </p>

         </article>

         <!-- Recipe ?ѽ? -->
         <article id="KOREA">
            <h2 class="major">?ѽ?</h2>

            <div style="text-align: right;">
               <a href="#CHINA">?߽?&ensp;</a>
               <a href="#USA">????&ensp;</a>
               <a href="#JAPAN">?Ͻ?</a>
            </div>
            <span class="image main"> ??ġ? <a href="#kimchi"><img src="images/KOREA.jfif"></a></span> 
            <span class="image main"> ????? <a href="#beensoup"><img src="images/been.jpg"></a></span> 
            <span class="image main"> ??ġ?????? <a href="#kimbok"><img src="images/bokk.jpg"></a></span>
         </article>

         <!-- Recipe ?߽? -->
         <article id="CHINA">
            <h2 class="major">?߽?</h2>

            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#USA">????&ensp;</a> 
               <a href="#JAPAN">?Ͻ?</a>
            </div>
            <span class="image main"> ¥???? <a href=#jja><img src="images/CHINA.jfif"></a></span> 
            <span class="image main"> «?? <a href=#bbong><img src="images/jjam.jfif"></a></span> 
            <span class="image main"> ?????? <a href=#tangsu><img src="images/tang.jfif"></a></span>
         </article>

         <!-- Recipe ???? -->
         <article id="USA">
            <h2 class="major">????</h2>

            <div style="text-align: right;">
               <a href="#CHINA">?߽?&ensp;</a> <a href="#KOREA">?ѽ?&ensp;</a> <a
                  href="#JAPAN">?Ͻ?</a>
            </div>
            <span class="image main"> ??????ũ <a href=#steak><img
                  src="images/USA.jfif"></a>
            </span> <span class="image main"> ??ī?δϾ?ġ?? <a href=#cheese><img
                  src="images/mac.jpg"></a>
            </span> <span class="image main"> ???İ?Ƽ <a href=#pasta><img
                  src="images/spaghetti.jfif"></a>
            </span>
         </article>

         <!-- Recipe ?Ͻ? -->
         <article id="JAPAN">
            <h2 class="major">?Ͻ?</h2>

            <div style="text-align: right;">
               <a href="#CHINA">?߽?&ensp;</a> <a href="#USA">????&ensp;</a> <a
                  href="#KOREA">?ѽ?</a>
            </div>
             <span class="image main"> ?쵿 <a href=#udon><img
                  src="images/udon.png"></a></span> 
            <span class="image main"> ?ʹ? <a href=#sushi><img
                  src="images/JAPAN.jfif"></a></span>
            <span class="image main"> ???ڳ??̾߳? <a href=#oko><img
                  src="images/oko.jpg"></a>
            </span>
         </article>

         <!-- ?ѽ? ?????? ?????? -->
         <article id="kimchi" class = "user">
				<form>
					<a href="#KOREA"><h2 class="major">?ѽ?</h2></a>
					<div style="text-align: right;">
						<a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> 
						<a href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
					</div>

					<h3>??ġ?</h3>
					<span class="image main"> <a><img src="images/KOREA.jfif"></a></span>
					<div>
						<ul>
							<li>?ұ? 10g</li>
							<li>???? 25g</li>
							<li>???? 5g</li>
						</ul>
					</div>

					<div style="text-align: center;">
               <%if(vo!=null){ %>
                  <a href="OutputSpice?REC_NUM=1&id=<%=vo.getid() %>"><button>????</button></a>
               <%} %>
               </div>

				</form>

			</article>

         <article id=beensoup>
            <h2 class="major">
               <a href=#KOREA>?ѽ?</a>
            </h2>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> 
               <a href="#CHINA">?߽?&ensp;</a> 
               <a href="#USA">????&ensp;</a> 
               <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h3>?????</h3>
            <span class="image main"> <a><img src="images/been.jpg"></a>
            </span>
            <div>
               <ul>
                  <li>?ұ? 10g</li>
                  <li>???? 10g</li>
                  <li>???? 10g</li>
               </ul>
            </div>
            <div style="text-align: center;">
                  <a href="OutputSpice?REC_NUM=<%=2%>"><button  onclick = "alert('???? ????')">????</button></a>
            </div>
         </article>

         <article id=kimbok>
            <a href=#KOREA><h2 class="major">?ѽ?</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>??ġ??????
            </h3>
            <span class="image main"> <a><img src="images/bokk.jpg"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <!-- ?߽? ?????? ?????? -->
         <article id=jja>
            <a href=#CHINA><h2 class="major">?߽?</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>¥????
            </h3>
            <span class="image main"> <a><img src="images/CHINA.jfif"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <article id=bbong>
            <a href=#CHINA><h2 class="major">?߽?</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>«??
            </h3>
            <span class="image main"> <a><img src="images/jjam.jfif"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <article id=tangsu>
            <a href=#CHINA><h2 class="major">?߽?</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h3>??????</h3>
            <span class="image main"> <a><img src="images/tang.jfif"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <!-- ???? ?????? ?????? -->
         <article id=steak>
            <a href=#USA><h2 class="major">????</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>??????ũ
            </h3>
            <span class="image main"> <a><img src="images/USA.jfif"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <article id=cheese>
            <a href=#USA><h2 class="major">????</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>??ī?δϾ?ġ??
            </h3>
            <span class="image main"> <a><img src="images/mac.jpg"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <article id=pasta>
            <a href=#USA><h2 class="major">????</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>???İ?Ƽ
            </h3>
            <span class="image main"> <a><img
                  src="images/spaghetti.jfif"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <!-- ?Ͻ? ?????? ?????? -->
         <article id=sushi>
            <a href=#JAPAN><h2 class="major">?Ͻ?</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>?ʹ?</h>
            <span class="image main"> <a><img src="images/JAPAN.jfif"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <article id=udon>
            <a href=#JAPAN><h2 class="major">?Ͻ?</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>?쵿
            </h3>
            <span class="image main"> <a><img src="images/udon.png"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <article id=oko>
            <a href=#JAPAN><h2 class="major">?Ͻ?</h2></a>
            <div style="text-align: right;">
               <a href="#KOREA">?ѽ?&ensp;</a> <a href="#CHINA">?߽?&ensp;</a> <a
                  href="#USA">????&ensp;</a> <a href="#JAPAN">?Ͻ?</a>
            </div>
            <h>???ڳ??̾߳?
            </h3>
            <span class="image main"> <a><img src="images/oko.jpg"></a>
            </span>
            <div>
               <ul>
                  <li>?غ????Դϴ?.</li>
               </ul>
            </div>
            <div>
               <p align="center">
                  <input type="button" href="#" value="????">
               </p>
            </div>
         </article>

         <!-- Board ?Խ??? -->
         <article id="POST">
            <h1 class="major">?Խ???</h1>
               <form>
                     <table>
                        <tr>
                           <td style="text-align: center; width:10%">??ȣ</td>
                           <td style="text-align: center; width:55%">????</td>
                           <td style="text-align: center; width:20%">?ۼ???</td>
                           <td style="text-align: center; width:15%">?ۼ???</td>

                        </tr>
                     <%for(int i = 0; i<Postal.size();i++){ %>
                        <tr>
                           <td><%=Postal.get(i).getPost_num()%></td>
                           <td><a href = "main.jsp#post_one?post_num=<%=Postal.get(i).getPost_num()%>"><%=Postal.get(i).getPost_name() %></a></td>
                           <td><%=Postal.get(i).getPost_date() %></td>
                           <td><%=Postal.get(i).getMem_id() %></td>
                        </tr>
                     <%} %>
                  </table>
               <!-- ?۾??? ??ư ???? -->
                  <div style="text-align: right;"><button onclick="location.href='main.jsp#post_up'">?۾???</button></div>
               </form>
         </article>
         
         <!-- ?Խ??? ?ۼ? ?????? -->
         <article id= "post_up">
         <h1 class="major">?Խ???</h1>
               <form method="post" action="writeAction.jsp">
                  <table>
                        <tr>
                           <td><input type="text" class="form-control" placeholder="?? ????" name="post_name" maxlength="50" required="required"></td>
                        </tr>
                        <tr>
                           <td><textarea class="form-control" placeholder="?? ????" name="post_cont" maxlength="2048" style="height: 350px;" required="required"></textarea></td>
                        </tr>
                  </table>
                  <!-- ?۾??? ??ư ???? -->
                  <div style="text-align: right;"><input type="submit" class="btn btn-primary pull-right" value="????"></div>
               </form>
         </article>
   

      <!-- ?ۼ??Ȱ? ?????ִ? ?????? -->
         <article id="post_one">
            <h1 class="major">?Խ???</h1>
 
                  <table>
                        <tr>
                           <td style="width: 20%;">?? ????</td>
                           <td colspan="2"><%=Postal.get(0).getPost_name()%></td>
                        </tr>
                        <tr>
                           <td>?ۼ???</td>
                           <td colspan="2"><%=Postal.get(0).getMem_id()%></td>
                        </tr>
                        <tr>
                           <td>?ۼ?????</td>
                           <td colspan="2"><%=Postal.get(0).getPost_date()%></td>
                        </tr>
                        <tr>
                           <td>????</td>
                           <td colspan="2" style="height: 200px; text-align: left;"><%=Postal.get(0).getPost_cont()%></td>
                        </tr>
                  </table>
                  <div style="text-align: right;"><button onclick="location.href='main.jsp#POST'">????</button></div>
               
         </article> 

         <!-- Q&A -->
         <article id="QNA">
            <h1 class="major">Q&A</h1>
                  <form>
                     <table>
                        <tr>
                           <td  style="text-align: center; width : 15%">??ȣ</td>
                           <td  style="text-align: center; width : 50%">????</td>
                           <td  style="text-align: center; width : 20%">?ۼ???</td>
                           <td  style="text-align: center; width : 15%">?ۼ???</td>
                        </tr>
                  
                     <%for(int i = 0; i<Qal.size();i++){ %>
                        <tr>
                           <td><%=Qal.get(i).getQues_num()%></td>
                           <td><a href = "main.jsp#ques_one"><%=Qal.get(i).getQues_name() %></a></td>
                           <td><%=Qal.get(i).getQues_date() %></td>
                           <td><%=Qal.get(i).getMem_id() %></td>

                        </tr>
                     <%} %>

                     </table>
            
               <!-- ???????? ??ư ???? -->
                  <div style="text-align: right;"><button onclick="location.href='main.jsp#ques_up'">?۾???</button></div>
                  </form>
         </article>
         
         
         
         <!-- ???? ?ۼ? ?????? -->
         <article id= "ques_up">
         <h1 class="major">Q&A</h1>
               <form method="post" action="quesWriteAction.jsp">
                  <table>
                        <tr>
                           <td><input type="text" class="form-control" placeholder="???? ????" name="ques_name" maxlength="50" required="required"></td>
                        </tr>
                        <tr>
                           <td><textarea class="form-control" placeholder="???? ????" name="ques_cont" maxlength="2048" style="height: 350px;" required="required"></textarea></td>
                        </tr>
                  </table>
                  <!-- ?۾??? ??ư ???? -->
                  <div style="text-align: right;"><input type="submit" class="btn btn-primary pull-right" value="????"></div>
               </form>
         </article>
   

         <!-- ???? ?ۼ??Ȱ? ?????ִ? ?????? -->
         <article id="ques_one">
            <h1 class="major">Q&A</h1>
                  <table>
                        <tr>
                           <td style="width: 20%;">???? ????</td>
                           <td colspan="2"><%=Qal.get(1).getQues_name()%></td>
                        </tr>
                        <tr>
                           <td>?ۼ???</td>
                           <td colspan="2"><%=Qal.get(1).getMem_id()%></td>
                        </tr>
                        <tr>
                           <td>?ۼ?????</td>
                           <td colspan="2"><%=Qal.get(1).getQues_date()%></td>
                        </tr>
                        <tr>
                           <td>????</td>
                           <td colspan="2" style="height: 200px; text-align: left;"><%=Qal.get(0).getQues_cont()%></td>
                        </tr>
                  </table>
                  <div style="text-align: right;"><button onclick="location.href='main.jsp#QNA'">????</button></div>
                  <br>
         
         <!-- ???ۺ??°? -->
            <table>
                     <tr>
                        <td style="text-align: center; width : 15%" >??ȣ</td>
                        <td style="text-align: center; width : 50%">????</td>
                        <td style="text-align: center; width : 20%">?ۼ???</td>
                        <td style="text-align: center; width : 15%">?ۼ???</td>
                     </tr>
                     <%for(int i = 0; i<Aal.size();i++){ %>
                     	
                        <tr>
                           <td style="text-align: center;"><%=Aal.get(i).getAns_num()%></td>
                           <td><%=Aal.get(i).getAns_cont()%></td>
                           <td style="text-align: center;"><%=Aal.get(i).getAns_date() %></td>
                           <td style="text-align: center;"><%=Aal.get(i).getAns_name() %></td>
                        </tr>
                     <%} %>
                  </table>
            <!--???? ???? ĭ -->
            <form method="post" action="ansWriteAction.jsp">
                  <table>
                        <tr>
                           <td><textarea class="form-control" placeholder="???? ?ۼ?" name="ans_cont" maxlength="100" style="height: 50px; resize: none; overflow-y:hidden;;" required="required"></textarea></td>
                        </tr>
                  </table>
                  <!-- ?۾??? ??ư ???? -->
                  <div style="text-align: right;"><input type="submit" value="????"></div>
               </form>
            <!-- ???۳? -->
            
         </article>
         
         

         <!-- ???????? ???? -->
         <article id="ChangeInfo">
            <h2 class="major">???????? ????</h2>
            <form action="UpdateService" method="post">
               <h3>????ID</h3>
               <input name="id" type="text" placeholder="ID?? ?Է??ϼ???" required="required"> <br>
               <h3>PW</h3>
               <input name="pw" type="password" placeholder="?????? PW?? ?Է??ϼ???"> <br>
               <h3>NICK</h3>
               <input name="nick" type="text" placeholder="?????? NICK?? ?Է??ϼ???"> <br> <input type="submit"
                  value="Change" class="button fit">
            </form>
            </span>
         </article>

         <!-- Login ?α??? -->
         <article id="Login">
            <h2 class="major">Login</h2>

            <form action="LoginService" method="post">
               <h3>ID</h3>
               <input name="id" type="text" placeholder="ID?? ?Է??ϼ???" required="required"> <br>
               <h3>PW</h3>
               <input name="pw" type="password" placeholder="PW?? ?Է??ϼ???" required="required"> <br>
               <div style="text-align: center;">
                  <input type="submit" value="LogIn">
               </div>
            </form>
         </article>

         <!-- Join ȸ?????? -->
         <article id="Join">
            <h2 class="major">Join</h2>

            <form action="JoinService" method="post">
               <input name="id" id="input_id" type="text" placeholder="ID?? ?Է??ϼ???" required="required">
               <br> 
               <div style="text-align: center;">
               <input type="button" value="Id?ߺ?üũ" onclick="idcheck()"> 
               </div>
               <br> 
               <input name="pw" type="password" placeholder="PW?? ?Է??ϼ???" required="required"> 
               <br> 
               <input name="nick" type="text" placeholder="NICK?? ?Է??ϼ???" required="required">
               <br>
               <div style="text-align: center;">
                  <input type="submit" value="JoinUs">
               </div>
            </form>
         </article>

         <!-- ???????? -->
         <article id="Product">
            <h2 class="major">????????</h2>
            <form action="ProductService" method="post">
               <input name="product" id="input_product" type="text" placeholder="??ǰ??ȣ?? ?Է??ϼ???" required="required">
               <br>

               <div style="text-align: center;">
               <input type="button" value="??ǰ??ȣ?ߺ?üũ" onclick="prodcheck()"> 
               </div>
               <br> 
               <br> <select name="spice">
                  <option value="">?????? ?????ϼ???.</option>
                  <option value="?ұ?">?ұ?</option>
                  <option value="????">????</option>
                  <option value="????">????</option>
               </select> <br>
               <div style="text-align: center;">
               <input type="submit" value="????" onclick="alert('??ǰ ?????? ?Ϸ? ?ƽ??ϴ?.')"> <br>
               </div>
            </form>
            <br> <br>
            
            <form class = "user">
					<table>
						<tr align = "center">
							<td>??ǰ??ȣ</td>
							<td>????</td>
							<td colspan="2">?????Է?</td>
							<td>???ۼ???????</td>
							<td>??ǰ????</td>
						</tr>
						<!-- ??ǰ??ȣ ???? -->
						<%for(ProductVO pvo:Pal){%>

						<tr>
							<td name="product" id="product2" align = "center"><%= pvo.getProduct() %></td>
							<td align = "center"><%= pvo.getSpice() %></td>
							<td><input size = "1" type="text" name="value" id="mysensor" value="0"></td>
							<td><button id="user_input" type="button" onclick="alert('???ۿϷ?')">????</button></td>
							<td><span id="result"></span>	</td>
							<td align = "center"><a href="DeleteProduct?product=<%=pvo.getProduct()%>"
								onclick="if(!confirm('???? ?Ͻðڽ??ϱ??')){return false;}">????</a></td>
						</tr>

						<%}%>
					</table>
				</form>
         </article>

         <!-- MemberInfo ȸ?????? -->
         <article id="MemberInfo">
            <h2 class="major">ȸ??????</h2>
            <table>
               <tr>
                  <td>ID</td>
                  <td>PW</td>
                  <td>NICK</td>
                  <td>Delete</td>
               </tr>
               <%for(MemberVO mvo:al){%>
               <tr>
                  <td><%=mvo.getid() %></td>
                  <td><%=mvo.getpw() %></td>
                  <td><%=mvo.getnick() %></td>
                  <td><a href="DeleteService?id=<%=mvo.getid()%>" onclick="if(!confirm('???? ?Ͻðڽ??ϱ??')){return false;}">????</a></td>
               </tr>
               <% } %>
            </table>
         </article>

      <!-- ?????? ?Է? -->
      <article id="recipepost">
            <h2 class="major">RecipePost</h2>
      
            <form action="RecipePost" method="post">
               <h3>?丮 ??</h3>
               <input name="rec_name" type="text" placeholder="?丮 ?̸? ?Է?" required="required">
               <br>
               <h3>?ұ?</h3> 
               <input name="salt" type="text" placeholder="?ұ? ?? ?Է?" required="required"> 
               <br> 
               <h3>????</h3>
               <input name="sugar" type="text" placeholder="???? ?? ?Է?" required="required">
               <br>
               <h3>????</h3>
               <input name="pepper" type="text" placeholder="???? ?? ?Է?" required="required">
               <br>
               <div style="text-align: center;">
                  <input type="submit" value="?ۼ?" onclick="alert('?????????? ?????Ǹ? ?ۼ? ?Ͽ????ϴ?.')">
               </div>
            </form>
         </article>
         
      
         

      </div>
      <!-- Main ?? -->


      <!-- Footer -->
      <footer id="footer">

         <p class="copyright">
            &copy; GOOD_SPICE : <a href="https://www.smhrd.or.kr" />????Ʈ???簳?߿?</a>.
         </p>
      </footer>
   </div>


   <!-- BG -->
   <div id="bg"></div>


   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>
   <script src="assets/js/jquery-3.6.0.min.js"></script>
   <script>
      /* id ?ߺ? üũ */
      function idcheck() {
         let input = document.getElementById("input_id");
         $.ajax({
            type : "post", // ?????? ??û ???? get/post
            data : {
               "id" : input.value
            }, // ?????ϴ? ??????
            url : "IdCheckService", // ?????͸? ??û?ϴ? ?????????? url
            dataType : "text", //???䵥?????? ????
            success : function(data) { // ???????? ??, ?Լ? ȣ?? function(???? ???? ??)
               if (data == "true") {
                  //alert(sp.innerText="???? ?Ұ????? ???̵? ?Դϴ?.");
                  alert("???? ?Ұ????? ???̵? ?Դϴ?.")
               } else {
                  //alert(sp.innerText="???? ???? ?? ???̵? ?Դϴ?.");
                  alert("???? ?????? ???̵? ?Դϴ?.")
               }
            },
            error : function() { // ????
               alert("???Ž???")
            }
         });
         
      /* ??ǰ ?ߺ? üũ */
      }function prodcheck() {
         let input_prod = document.getElementById("input_product");
         $.ajax({
            type : "post", // ?????? ??û ???? get/post
            data : {"id" : input_prod.value}, // ?????ϴ? ??????
            url : "ProdCheckService", // ?????͸? ??û?ϴ? ?????????? url
            dataType : "text", //???䵥?????? ????
            success : function(data) { // ???????? ??, ?Լ? ȣ?? function(???? ???? ??)
               if (data == "true") {
                  //alert(sp.innerText="???? ?Ұ????? ???̵? ?Դϴ?.");
                  alert("?ߺ??? ??ǰ ??ȣ?? ?ֽ??ϴ?. ?ٽ? ?Է????ּ???")
               } else {
                  //alert(sp.innerText="???? ???? ?? ???̵? ?Դϴ?.");
                  alert("???? ?????? ??ǰ??ȣ ?Դϴ?.")
               }
            },
            error : function() { // ????
               alert("???Ž???")
            }
         });
      }
      
      $("#user_input").on('click',function(){
       	var mysensor = $("#mysensor").val();
  			$.ajax({
  				url : "ArduinoSetValue",
  				type : "get",
  				data : {"mysensor" : mysensor},
  				dataType : "json",
  				success : function(data){
  					$('#result').html("???? ???? " + data.mysensor + "g");
  				},
  				error : function(){
  					alert('error');
  				}
  			});
  		});
      
   </script>
   
</body>

</html>