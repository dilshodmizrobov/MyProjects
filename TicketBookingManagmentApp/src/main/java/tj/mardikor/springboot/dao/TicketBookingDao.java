package tj.mardikor.springboot.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import tj.mardikor.springboot.entity.Ticket;

@Repository
public interface TicketBookingDao extends CrudRepository<Ticket, Integer> {

}
