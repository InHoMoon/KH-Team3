package web.service.face.user;

import javax.servlet.http.HttpServletRequest;

import web.dto.Ufile;
import web.dto.User;

public interface UpdateService {

	/**
	 * 전달파라미터를 User DTO로 저장하여 반환
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 전달파라미터 userno를 저장한 객체
	 */
	public User getUserno(HttpServletRequest req);
	
	/**
	 * 전달된 userno를 이용하여 회원정보를 조회한다
	 * 
	 * @param userno - 조회할 userno를 가진 DTO객체
	 * @return User - 조회된 회원 정보
	 */
	public User view(User userno);
	
	/**
	 * 첨부파일 정보 조회하기
	 * 
	 * @param updateUser - 첨부파일과 연결된 게시글의 번호
	 * @return Ufile - 첨부파일 정보 DTO객체
	 */
	public Ufile viewFile(User updateUser);

	/**
	 * 회원정보 수정
	 * 
	 * @param req - 요청 정보 객체
	 */
	public void update(HttpServletRequest req);

	/**
	 * 회원 정보 추출하기
	 * 
	 * @param req - 요청 정보 객체
	 * @return User - 회원수정 정보 객체 ( userpw )
	 */
	public User getUpdateUserpw(HttpServletRequest req);

	/**
	 * 전달된 데이터를 이용하여 비밀번호 수정
	 * 
	 * @param user - 회원수정 정보 객체 ( userpw )
	 */
	public void updatePw(User user);

}
