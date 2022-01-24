using System;
using System.Collections.Generic;

namespace WebApp.Models
{
    public partial class Contact
    {
        public int Id { get; set; }
        public string StudentId { get; set; } = null!;
        public string? LastName { get; set; }
        public string? FirstName { get; set; }
        public string? Relationship { get; set; }
        public string? EmailAddress { get; set; }
        public string? Mobile { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? ZipCode { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string? ModifiedBy { get; set; }
        public bool? Deleted { get; set; }

        public virtual Student Student { get; set; } = null!;
    }
}
