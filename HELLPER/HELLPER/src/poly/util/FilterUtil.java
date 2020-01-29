package poly.util;

import poly.dto.CommentDTO;
import poly.dto.NoticeDTO;
import poly.dto.QnADTO;

public class FilterUtil {
	public static NoticeDTO NoticeFilter(NoticeDTO pDTO) {
		if(pDTO.getNotice_title()!=null) {
			pDTO.setNotice_title(pDTO.getNotice_title().replaceAll("scr!pt", "script"));
		}
		if(pDTO.getNotice_content()!=null) {
			pDTO.setNotice_content(pDTO.getNotice_content().replaceAll("scr!pt", "script"));
		}
		return pDTO;
	}
	
	public static QnADTO QnAFilter(QnADTO pDTO) {
		if(pDTO.getQna_title()!=null) {
			pDTO.setQna_title(pDTO.getQna_title().replaceAll("scr!pt", "script"));
		}
		if(pDTO.getQna_content()!=null) {
			pDTO.setQna_content(pDTO.getQna_content().replaceAll("scr!pt", "script"));
		}
		return pDTO;
	}
	
	public static CommentDTO CommentFilter(CommentDTO pDTO) {
		if(pDTO.getComm_content()!=null) {
			pDTO.setComm_content(pDTO.getComm_content().replaceAll("scr!pt", "script"));
		}
		return pDTO;
	}
}
