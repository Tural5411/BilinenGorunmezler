using bilgorsite.Models;
using bilgorsite.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bilgorsite.Areas.AdminPanel.Controllers
{
    [Authorize]
    public class VideoController : Controller
    {
        Model1 db = new Model1();
        // GET: AdminPanel/Video
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        public ActionResult Index()
        {
            var data = db.tbl_video.ToList();
            return View(data);
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        public ActionResult Create()
        {
            return View();
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        [HttpPost]
        public ActionResult Create(string videourl,string name,HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                tbl_video video = new tbl_video();
                video.Title = name;
                video.VideoURL = videourl;
                if (image != null)
                {
                    tbl_photo photo = new tbl_photo();
                    string imageName = Guid.NewGuid().ToString().Replace("-", "");
                    string imageExtension = Path.GetExtension(Request.Files[0].FileName);
                    string imageWay = "/Upload/images/" + imageName + imageExtension;
                    Request.Files[0].SaveAs(Server.MapPath(imageWay));
                    photo.URL = imageWay;
                    var copyImage = db.tbl_photo.Add(photo);
                    video.PhotoId = copyImage.PhotoId;
                }
                db.tbl_video.Add(video);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        public ActionResult Edit(int? id)
        {
            var currentVideo = db.tbl_video.Find(id);
            if (id == null && currentVideo==null)
            {
                HttpNotFound();
            }
            return View(currentVideo);
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        [HttpPost]
        public ActionResult Edit(int? id, string videourl,string name,HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                tbl_photo photo = new tbl_photo();
                var currentVideo = db.tbl_video.Find(id);
                if (image != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(currentVideo.tbl_photo.URL)))
                    {
                        System.IO.File.Delete(Server.MapPath(currentVideo.tbl_photo.URL));
                    }
                    string pictureName = Guid.NewGuid().ToString().Replace("-", "");
                    string pictureExtension = Path.GetExtension(Request.Files[0].FileName);
                    string pictureWay = "/Upload/images/" + pictureName + pictureExtension;
                    Request.Files[0].SaveAs(Server.MapPath(pictureWay));
                    photo.URL = pictureWay;
                    var imagecopy = db.tbl_photo.Add(photo);
                    currentVideo.PhotoId = imagecopy.PhotoId;
                    db.SaveChanges();
                }
                currentVideo.Title = name;
                currentVideo.VideoURL = videourl;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            tbl_video video = db.tbl_video.Find(id);
            if (System.IO.File.Exists(Server.MapPath(video.tbl_photo.URL)))
            {
                System.IO.File.Delete(Server.MapPath(video.tbl_photo.URL));
            }
            db.tbl_video.Remove(video);
            db.SaveChanges();
            TempData["Xeber"] = "Video uğurla silindi";
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