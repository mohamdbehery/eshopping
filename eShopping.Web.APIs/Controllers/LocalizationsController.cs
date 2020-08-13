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
using System.Text.RegularExpressions;

namespace eShopping.Web.APIs.Controllers
{
    public class LocalizationsController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();

        [ResponseType(typeof(List<Localization>))]
        public IHttpActionResult GetAllLocalizations()
        {
            return Ok(db.Localizations.OrderBy(x => x.Code));
        }

        [Authorize]
        [ResponseType(typeof(CategoryModel))]
        public IHttpActionResult SaveLocalization(Localization localization)
        {
            localization.Code = Regex.Replace(localization.Code, @"\s+", "");
            if (IsLocalizationDataExists(localization))
            {
                localization.LocalizationID = (int)AppEnums.ResponseTypes.BasicDataExistsBefore;
            }
            else
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                if (localization.LocalizationID > 0)
                {
                    db.Entry(localization).State = EntityState.Modified;
                }
                else
                {
                    db.Localizations.Add(localization);
                }

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateException)
                {
                    if (localization.LocalizationID > 0 && !LocalizationExists(localization.LocalizationID))
                    {
                        return NotFound();
                    }
                    else if (LocalizationExists(localization.LocalizationID))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }
            }
            return Ok(localization);
        }

        [Authorize]
        [ResponseType(typeof(Category))]
        [HttpGet]
        public IHttpActionResult DeleteLocalization(int id)
        {
            Localization localization = db.Localizations.Find(id);
            if (localization == null)
            {
                return NotFound();
            }

            db.Localizations.Remove(localization);
            db.SaveChanges();

            return Ok(localization);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LocalizationExists(int id)
        {
            return db.Localizations.Count(e => e.LocalizationID == id) > 0;
        }

        private bool IsLocalizationDataExists(Localization localization)
        {
            return db.Localizations.Count(e => e.Code == localization.Code && e.Page == localization.Page && e.Lang == localization.Lang && e.LocalizationID != localization.LocalizationID) > 0;
        }
    }
}
