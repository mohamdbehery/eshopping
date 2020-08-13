using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eShopping.Models.BusinessModels
{
    public class AppDataModel
    {
        public List<CategoryModel> highlightedCategories { get; set; }
        public List<Localization> localizations { get; set; }
        public ContactU siteData { get; set; }
    }
}
