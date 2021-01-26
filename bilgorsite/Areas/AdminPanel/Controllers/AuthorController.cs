using bilgorsite.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bilgorsite.Areas.AdminPanel.Controllers
{
    [Authorize]
    public class AuthorController : Controller
    {
        Model1 db = new Model1();
        // GET: AdminPanel/Author
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Edit(string UserName)
        {
            var author = db.aspnet_Users.Find(UserName);
            return View(author);
        }
        [HttpPost]
        public ActionResult Edit(string UserName,string bio,string fb,string ins,aspnet_Users user,HttpPostedFileBase image)
        {
            var author = db.aspnet_Users.Find(UserName);

            if (ModelState.IsValid)
            {
                tbl_photo photo = new tbl_photo();
                if (image != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(author.tbl_photo.URL)))
                    {
                        System.IO.File.Delete(Server.MapPath(author.tbl_photo.URL));
                    }
                    string pictureName = Guid.NewGuid().ToString().Replace("-", "");
                    string pictureExtension = Path.GetExtension(Request.Files[0].FileName);
                    string pictureWay = "/Upload/images/" + pictureName + pictureExtension;
                    Request.Files[0].SaveAs(Server.MapPath(pictureWay));
                    photo.URL = pictureWay;
                    var imagecopy = db.tbl_photo.Add(photo);
                    author.PhotoId = imagecopy.PhotoId;
                    db.SaveChanges();
                }
                author.Biography = bio;
                author.Facebook = fb;
                author.Instagram = ins;
                db.SaveChanges();
            }
            return View();
        }
    }
}