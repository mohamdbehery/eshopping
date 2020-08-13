using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eShopping.Models
{
    public class AppEnums
    {
        public enum FileType
        {
            Users = 1,
            Categories = 2,
            Products = 3
        }
        public enum ResponseTypes
        {
            BasicDataExistsBefore = -1
        }
    }
}
