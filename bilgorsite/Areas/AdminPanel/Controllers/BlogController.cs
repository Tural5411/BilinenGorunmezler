using bilgorsite.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using PagedList;
using PagedList.Mvc;
using bilgorsite.Areas.AdminPanel.AreaView;

namespace bilgorsite.Areas.AdminPanel.Controllers
{
    [Authorize]
    public class BlogController : Controller
    {
        Model1 db = new Model1();
        // GET: AdminPanel/Blog
        [Authorize(Roles="Admin,Moderator,Yazıçı")]
        public ActionResult Index(int page = 1)
        {
            BlogVM VM = new BlogVM();
            VM.posts = (IPagedList<tbl_post>)db.tbl_post.OrderByDescending(x=>x.PostId).ToList().ToPagedList(page, 8);
            return View(VM);
        }
        [Authorize(Roles = "Admin,Moderator,Yazıçı")]
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.tbl_category, "CategoryId","Name");
            return View();
        }
        [Authorize(Roles = "Admin,Moderator,Yazıçı")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(tbl_post post,string context, string Title, HttpPostedFileBase image) 
        {
            if (ModelState.IsValid)
            {
                    //tbl_post post = new tbl_post();
                    tbl_photo photo = new tbl_photo();
                    post.Title = Title;
                    post.Context = context;
                if (image != null)
                {
                    string pictureName = Guid.NewGuid().ToString().Replace("-", "");
                    string pictureExtension = Path.GetExtension(Request.Files[0].FileName);
                    string pictureWay = "/Upload/images/" + pictureName + pictureExtension;
                    Request.Files[0].SaveAs(Server.MapPath(pictureWay));
                    photo.URL= pictureWay;
                    db.SaveChanges();

                }
                var imagecopy = db.tbl_photo.Add(photo);
                post.PhotoId = imagecopy.PhotoId;
                post.Accept = false;
                post.Active = true;
                post.Views = 0;
                post.AuthorId = db.aspnet_Users.FirstOrDefault(x => x.UserName == User.Identity.Name).UserId;
                post.DateTime = DateTime.Now;
                db.tbl_post.Add(post);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [Authorize(Roles = "Admin,Moderator,Yazıçı")]
        [HttpGet]
        [ValidateInput(false)]
        public ActionResult Edit(int? id)
        {
            var post = db.tbl_post.Where(x => x.PostId == id).SingleOrDefault();
            if (id != null)
            {
                if (post == null)
                    HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.tbl_category, "CategoryId", "Name");
            return View(post);
        }

        [Authorize(Roles = "Admin,Moderator,Yazıçı")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int? id, string Title, string Context, HttpPostedFileBase image, tbl_post post)
        {
            if (ModelState.IsValid)
            {
                tbl_photo photo = new tbl_photo();
                var selectedPost = db.tbl_post.Where(x => x.PostId == id).SingleOrDefault();
                if (image != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(selectedPost.tbl_photo.URL)))
                    {
                        System.IO.File.Delete(Server.MapPath(selectedPost.tbl_photo.URL));
                    }
                    string pictureName = Guid.NewGuid().ToString().Replace("-", "");
                    string pictureExtension = Path.GetExtension(Request.Files[0].FileName);
                    string pictureWay = "/Upload/images/" + pictureName + pictureExtension;
                    Request.Files[0].SaveAs(Server.MapPath(pictureWay));
                    photo.URL = pictureWay;
                    var imagecopy = db.tbl_photo.Add(photo);
                    selectedPost.PhotoId = imagecopy.PhotoId;
                    db.SaveChanges();
                }
                selectedPost.Title = Title;
                selectedPost.Context = Context;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        private void Yenile(tbl_Writer selectedWriter = null)
        {
            var writers = from d in db.tbl_Writer
                                   orderby d.FullName
                                   select d;
            ViewBag.DepartmentID = new SelectList(writers, "WriterId", "FullName", selectedWriter);
        }

            [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            tbl_post post = db.tbl_post.Find(id);
            if (System.IO.File.Exists(Server.MapPath(post.tbl_photo.URL)))
            {
                System.IO.File.Delete(Server.MapPath(post.tbl_photo.URL));
            }
            db.tbl_post.Remove(post);
            db.SaveChanges();
            TempData["Xeber"] = "Məqalə uğurla silindi";
            return RedirectToAction("Index");
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