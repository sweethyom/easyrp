package co.second.easyrp.commontable.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommonTableVO {
	private String postId;
	private String title;
	private String content;
	private String author;
	private Date createdAt;
	private String deleteyn;
	private String modalInput;
	private int offset;
	private int pageSize;
	private String searchNumber;
	private String searchTitle;
	private String searchContent;
	private String searchAuthor;
	private Date preSearchDate;
	private Date postSearchDate;
}
