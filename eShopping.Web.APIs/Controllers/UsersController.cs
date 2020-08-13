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
    public class UsersController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        [ResponseType(typeof(List<UserModel>))]
        public IHttpActionResult GetPublicUsers()
        {
            var users = (from u in db.Users
                         join fs in db.FileStores.Where(file => file.FileType == (int)AppEnums.FileType.Users)
                         on u.UserID equals fs.TypeID into files
                         from file in files.DefaultIfEmpty()
                         where !u.IsDeleted && u.IsActive && u.ShowInfoToUsers
                         select new UserModel()
                         {
                             AboutHim = u.AboutHim,
                             eMailAddress = u.eMailAddress,
                             file = file,
                             FullName = u.FullName,
                             MobileNumber = u.MobileNumber
                         }).ToList();
            
            return Ok(users);
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