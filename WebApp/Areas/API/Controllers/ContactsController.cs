#nullable disable
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApp.Models;

namespace WebApp.Areas.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsController : ControllerBase
    {
        private readonly ApplicationDBContext _context;

        public ContactsController(ApplicationDBContext context)
        {
            _context = context;
        }

        // GET: api/Contacts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Contact>>> GetContacts()
        {
            return await _context.Contacts.ToListAsync();
        }

        // GET: api/Contacts/99400001
        [HttpGet("{studentId}")]
        public async Task<ActionResult<IEnumerable<Contact>>> GetContacts(string studentId)
        {
            var contacts = await _context.Contacts.Where(c => c.StudentId.CompareTo(studentId) == 0).ToListAsync();

            if (contacts == null)
            {
                return NotFound();
            }

            return contacts;
        }
    }
}
