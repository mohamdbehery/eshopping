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
    public class ProductAttributesController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        public IHttpActionResult GetAllProductAttributes()
        {
            var productAttributes = (from pa in db.ProductAttributes
                                     select new ProductAttributeModel()
                                     {
                                         AttributeID = pa.AttributeID,
                                         AttributeName = pa.AttributeName,
                                         AttributeTitle_AR = pa.AttributeTitle_AR,
                                         AttributeTitle_EN = pa.AttributeTitle_EN
                                     }).ToList();
            return Ok(productAttributes);
        }

        [Authorize]
        [ResponseType(typeof(ProductAttribute))]
        public IHttpActionResult SaveProductAttribute(ProductAttribute productAttribute)
        {
            if (IsProductAttributeDataExists(productAttribute))
            {
                productAttribute.AttributeID = (int)AppEnums.ResponseTypes.BasicDataExistsBefore;
            }
            else
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);
                
                if (productAttribute.AttributeID > 0)
                    db.Entry(productAttribute).State = EntityState.Modified;
                else
                {
                    db.ProductAttributes.Add(productAttribute);
                }
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateException)
                {
                    if (productAttribute.AttributeID > 0 && !ProductAttributeExists(productAttribute.AttributeID))
                    {
                        return NotFound();
                    }
                    else if (ProductAttributeExists(productAttribute.AttributeID))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }
            }

            return Ok(productAttribute);
        }

        [Authorize]
        [ResponseType(typeof(ProductAttribute))]
        [HttpGet]
        public IHttpActionResult DeleteProductAttribute(long id)
        {
            ProductAttribute productAttribute = db.ProductAttributes.Find(id);
            if (productAttribute == null)
            {
                return NotFound();
            }

            db.ProductAttributes.Remove(productAttribute);
            db.SaveChanges();

            return Ok(productAttribute);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductAttributeExists(long id)
        {
            return db.ProductAttributes.Count(e => e.AttributeID == id) > 0;
        }

        private bool IsProductAttributeDataExists(ProductAttribute productAttribute)
        {
            return db.ProductAttributes.Count(e => (e.AttributeTitle_AR == productAttribute.AttributeTitle_AR 
            || e.AttributeTitle_EN == productAttribute.AttributeTitle_EN || e.AttributeName == productAttribute.AttributeName) && e.AttributeID != productAttribute.AttributeID) > 0;
        }
    }
}