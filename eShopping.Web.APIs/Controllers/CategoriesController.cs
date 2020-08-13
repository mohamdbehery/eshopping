using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;
using eShopping.Models;
using eShopping.Models.BusinessModels;
using eShopping.Web.APIs.Core;
using System.Security.Claims;
using eShopping.Web.APIs.Model;
using System.Web.Http.Cors;

namespace eShopping.Web.APIs.Controllers
{
    public class CategoriesController : ApiController
    {
        private readonly eShoppingEntities db = new eShoppingEntities();
        protected AppUser CurrentUser
        {
            get
            {
                return new AppUser(User as ClaimsPrincipal);
            }
        }
        
        [ResponseType(typeof(DbSet<Category>))]
        public IHttpActionResult GetAllCategories()
        {
            List<CategoryModel> categories = new List<CategoryModel>();
            CategoryModel categoryModel;
            foreach (var item in db.Categories)
            {
                categoryModel = new CategoryModel()
                {
                    CategoryID = item.CategoryID,
                    Description_AR = item.Description_AR,
                    Description_EN = item.Description_EN,
                    IsActive = item.IsActive,
                    IsHighlighted = item.IsHighlighted,
                    Name_AR = item.Name_AR,
                    Name_EN = item.Name_EN,
                    ParentID = item.ParentID,
                    ProductsCount = db.Products.Count(x => x.CategoryID == item.CategoryID),
                    files = (db.FileStores.Where(x => x.TypeID == item.CategoryID && x.FileType == (int)AppEnums.FileType.Categories).ToList())
                };
                categories.Add(categoryModel);
            }
            return Ok(categories);
        }

        [ResponseType(typeof(DbSet<Category>))]
        public IHttpActionResult GetPureCategories()
        {
            return Ok(db.Categories);
        }

        [Authorize]
        [ResponseType(typeof(CategoryModel))]
        public IHttpActionResult SaveCategory(CategoryModel categoryModel)
        {
            if (IsCategoryDataExists(categoryModel))
            {
                categoryModel.CategoryID = (int)AppEnums.ResponseTypes.BasicDataExistsBefore;
            }
            else
            {
                Category category = new Category()
                {
                    Name_AR = categoryModel.Name_AR,
                    Name_EN = categoryModel.Name_EN,
                    CategoryID = categoryModel.CategoryID,
                    Description_AR = categoryModel.Description_AR,
                    Description_EN = categoryModel.Description_EN,
                    IsActive = categoryModel.IsActive,
                    ParentID = categoryModel.ParentID,
                    IsHighlighted = categoryModel.IsHighlighted
                };

                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                if (categoryModel.CategoryID > 0)
                {
                    db.Entry(category).State = EntityState.Modified;
                    if (!categoryModel.files.Any())
                        BusinessHelper.RemoveFromFileStore((int)AppEnums.FileType.Categories, categoryModel.CategoryID, AppEnums.FileType.Categories.ToString());
                }
                else
                {
                    db.Categories.Add(category);
                }

                try
                {
                    db.SaveChanges();
                    BusinessHelper.SaveToFileStore(categoryModel.files, (int)AppEnums.FileType.Categories, category.CategoryID, AppEnums.FileType.Categories.ToString());
                }
                catch (DbUpdateException)
                {
                    if (category.CategoryID > 0 && !CategoryExists(category.CategoryID))
                    {
                        return NotFound();
                    }
                    else if (CategoryExists(category.CategoryID))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }
                categoryModel.CategoryID = category.CategoryID;
            }
            return Ok(categoryModel);
        }

        [Authorize]
        [ResponseType(typeof(Category))]
        [HttpGet]
        public IHttpActionResult DeleteCategory(int id)
        {
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return NotFound();
            }

            BusinessHelper.RemoveFromFileStore((int)AppEnums.FileType.Categories, category.CategoryID, AppEnums.FileType.Categories.ToString());
            db.Categories.Remove(category);
            db.SaveChanges();

            return Ok(category);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CategoryExists(int id)
        {
            return db.Categories.Count(e => e.CategoryID == id) > 0;
        }

        private bool IsCategoryDataExists(CategoryModel categoryModel)
        {
            return db.Categories.Count(e => (e.Name_AR == categoryModel.Name_AR || e.Name_EN == categoryModel.Name_EN) && e.CategoryID != categoryModel.CategoryID) > 0;
        }
    }
}