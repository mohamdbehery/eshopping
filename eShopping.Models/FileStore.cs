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
    
    public partial class FileStore
    {
        public long FileStoreID { get; set; }
        public int FileType { get; set; }
        public long TypeID { get; set; }
        public bool IsMain { get; set; }
        public string FilePath { get; set; }
        public string FileName { get; set; }
        public string FileExtension { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedDate { get; set; }
    }
}
