namespace eShopping.Models.BusinessModels
{
    public class ProductAttributeValueModel
    {
        public long AttributeValueID { get; set; }
        public long? ProductID { get; set; }
        public long? AttributeID { get; set; }
        public string AttributeName { get; set; }
        public string AttributeValue_AR { get; set; }
        public string AttributeValue_EN { get; set; }
        public string AttributeTitle_AR { get; set; }
        public string AttributeTitle_EN { get; set; }
        public string ProductName_AR { get; set; }
    }
}
