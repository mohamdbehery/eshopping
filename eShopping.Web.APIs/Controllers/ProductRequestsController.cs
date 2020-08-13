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

namespace eShopping.Web.APIs.Controllers
{
    public class ProductRequestsController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        [ResponseType(typeof(List<Product_Requests>))]
        public IHttpActionResult GetAllProductRequests()
        {
            return Ok(db.Product_Requests);
        }
        
        [ResponseType(typeof(Product_Requests))]
        public IHttpActionResult SaveProductRequests(Product_Requests productRequest)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            if (productRequest.ProductRequestID > 0 && User.Identity.IsAuthenticated)
            {
                productRequest = db.Product_Requests.Find(productRequest.ProductRequestID);
                productRequest.IsDone = true;
                db.Entry(productRequest).State = EntityState.Modified;
            }
            else if(productRequest.ProductRequestID == 0)
            {
                productRequest.Price = db.Products.Where(x => x.ProductID == productRequest.ProductID).FirstOrDefault().Price;
                productRequest.TotalPrice = productRequest.Price * productRequest.Qty;
                productRequest.IsDone = false;
                productRequest.CreatedDate = DateTime.Now;
                db.Product_Requests.Add(productRequest);
            }

            db.SaveChanges();
            return Ok(productRequest);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}