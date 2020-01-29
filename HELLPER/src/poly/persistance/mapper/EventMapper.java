package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import oracle.jrockit.jfr.openmbean.EventDescriptorType;
import poly.dto.EventDTO;

@Mapper("EventMapper")
public interface EventMapper {
	public List<EventDTO> getAllEvent() throws Exception;
	public EventDTO getEventDetail(EventDTO edto) throws Exception;
	public void insertEvent(EventDTO edto) throws Exception;
	public boolean updateEvent(EventDTO edto)throws Exception;
	public boolean deleteEvent(EventDTO edto) throws Exception;
	public void updateEventCnt(EventDTO edto) throws Exception;
}
