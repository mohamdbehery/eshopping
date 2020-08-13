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

namespace eShopping.Web.APIs.Controllers
{
    public class ProductTypesController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        public IHttpActionResult GetAllProductTypes()
        {
            var productTypes = (from pt in db.ProductTypes
                                select new ProductTypeModel()
                                {
                                    ProductTypeID = pt.ProductTypeID,
                                    IsActive = pt.IsActive,
                                    Name_AR = pt.Name_AR,
                                    Name_EN = pt.Name_EN,
                                    ProductsCount = pt.Products.Any() ? pt.Products.Count : 0,
                                    productTypeAttributes = (from pta in pt.ProductType_ProductAttributes
                                                             join pa in db.ProductAttributes on pta.AttributeID equals pa.AttributeID
                                                             select new ProductAttributeModel()
                                                             {
                                                                 AttributeID = pta.AttributeID,
                                                                 AttributeName = pa.AttributeName,
                                                                 AttributeTitle_AR = pa.AttributeTitle_AR,
                                                                 AttributeTitle_EN = pa.AttributeTitle_EN
                                                             }).ToList()
                                }).ToList();
            return Ok(productTypes);
        }

        [HttpGet]
        public IHttpActionResult GetAllProductTypeAttributes(int id)
        {
            var productTypeAttributes = (from pta in db.ProductType_ProductAttributes
                                         join pa in db.ProductAttributes on pta.AttributeID equals pa.AttributeID
                                         join p in db.Products on pta.ProductTypeID equals p.ProductTypeID
                                         where p.ProductID == id
                                         select new ProductAttributeModel()
                                         {
                                             AttributeID = pta.AttributeID,
                                             AttributeName = pa.AttributeName,
                                             AttributeTitle_AR = pa.AttributeTitle_AR,
                                             AttributeTitle_EN = pa.AttributeTitle_EN
                                         }).ToList();
            return Ok(productTypeAttributes);
        }

        [Authorize]
        [ResponseType(typeof(ProductTypeModel))]
        public IHttpActionResult SaveProductType(ProductTypeModel productTypeModel)
        {
            if (IsProductTypeDataExists(productTypeModel))
            {
                productTypeModel.ProductTypeID = (int)AppEnums.ResponseTypes.BasicDataExistsBefore;
            }
            else
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

                ProductType productType = new ProductType()
                {
                    ProductTypeID = productTypeModel.ProductTypeID,
                    IsActive = productTypeModel.IsActive,
                    Name_AR = productTypeModel.Name_AR,
                    Name_EN = productTypeModel.Name_EN
                };

                if (productTypeModel.ProductTypeID > 0)
                {
                    db.Entry(productType).State = EntityState.Modified;

                    var productTypeAttributes = db.ProductType_ProductAttributes.Where(x => x.ProductTypeID == productTypeModel.ProductTypeID);
                    db.ProductType_ProductAttributes.RemoveRange(productTypeAttributes);
                }
                else
                {
                    productType.CreatedDate = DateTime.Now;
                    productType.IsDeleted = false;
                    db.ProductTypes.Add(productType);
                    db.SaveChanges();
                }

                try
                {
                    if (productTypeModel.productTypeAttributes != null)
                    {
                        List<ProductType_ProductAttributes> productTypeAttributes = new List<ProductType_ProductAttributes>();
                        ProductType_ProductAttributes productTypeAttribute;
                        foreach (ProductAttributeModel productAttributeModel in productTypeModel.productTypeAttributes)
                        {
                            productTypeAttribute = new ProductType_ProductAttributes()
                            {
                                ProductTypeID = productType.ProductTypeID,
                                AttributeID = productAttributeModel.AttributeID
                            };
                            productTypeAttributes.Add(productTypeAttribute);
                        }
                        db.ProductType_ProductAttributes.AddRange(productTypeAttributes);
                        db.SaveChanges();
                    }
                }
                catch (DbUpdateException)
                {
                    if (productType.ProductTypeID > 0 && !ProductTypeExists(productType.ProductTypeID))
                    {
                        return NotFound();
                    }
                    else if (ProductTypeExists(productType.ProductTypeID))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }
                productTypeModel.ProductTypeID = productType.ProductTypeID;
            }

            return Ok(productTypeModel);
        }

        [Authorize]
        [ResponseType(typeof(ProductType))]
        [HttpGet]
        public IHttpActionResult DeleteProductType(long id)
        {
            ProductType productType = db.ProductTypes.Find(id);
            if (productType == null)
            {
                return NotFound();
            }

            var productTypeAttributes = db.ProductType_ProductAttributes.Where(x => x.ProductTypeID == id);
            db.ProductType_ProductAttributes.RemoveRange(productTypeAttributes);
            db.ProductTypes.Remove(productType);
            db.SaveChanges();

            return Ok(productType);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductTypeExists(long id)
        {
            return db.ProductTypes.Count(e => e.ProductTypeID == id) > 0;
        }

        private bool IsProductTypeDataExists(ProductTypeModel productTypeModel)
        {
            return db.ProductTypes.Count(e => (e.Name_AR == productTypeModel.Name_AR || e.Name_EN == productTypeModel.Name_EN) && e.ProductTypeID != productTypeModel.ProductTypeID) > 0;
        }
    }
}