using eShopping.Models;
using eShopping.Web.APIs.Models;
using Helper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace eShopping.Web.APIs.Core
{
    public class BusinessHelper
    {
        private static Utilities utilities;
        public static UserLoginResponseModel CheckLoginUser(string userOrEmail, string password)
        {
            UserLoginResponseModel user = null;
            using (var db = new eShoppingEntities())
            {
                user = (from u in db.Users
                        join fs in db.FileStores on u.UserID equals fs.TypeID into files
                        from file in files.DefaultIfEmpty()
                        where u.eMailAddress == userOrEmail && u.Password == password && file.FileType == (int)AppEnums.FileType.Users
                        select new UserLoginResponseModel()
                        {
                            Email = u.eMailAddress,
                            FullName = u.FullName,
                            MobileNumber = u.MobileNumber,
                            UserID = u.UserID,
                            UserGroup = u.GroupID,
                            Picture = file.FileName
                        }).SingleOrDefault();
            }
            return user;
        }

        public static void SaveToFileStore(List<FileStore> sourceFiles, int fileType, long typeID, string fileTypeName)
        {
            utilities = new Utilities();
            using (var db = new eShoppingEntities())
            {
                List<FileStore> files = new List<FileStore>();
                foreach (FileStore file in sourceFiles)
                {
                    if (file.FilePath.Contains("base64"))
                    {
                        file.CreatedDate = DateTime.Now;
                        file.FileType = fileType;
                        file.TypeID = typeID;
                        file.FileName = String.Format("{0}_{1}_{2}_{3}_{4}", fileTypeName, file.FileType, file.TypeID, DateTime.Now.Millisecond, file.FileName);
                        file.IsActive = true;
                        utilities.SaveBase64FileToServer(string.Format("~/Uploads/{0}", fileTypeName), file.FileName, file.FilePath);
                        file.FilePath = file.FileName;
                        files.Add(file);
                    }
                    else
                    {
                        if (file.FileStoreID > 0)
                        {
                            file.FilePath = file.FileName;
                            db.Entry(file).State = EntityState.Modified;
                        }
                    }
                }

                var dbFiles = db.FileStores.Where(x => x.FileType == fileType && x.TypeID == typeID).ToList();
                if (sourceFiles.Any() && dbFiles.Any())
                {
                    var dbFilesToBeDeleted = dbFiles.Where(x => !(sourceFiles.Select(y => y.FileStoreID).ToList()).Contains(x.FileStoreID));
                    if (dbFilesToBeDeleted.Any())
                        db.FileStores.RemoveRange(dbFilesToBeDeleted);
                }

                db.FileStores.AddRange(files);
                db.SaveChanges();
            }
        }

        public static void RemoveFromFileStore(int fileType, long typeID, string fileTypeName)
        {
            utilities = new Utilities();
            using (var db = new eShoppingEntities())
            {
                var files = db.FileStores.Where(x => x.TypeID == typeID && x.FileType == fileType);
                foreach (var item in files)
                {
                    utilities.DeletePhysicalFile(String.Format("~/Uploads/{0}/{1}", fileTypeName, item.FileName));
                }
                db.FileStores.RemoveRange(files);
            }
        }
    }
}