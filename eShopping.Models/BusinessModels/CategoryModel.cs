using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eShopping.Models.BusinessModels
{
    public class CategoryModel
    {
        public int CategoryID { get; set; }
        public Nullable<int> ParentID { get; set; }
        public string Name_AR { get; set; }
        public string Name_EN { get; set; }
        public string Description_AR { get; set; }
        public string Description_EN { get; set; }
        public string Picture { get; set; }
        public bool IsActive { get; set; }
        public bool IsHighlighted { get; set; }
        public int ProductsCount { get; set; }
        public List<FileStore> files { get; set; }
    }
}
