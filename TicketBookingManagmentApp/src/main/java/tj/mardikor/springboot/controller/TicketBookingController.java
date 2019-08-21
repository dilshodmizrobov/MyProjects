package tj.mardikor.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tj.mardikor.springboot.entity.Ticket;
import tj.mardikor.springboot.service.TicketBookingService;

@RestController
@RequestMapping(value = "/api/tickets")
public class TicketBookingController {
	private TicketBookingService ticketBookingService;

	@Autowired
	public TicketBookingController(TicketBookingService ticketBookingService) {
		this.ticketBookingService = ticketBookingService;
	}

	@PostMapping(value = "/create")
	public Ticket createTicket(@RequestBody Ticket ticket) {
		return ticketBookingService.createTicket(ticket);
	}

	@GetMapping(value = "/ticket/{ticketId}")
	public Ticket getTicketById(@PathVariable Integer ticketId) {
		return ticketBookingService.getTicketById(ticketId);
	}
	
	@GetMapping(value = "/ticket/all")
	public Iterable <Ticket> getAllBookedTicket() {
		return ticketBookingService.getAllTicket();
	}
	
	@DeleteMapping(value = "/ticket/{ticketId}")
	public void  deleteTicket(@PathVariable Integer ticketId) {
		 ticketBookingService.deleteTicket(ticketId);
	}
	
	@PutMapping(value = "/ticket/{ticketId}/{newEmail}")
	public Ticket updateTicket(@PathVariable Integer ticketId,@PathVariable String newEmail ) {
		 return ticketBookingService.updateTicket(ticketId,newEmail);
	}

}
