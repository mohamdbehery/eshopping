using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eShopping.Web.APIs.Models
{
    public class UserLoginResponseModel
    {
        public int UserID { get; set; }
        public string FullName { get; set; }
        public string MobileNumber { get; set; }
        public string UserGroup { get; set; }
        public string Email { get; set; }
        public string Picture { get; set; }
    }
}