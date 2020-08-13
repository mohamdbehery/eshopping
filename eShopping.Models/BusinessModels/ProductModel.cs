using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eShopping.Models.BusinessModels
{
    public class ProductModel
    {
        public long ProductID { get; set; }
        public long? ProductTypeID { get; set; }
        public string ProductTypeName_AR { get; set; }
        public string ProductTypeName_EN { get; set; }
        public string Name_AR { get; set; }
        public string Name_EN { get; set; }
        public string Description_AR { get; set; }
        public string Description_EN { get; set; }
        public string Picture { get; set; }
        public double? Price { get; set; }
        public int? Qty { get; set; }
        public bool IsHighlighted { get; set; }
        public bool IsRecommended { get; set; }
        public bool IsActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int CategoryID { get; set; }
        public string CategoryName_AR { get; set; }
        public string CategoryName_EN { get; set; }
        public List<FileStore> files { get; set; }
        public int RequestsCount { get; set; }
        public List<ProductAttributeValueModel> productAttributeValues { get; set; }
    }
}
