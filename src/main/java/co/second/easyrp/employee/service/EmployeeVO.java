package co.second.easyrp.employee.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 사원 관리를 이용 하기위한 VO class
// (2024년 4월 29일 오후 8시 56분 수정 박현우)
@Getter
@Setter
@ToString
public class EmployeeVO {
	private String cod;
	private String name;
	private String password;
	private String departmentCod;
	private String empPosition;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	private String email;
	private String tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthdate;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date quitdate;
	private String quitReason;
	private String deleteyn;
	private int offset;
	private int pageSize;
}
