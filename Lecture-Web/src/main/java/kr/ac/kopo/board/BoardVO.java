package kr.ac.kopo.board;

/*
 *  자바 빈즈 클래스 형태로 만들고 싶음.
 *  1. 패키지를 포함하고 있어야 함
 *  2. CLASS 접근 제한자는 PUBLIC이어야 한다.
 *  3. 기본생성자를 가지고 있어야 한다.
 *  4. 멤버변수 접근 제한자는 무조건 private이다
 *  5. 멤버변수에 대한 setter와 getter 메소드가 존재해야한다. 
 */

public class BoardVO {
private int no;
private String title;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public BoardVO() {
	
}
}


