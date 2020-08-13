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
    public class ContactUsController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        [ResponseType(typeof(ContactU))]
        public IHttpActionResult GetContactUs()
        {
            return Ok(db.ContactUs.FirstOrDefault());
        }

        [Authorize]
        [ResponseType(typeof(ContactU))]
        public IHttpActionResult SaveContactUs(ContactU contactUs)
        {
            contactUs.LastModified = DateTime.Now;
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (contactUs.ContactUsID > 0)
                db.Entry(contactUs).State = EntityState.Modified;
            else
                db.ContactUs.Add(contactUs);

            db.SaveChanges();

            return Ok(contactUs);
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