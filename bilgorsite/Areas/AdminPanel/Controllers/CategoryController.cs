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
    public class CategoryController : Controller
    {
        private Model1 db = new Model1();
        // GET: AdminPanel/Category
        [Authorize(Roles ="Admin,Moderator")]
        public ActionResult Index()
        {
            var tbl_category = db.tbl_category.ToList();
            return View(tbl_category.OrderByDescending(x=>x.CategoryId).ToList());
        }
        [Authorize(Roles = "Admin,Moderator")]
        public ActionResult Create()
        {
            return View();
        }
        [Authorize(Roles = "Admin,Moderator")]
        [HttpPost]
        public ActionResult Create(tbl_category cate, string name, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
            tbl_category category = new tbl_category();
            category.Name = name;
            tbl_photo photo = new tbl_photo();
            if (image != null)
            {
                    string pictureName = Guid.NewGuid().ToString().Replace("-", "");
                    string pictureExtension = Path.GetExtension(Request.Files[0].FileName);
                    string pictureWay = "/Upload/images/" + pictureName + pictureExtension;
                    Request.Files[0].SaveAs(Server.MapPath(pictureWay));
                    photo.URL = pictureWay;
                    db.SaveChanges();
            }
            var imagecopy = db.tbl_photo.Add(photo);
            cate.PhotoId = imagecopy.PhotoId;
            db.tbl_category.Add(cate);
            db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        [Authorize(Roles = "Admin,Moderator")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return HttpNotFound();
            tbl_category tbl_category = db.tbl_category.Find(id);
            if (tbl_category == null)
                return HttpNotFound();
            return View(tbl_category);
        }
        [Authorize(Roles = "Admin,Moderator")]
        [HttpPost]
        public ActionResult Edit(int id,tbl_category category,HttpPostedFileBase image,string name)
        {
            var singleCategory = db.tbl_category.Where(x => x.CategoryId == id).SingleOrDefault();
            if (image != null)
            {
                if (System.IO.File.Exists(Server.MapPath(singleCategory.tbl_photo.URL)))
                {
                    System.IO.File.Delete(Server.MapPath(singleCategory.tbl_photo.URL));
                }
                string pictureName = Guid.NewGuid().ToString().Replace("-", "");
                string pictureExtension = Path.GetExtension(Request.Files[0].FileName);
                string pictureWay = "/Upload/images/" + pictureName + pictureExtension;
                Request.Files[0].SaveAs(Server.MapPath(pictureWay));
                singleCategory.tbl_photo.URL = pictureWay;
                singleCategory.Name = name;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                singleCategory.Name = name;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}