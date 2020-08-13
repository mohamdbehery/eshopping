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
    public class ProductAttributeValuesController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        public IHttpActionResult GetAllProductAttributeValues(int id)
        {
            var productAttributes = (from pav in db.Product_ProductAttributeValues
                                     join p in db.Products on pav.ProductID equals p.ProductID
                                     join a in db.ProductAttributes on pav.AttributeID equals a.AttributeID
                                     where p.ProductID == id
                                     select new ProductAttributeValueModel()
                                     {
                                         AttributeID = pav.AttributeID,
                                         AttributeName = a.AttributeName,
                                         AttributeTitle_AR = a.AttributeTitle_AR,
                                         AttributeTitle_EN = a.AttributeTitle_EN,
                                         AttributeValueID = pav.ProductAttributeValueID,
                                         AttributeValue_AR = pav.AttributeValue_AR,
                                         AttributeValue_EN = pav.AttributeValue_EN,
                                         ProductID = pav.ProductID,
                                         ProductName_AR = p.Name_AR
                                     }).ToList();
            return Ok(productAttributes);
        }


        [Authorize]
        [ResponseType(typeof(ProductAttributeValueModel))]
        public IHttpActionResult SaveProductAttributeValue(ProductAttributeValueModel productAttributeValueModel)
        {
            if (IsProductAttributeValueDataExists(productAttributeValueModel))
            {
                productAttributeValueModel.AttributeValueID = (int)AppEnums.ResponseTypes.BasicDataExistsBefore;
            }
            else
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

                Product_ProductAttributeValues product_ProductAttributeValues = new Product_ProductAttributeValues()
                {
                    ProductID = productAttributeValueModel.ProductID,
                    AttributeID = productAttributeValueModel.AttributeID,
                    AttributeValue_AR = productAttributeValueModel.AttributeValue_AR,
                    AttributeValue_EN = productAttributeValueModel.AttributeValue_EN,
                    ProductAttributeValueID = productAttributeValueModel.AttributeValueID
                };

                if (productAttributeValueModel.AttributeValueID > 0)
                    db.Entry(product_ProductAttributeValues).State = EntityState.Modified;
                else
                    db.Product_ProductAttributeValues.Add(product_ProductAttributeValues);

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateException)
                {
                    if (product_ProductAttributeValues.ProductAttributeValueID > 0 && !ProductAttributeValueExists(product_ProductAttributeValues.ProductAttributeValueID))
                    {
                        return NotFound();
                    }
                    else if (ProductAttributeValueExists(product_ProductAttributeValues.ProductAttributeValueID))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }
                productAttributeValueModel.AttributeValueID = product_ProductAttributeValues.ProductAttributeValueID;
            }

            return Ok(productAttributeValueModel);
        }

        [Authorize]
        [ResponseType(typeof(Product_ProductAttributeValues))]
        [HttpGet]
        public IHttpActionResult DeleteProductAttributeValue(long id)
        {
            Product_ProductAttributeValues product_ProductAttributeValues = db.Product_ProductAttributeValues.Find(id);
            if (product_ProductAttributeValues == null)
            {
                return NotFound();
            }

            db.Product_ProductAttributeValues.Remove(product_ProductAttributeValues);
            db.SaveChanges();

            return Ok(product_ProductAttributeValues);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductAttributeValueExists(long id)
        {
            return db.Product_ProductAttributeValues.Count(e => e.ProductAttributeValueID == id) > 0;
        }

        private bool IsProductAttributeValueDataExists(ProductAttributeValueModel productAttributeValueModel)
        {
            return db.Product_ProductAttributeValues.Count(e => e.AttributeID == productAttributeValueModel.AttributeID && e.ProductID == productAttributeValueModel.ProductID && e.ProductAttributeValueID != productAttributeValueModel.AttributeValueID) > 0;
        }
    }
}