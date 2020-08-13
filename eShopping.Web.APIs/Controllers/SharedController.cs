using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using eShopping.Models;
using System.Web.Http.Cors;
using System.Text;
using Helper;
using eShopping.Models.BusinessModels;
using System.Web;
using System.IO;
using eShopping.Web.APIs.Core;
using System.Security.Claims;
using eShopping.Web.APIs.Model;
using System.Web.Routing;

namespace eShopping.Web.APIs.Controllers
{
    public class SharedController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();
        [ResponseType(typeof(List<Localization>))]
        public IHttpActionResult GetAllLocalizations()
        {
            return Ok(db.Localizations);
        }

        public IHttpActionResult GetAppData()
        {
            AppDataModel appDataModel = new AppDataModel()
            {
                highlightedCategories = (from c in db.Categories
                                         where c.IsActive && c.IsHighlighted
                                         select new CategoryModel()
                                         {
                                             CategoryID = c.CategoryID,
                                             Name_AR = c.Name_AR,
                                             Name_EN = c.Name_EN
                                         }).ToList(),
                localizations = db.Localizations.ToList(),
                siteData = db.ContactUs.FirstOrDefault()
            };

            return Ok(appDataModel);
        }

        public IHttpActionResult GetHomeData()
        {
            var products = (from p in db.Products
                            join c in db.Categories on p.CategoryID equals c.CategoryID
                            join pt in db.ProductTypes on p.ProductTypeID equals pt.ProductTypeID
                            join fs in db.FileStores.Where(file => file.FileType == (int)AppEnums.FileType.Products && file.IsMain)
                            on p.ProductID equals fs.TypeID into files
                            from file in files.DefaultIfEmpty()
                            where p.IsActive orderby p.CreatedDate descending, p.IsHighlighted descending, p.IsRecommended descending
                            select new ProductModel()
                            {
                                ProductID = p.ProductID,
                                CategoryID = p.CategoryID,
                                CategoryName_AR = c.Name_AR,
                                CategoryName_EN = c.Name_EN,
                                Description_AR = p.Description_AR,
                                Description_EN = p.Description_EN,
                                IsHighlighted = p.IsHighlighted,
                                IsRecommended = p.IsRecommended,
                                Name_AR = p.Name_AR,
                                Name_EN = p.Name_EN,
                                Price = p.Price,
                                ProductTypeID = p.ProductTypeID,
                                ProductTypeName_AR = pt.Name_AR,
                                ProductTypeName_EN = pt.Name_EN,
                                Qty = p.Qty,
                                RequestsCount = p.Product_Requests.Any() ? p.Product_Requests.Count : 0,
                                Picture = file != null ? file.FileName : null
                            }).ToList();

            products = products.OrderByDescending(x => x.RequestsCount).ToList();
            return Ok(products);
        }

        public IHttpActionResult GetCategories()
        {
            var categories = (from c in db.Categories
                            join fs in db.FileStores.Where(file => file.FileType == (int)AppEnums.FileType.Categories)
                            on c.CategoryID equals fs.TypeID into files
                            from file in files.DefaultIfEmpty()
                            where c.IsActive
                            select new CategoryModel()
                            {
                                CategoryID = c.CategoryID,
                                Name_AR = c.Name_AR,
                                Name_EN = c.Name_EN,
                                Description_AR = c.Description_AR,
                                Description_EN = c.Description_EN,
                                Picture = file != null ? file.FileName : null
                            }).ToList();

            return Ok(categories);
        }

        public IHttpActionResult GetProducts(int id)
        {
            var products = (from p in db.Products
                            join c in db.Categories on p.CategoryID equals c.CategoryID
                            join fs in db.FileStores.Where(file => file.FileType == (int)AppEnums.FileType.Products && file.IsMain)
                            on p.ProductID equals fs.TypeID into files
                            from file in files.DefaultIfEmpty()
                            where p.IsActive && p.CategoryID == id
                            select new ProductModel()
                            {
                                ProductID = p.ProductID,
                                CategoryID = p.CategoryID,
                                Description_AR = p.Description_AR,
                                Description_EN = p.Description_EN,
                                Name_AR = p.Name_AR,
                                Name_EN = p.Name_EN,
                                CategoryName_AR = c.Name_AR,
                                CategoryName_EN = c.Name_EN,
                                Price = p.Price,
                                ProductTypeID = p.ProductTypeID,
                                Qty = p.Qty,
                                Picture = file != null ? file.FileName : null
                            }).ToList();
            
            return Ok(products);
        }

        public IHttpActionResult GetProductDetails(int id)
        {
            var products = (from p in db.Products
                            join c in db.Categories on p.CategoryID equals c.CategoryID
                            join pt in db.ProductTypes on p.ProductTypeID equals pt.ProductTypeID
                            where p.ProductID == id
                            select new ProductModel()
                            {
                                ProductID = p.ProductID,
                                CategoryID = p.CategoryID,
                                CategoryName_AR = c.Name_AR,
                                CategoryName_EN = c.Name_EN,
                                Description_AR = p.Description_AR,
                                Description_EN = p.Description_EN,
                                IsHighlighted = p.IsHighlighted,
                                IsRecommended = p.IsRecommended,
                                Name_AR = p.Name_AR,
                                Name_EN = p.Name_EN,
                                Price = p.Price,
                                ProductTypeID = p.ProductTypeID,
                                ProductTypeName_AR = pt.Name_AR,
                                ProductTypeName_EN = pt.Name_EN,
                                Qty = p.Qty,
                                files = db.FileStores.Where(x => x.IsActive && x.FileType == (int)AppEnums.FileType.Products && x.TypeID == p.ProductID).ToList(),
                                productAttributeValues = (from pa in db.Product_ProductAttributeValues
                                                          join a in db.ProductAttributes on pa.AttributeID equals a.AttributeID
                                                          where pa.ProductID == p.ProductID
                                                          select new ProductAttributeValueModel()
                                                          {
                                                              AttributeTitle_AR = a.AttributeTitle_AR,
                                                              AttributeTitle_EN = a.AttributeTitle_EN,
                                                              AttributeValue_AR = pa.AttributeValue_AR,
                                                              AttributeValue_EN = pa.AttributeValue_EN
                                                          }).ToList()
                            }).ToList();

            return Ok(products.FirstOrDefault());
        }
        
        [Route("api/Shared/Search/{query}")]
        [HttpGet]
        public IHttpActionResult Search(string query)
        {
            query = query.ToLower();
            var products = (from p in db.Products
                            join c in db.Categories on p.CategoryID equals c.CategoryID
                            join fs in db.FileStores.Where(file => file.FileType == (int)AppEnums.FileType.Products && file.IsMain)
                            on p.ProductID equals fs.TypeID into files
                            from file in files.DefaultIfEmpty()
                            where p.IsActive && (p.Name_AR.Contains(query) || p.Name_EN.ToLower().Contains(query) || 
                            p.Description_AR.Contains(query) || p.Description_EN.ToLower().Contains(query) ||
                            c.Name_AR.Contains(query) || c.Name_EN.ToLower().Contains(query) ||
                            c.Description_AR.Contains(query) || c.Description_EN.ToLower().Contains(query))
                            select new ProductModel()
                            {
                                ProductID = p.ProductID,
                                Description_AR = p.Description_AR,
                                Description_EN = p.Description_EN,
                                Name_AR = p.Name_AR,
                                Name_EN = p.Name_EN,
                                Price = p.Price,
                                Picture = file != null ? file.FileName : null
                            }).ToList();
            
            return Ok(products);
        }
    }
}
