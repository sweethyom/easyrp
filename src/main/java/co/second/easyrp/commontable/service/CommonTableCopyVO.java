package co.second.easyrp.commontable.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommonTableCopyVO {
	private String postId;
	private String title;
	private String content;
	private String author;
	private Date createDate;
}
