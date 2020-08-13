using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eShopping.Models.BusinessModels
{
    public class ProductAttributeModel
    {
        public long? AttributeID { get; set; }
        public string AttributeName { get; set; }
        public string AttributeTitle_AR { get; set; }
        public string AttributeTitle_EN { get; set; }
    }
}
