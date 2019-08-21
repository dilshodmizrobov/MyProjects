package tj.mardikor.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tj.mardikor.springboot.dao.TicketBookingDao;
import tj.mardikor.springboot.entity.Ticket;

@Service
public class TicketBookingService {
	@Autowired	
	private TicketBookingDao ticketBookingDao;
	
	public Ticket createTicket(Ticket ticket) {
		return ticketBookingDao.save(ticket);
	}
	
	public Ticket getTicketById( Integer ticketId) {
		return ticketBookingDao.findById(ticketId).get();
	}
	
	public Iterable<Ticket> getAllTicket() {
		return ticketBookingDao.findAll();
	}

	public void deleteTicket(Integer ticketId) {
		ticketBookingDao.deleteById(ticketId);
	}

	public Ticket updateTicket(Integer ticketId, String newEmail) {
		Ticket ticketFromDB=ticketBookingDao.findById(ticketId).get();
		ticketFromDB.setEmail(newEmail);
		Ticket updatedTicket = ticketBookingDao.save(ticketFromDB);
		return updatedTicket;
	}
}
