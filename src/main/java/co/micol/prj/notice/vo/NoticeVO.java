package co.micol.prj.notice.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	private int noticeId;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeSubject;
	@JsonFormat(pattern = "YYYY-MM-dd", timezone = "Asia/Seoul")
	private Date noticeDate;
	private int noticeHit;
	
	
	
}
