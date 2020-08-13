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
    public class ContactMessagesController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        [ResponseType(typeof(List<ContactUsMessage>))]
        public IHttpActionResult GetContactMessages()
        {
            return Ok(db.ContactUsMessages.Where(x => !x.IsDeleted));
        }

        [ResponseType(typeof(ContactUsMessage))]
        public IHttpActionResult SaveContactUsMessage(ContactUsMessage contactMessage)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            if (contactMessage.ContactUsMessageID > 0 && User.Identity.IsAuthenticated)
            {
                contactMessage = db.ContactUsMessages.Find(contactMessage.ContactUsMessageID);
                contactMessage.IsRead = true;

                db.Entry(contactMessage).State = EntityState.Modified;
            }
            else
            {
                contactMessage.IsRead = false;
                contactMessage.IsDeleted = false;
                contactMessage.CreatedDate = DateTime.Now;
                db.ContactUsMessages.Add(contactMessage);
            }

            db.SaveChanges();
            return Ok(contactMessage);
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