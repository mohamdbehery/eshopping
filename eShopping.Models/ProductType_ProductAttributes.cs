//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace eShopping.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductType_ProductAttributes
    {
        public long ProductTypeAttributeValueID { get; set; }
        public Nullable<long> ProductTypeID { get; set; }
        public Nullable<long> AttributeID { get; set; }
    
        public virtual ProductAttribute ProductAttribute { get; set; }
        public virtual ProductType ProductType { get; set; }
    }
}