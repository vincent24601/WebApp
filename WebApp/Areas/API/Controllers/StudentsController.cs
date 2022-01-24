#nullable disable
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApp.Models;

namespace WebApp.Areas.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        private readonly ApplicationDBContext _context;

        public StudentsController(ApplicationDBContext context)
        {
            _context = context;
        }

        // GET: api/Students
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Student>>> GetStudents()
        {
            return await _context.Students.ToListAsync();
        }

        // GET: api/Students/99400001
        [HttpGet("{studentId}")]
        public async Task<ActionResult<Student>> GetStudent(string studentId)
        {
            var student = await _context.Students.Where(c => c.StudentId.CompareTo(studentId) == 0).FirstOrDefaultAsync();

            if (student == null)
            {
                return NotFound();
            }

            return student;
        }
    }
}
