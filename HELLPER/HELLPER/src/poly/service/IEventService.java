package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.EventDTO;

public interface IEventService {
	public List<EventDTO> getAllEvent() throws Exception;
	public Map<String, Object> getEventDetail(EventDTO edto) throws Exception;
	public Map<String, Object> insertEvent(EventDTO edto) throws Exception;
	public Map<String, Object> updateEvent(EventDTO edto) throws Exception;
	public Map<String, Object> deleteEvetn(EventDTO edto) throws Exception;
	public Map<String, Object> eventRegForm() throws Exception;
}
