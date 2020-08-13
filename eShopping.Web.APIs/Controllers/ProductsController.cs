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
using eShopping.Models.BusinessModels;
using Helper;
using eShopping.Web.APIs.Core;

namespace eShopping.Web.APIs.Controllers
{
    public class ProductsController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        public IHttpActionResult GetAllProducts()
        {
            var products = (from p in db.Products
                            join c in db.Categories on p.CategoryID equals c.CategoryID
                            select new ProductModel()
                            {
                                CategoryID = p.CategoryID,
                                ProductTypeID = p.ProductTypeID,
                                ProductTypeName_AR = p.ProductType.Name_AR,
                                ProductTypeName_EN = p.ProductType.Name_EN,
                                Description_AR = p.Description_AR,
                                Description_EN = p.Description_EN,
                                IsActive = p.IsActive,
                                IsHighlighted = p.IsHighlighted,
                                IsRecommended = p.IsRecommended,
                                Name_AR = p.Name_AR,
                                Name_EN = p.Name_EN,
                                ProductID = p.ProductID,
                                CreatedDate = p.CreatedDate,
                                Price = p.Price,
                                Qty = p.Qty,
                                CategoryName_AR = c.Name_AR,
                                CategoryName_EN = c.Name_EN,
                                RequestsCount = p.Product_Requests.Any() ? p.Product_Requests.Count : 0,
                                files = (db.FileStores.Where(x => x.TypeID == p.ProductID && x.FileType == (int)AppEnums.FileType.Products).ToList())
                            }).ToList();

            return Ok(products);
        }

        [ResponseType(typeof(Product))]
        public IHttpActionResult GetProductByID(long id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }

        [Authorize]
        [ResponseType(typeof(ProductModel))]
        public IHttpActionResult SaveProduct(ProductModel productModel)
        {
            if (IsProductDataExists(productModel))
            {
                productModel.ProductID = (int)AppEnums.ResponseTypes.BasicDataExistsBefore;
            }
            else
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

                Product product = new Product()
                {
                    ProductID = productModel.ProductID,
                    ProductTypeID = productModel.ProductTypeID,
                    CategoryID = productModel.CategoryID,
                    Description_AR = productModel.Description_AR,
                    Description_EN = productModel.Description_EN,
                    IsActive = productModel.IsActive,
                    IsHighlighted = productModel.IsHighlighted,
                    IsRecommended = productModel.IsRecommended,
                    Name_AR = productModel.Name_AR,
                    Name_EN = productModel.Name_EN,
                    Price = productModel.Price,
                    Qty = productModel.Qty,
                    CreatedDate = DateTime.Now
                };

                if (productModel.ProductID > 0)
                {
                    db.Entry(product).State = EntityState.Modified;
                    if (!productModel.files.Any())
                        BusinessHelper.RemoveFromFileStore((int)AppEnums.FileType.Products, productModel.ProductID, AppEnums.FileType.Products.ToString());
                }
                else
                {
                    product.CreatedDate = DateTime.Now;
                    db.Products.Add(product);
                }
                try
                {
                    db.SaveChanges();
                    BusinessHelper.SaveToFileStore(productModel.files, (int)AppEnums.FileType.Products, product.ProductID, AppEnums.FileType.Products.ToString());
                }
                catch (DbUpdateException)
                {
                    if (product.ProductID > 0 && !ProductExists(product.CategoryID))
                    {
                        return NotFound();
                    }
                    else if (ProductExists(product.CategoryID))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }
                productModel.ProductID = product.ProductID;
            }
            
            return Ok(productModel);
        }

        [Authorize]
        [ResponseType(typeof(Product))]
        [HttpGet]
        public IHttpActionResult DeleteProduct(long id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            BusinessHelper.RemoveFromFileStore((int)AppEnums.FileType.Products, product.ProductID, AppEnums.FileType.Products.ToString());
            db.Products.Remove(product);
            db.SaveChanges();

            return Ok(product);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductExists(long id)
        {
            return db.Products.Count(e => e.ProductID == id) > 0;
        }

        private bool IsProductDataExists(ProductModel productModel)
        {
            return db.Products.Count(e => (e.Name_AR == productModel.Name_AR || e.Name_EN == productModel.Name_EN) && e.ProductID != productModel.ProductID) > 0;
        }
    }
}