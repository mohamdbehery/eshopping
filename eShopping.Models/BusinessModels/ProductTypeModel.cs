using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eShopping.Models.BusinessModels
{
    public class ProductTypeModel
    {
        public long ProductTypeID { get; set; }
        public string Name_AR { get; set; }
        public string Name_EN { get; set; }
        public bool IsActive { get; set; }
        public int ProductsCount { get; set; }
        public List<ProductAttributeModel> productTypeAttributes { get; set; }
    }
}
