package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	ArrayList<MemberVO> al =null;
	boolean check= false;
	int cnt = 0;
//	동적연결
	public void connection() {
	
		try {
			//1. 드라이버 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
//			2. 데이터베이스 연결 객체 생성

			String url="jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid="campus_b_2_1025";
			String dbpw="smhrd2";
			
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
		}
		
	}
//	접속끊기
	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
// 	가입
	public int join(String id,String pw,String nick) {
		
		try {
			
			connection();
			
//			3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)
			String sql = "insert into MEMBER values (?,?,?)";
			
//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);
			
//			5. 바인드 변수(?) 채우기
			psmt.setString(1,id);
			psmt.setString(2,pw);
			psmt.setString(3,nick);
			
			
//			6. sql문 실행 후 결과처리
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("가입실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return cnt;
	}
//	로그인
	public MemberVO login(String id, String pw) {

		try {
			connection();
//			3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)
			String sql = "select * from MEMBER where MEM_ID=? and MEM_PW=?";
			
//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);
			
//			5. 바인드 변수(?) 채우기
			psmt.setString(1,id);
			psmt.setString(2,pw);
			
//			6. sql문 실행 후 결과처리
			rs = psmt.executeQuery();
			
			if(rs.next()){
				System.out.println("로그인성공!");	
				
				String get_id = rs.getString("MEM_ID");
				String get_pw = rs.getString("MEM_PW");
				String get_nick = rs.getString("MEM_NICK");
				
				vo = new MemberVO(get_id,get_pw,get_nick);
//				
			}else {
				System.out.println("로그인실패!");
			}	
		} catch (Exception e) {
			System.out.println("로그인실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return vo;
	}
//	수정 = 사용자가 입력한 pw,tel,address로 테이블의 값을 수정
	public int update(String id ,String pw,String nick) {
		try {
			connection();
			
//			3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)
			String sql = "UPDATE MEMBER SET MEM_PW = ?, MEM_NICK=? WHERE MEM_ID = ?";
			
//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);
			
//			5. 바인드 변수(?) 채우기
			
			psmt.setString(1,pw);
			psmt.setString(2,nick);
			psmt.setString(3,id);
			
//			6. sql문 실행 후 결과처리
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("수정실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return cnt;
	}
//  회원정보 관리
	public ArrayList<MemberVO> selectAll() {
		try {
//			회원정보를 저장할 ArrayList
			al = new ArrayList<MemberVO>();
			
			connection();
//			3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)
			String sql = "select MEM_ID,MEM_PW,MEM_NICK from MEMBER ";
			
//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);

//			6. sql문 실행 후 결과처리
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				String get_id = rs.getString("MEM_ID");
				String get_pw = rs.getString("MEM_PW");
				String get_nick = rs.getString("MEM_NICK");
				
				vo = new MemberVO(get_id,get_pw,get_nick);	
//				vo값을 al에 add
				al.add(vo);
			}
				
		} catch (Exception e) {
			System.out.println("조회실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return al;
	}
//	회원 삭제
	public int delete(String id) {
//		삭제완료 => 삭제완료!
//		삭제미완료 => 삭제실패!
		try {
			connection();
			
				String sql = "DELETE from MEMBER where MEM_ID=?";
						
			
	//			4. sql문 실행객체 (PreparedStatment)생성
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, id);
	//			6. sql문 실행 후 결과처리
				cnt = psmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();	
		}
		return cnt;
	}
//	아이디 중복체크
	public boolean idCheck(String id) {
		try {
			connection();
//			3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)
			String sql = "select * from MEMBER where MEM_ID=?";
			
//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);
			
//			5. 바인드 변수(?) 채우기
			psmt.setString(1,id);
			
//			6. sql문 실행 후 결과처리
			rs = psmt.executeQuery();
			
			if(rs.next()){
				//입력한 이메일을 사용할 수 없을때
				check=true;
			}else {
				//입력한 이메일을 사용할 수 있을때
				check=false;
			}	
		} catch (Exception e) {
			System.out.println("중복확인 실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return check;
	}


}

	