package co.second.easyrp.client.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 7일 오전 11시 41분 박현우)
@Getter
@Setter
@ToString
public class ClientVO {
	private String cod;
	private String name;
	private String representative;
	private String faxnum;
	private String address;
	private int postcode;
	private String managerName;
	private String managerTel;
	private String discountClass;
}
