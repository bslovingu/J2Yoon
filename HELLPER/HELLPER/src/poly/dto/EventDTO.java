package poly.dto;

import java.sql.Date;

public class EventDTO {
	String event_seq;
	String event_title;
	String event_content;
	String event_uploadname;
	String event_cnt;
	String event_upday;
	public String getEvent_seq() {
		return event_seq;
	}
	public void setEvent_seq(String event_seq) {
		this.event_seq = event_seq;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_uploadname() {
		return event_uploadname;
	}
	public void setEvent_uploadname(String event_uploadname) {
		this.event_uploadname = event_uploadname;
	}
	public String getEvent_cnt() {
		return event_cnt;
	}
	public void setEvent_cnt(String event_cnt) {
		this.event_cnt = event_cnt;
	}
	public String getEvent_upday() {
		return event_upday;
	}
	public void setEvent_upday(String event_upday) {
		this.event_upday = event_upday;
	}
	
	
}
