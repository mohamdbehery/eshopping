using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eShopping.Models.BusinessModels
{
    public class UserModel
    {
        public int UserID { get; set; }
        public string FullName { get; set; }
        public string Password { get; set; }
        public string eMailAddress { get; set; }
        public string MobileNumber { get; set; }
        public string AboutHim { get; set; }
        public string GroupID { get; set; }
        public bool ShowInfoToUsers { get; set; }
        public bool IsActive { get; set; }
        public FileStore file { get; set; } 
    }
}
