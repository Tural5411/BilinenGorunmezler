using bilgorsite.Areas.AdminPanel.AreaView;
using bilgorsite.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bilgorsite.Areas.AdminPanel.Controllers
{
    [Authorize]
    public class BookController : Controller
    {
        Model1 db = new Model1();
        // GET: AdminPanel/Book
        [Authorize(Roles =("Admin,Moderator,Yazıçı"))]
        public ActionResult Index()
        {
            var data = db.tbl_book.OrderByDescending(x => x.BookId).ToList();
            return View(data.ToList());
            //var items = GetFile();
            //return View(items);
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        [HttpPost]
        public ActionResult Index(HttpPostedFileBase file)
        {
            if(file!=null && file.ContentLength > 0)
            {
                try
                {
                    string path = Path.Combine(Server.MapPath("~/Upload/book/"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    ViewBag.Message = "Succes File Upload";
                }
                catch (Exception ex)
                {
                    ViewBag.Message = "Error:" + ex.Message.ToString();
                }
            }
            else
            {
                ViewBag.Message = "eRROR File Upload";

            }
            var items = GetFile();
            return View(items);
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        public FileResult Download(string fileName)
        {
            var FileVirtualPath = "~/Upload/book/" + fileName;
            return File(FileVirtualPath, "application/force- download", Path.GetFileName(FileVirtualPath));
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.WriterId = new SelectList(db.tbl_Writer,"WriterId","FullName");
            return View();
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        [HttpPost]
        public ActionResult Create(tbl_book book,string Name,int Page,string Context,HttpPostedFileBase pdf,HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                //tbl_book book = new tbl_book();
                tbl_photo photo = new tbl_photo();
                book.Name = Name;
                book.Page = Page;
                book.Context = Context;
                if (pdf != null && pdf.ContentLength > 0)
                {
                    string bookName = Guid.NewGuid().ToString().Replace("-", "");
                    string bookExtension = Path.GetExtension(Request.Files[0].FileName);
                    string bookWay = "/Upload/book/" + bookName + bookExtension;
                    Request.Files[0].SaveAs(Server.MapPath(bookWay));
                    book.Fileurl = bookWay;
                    db.SaveChanges();
                }
             
                if (image != null)
                {
                    string imageName = Guid.NewGuid().ToString().Replace("-", "");
                    string imageExtension = Path.GetExtension(Request.Files[0].FileName);
                    string imageWay = "/Upload/book/" + imageName + imageExtension;
                    Request.Files[0].SaveAs(Server.MapPath(imageWay));
                    photo.URL = imageWay;
                    var copyImage = db.tbl_photo.Add(photo);
                    book.PhotoId = copyImage.PhotoId;
                }
                db.tbl_book.Add(book);
                db.SaveChanges();

            }
            return RedirectToAction("Index");
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var selectedBook = db.tbl_book.Find(id);

            //List<SelectListItem> deyerler = (from i in db.tbl_Writer.ToList()
            //                                 select new SelectListItem
            //                                 {
            //                                     Text = i.FullName,
            //                                     Value = i.WriterId.ToString()
            //                                 }).ToList();
            ViewBag.WriterId = new SelectList(db.tbl_Writer, "WriterId", "FullName", selectedBook.WriterId);
            //ViewBag.dyr = deyerler;
            return View("Edit",selectedBook);
        }
        [Authorize(Roles = ("Admin,Moderator,Yazıçı"))]

        [HttpPost]
        public ActionResult Edit(tbl_book book,int? writerId,int id,string Name, int? Page, string Context, HttpPostedFileBase pdf, HttpPostedFileBase image)
        {
            
            tbl_photo photo = new tbl_photo();
            var selectedBook = db.tbl_book.SingleOrDefault(x => x.BookId == id);
            var writer = db.tbl_Writer.FirstOrDefault(x => x.WriterId == writerId).WriterId;
            selectedBook.tbl_Writer.WriterId = writer;
            if (image != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(selectedBook.tbl_photo.URL)))
                    {
                        System.IO.File.Delete(Server.MapPath(selectedBook.tbl_photo.URL));
                    }
                    string pictureName = Guid.NewGuid().ToString().Replace("-", "");
                    string pictureExtension = Path.GetExtension(Request.Files[0].FileName);
                    string pictureWay = "/Upload/images/" + pictureName + pictureExtension;
                    Request.Files[0].SaveAs(Server.MapPath(pictureWay));
                    photo.URL = pictureWay;
                    var imagecopy = db.tbl_photo.Add(photo);
                    selectedBook.PhotoId = imagecopy.PhotoId;
                    db.SaveChanges();
                }
                if (pdf != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(selectedBook.Fileurl)))
                    {
                        System.IO.File.Delete(Server.MapPath(selectedBook.Fileurl));
                    }
                    string fileName = Guid.NewGuid().ToString().Replace("-", "");
                    string fileExtension = Path.GetExtension(Request.Files[0].FileName);
                    string fileWay = "/Upload/book/" + fileName + fileExtension;
                    Request.Files[0].SaveAs(Server.MapPath(fileWay));
                    selectedBook.Fileurl = fileWay;
                    db.SaveChanges();
                }
                selectedBook.Name = Name;
                selectedBook.Page = Page;
                selectedBook.Context = Context;
            db.Entry(book).State = EntityState.Detached;
            db.SaveChanges();


            return RedirectToAction("Index");
        }
        private List<string> GetFile()
        {
            var dir = new System.IO.DirectoryInfo(Server.MapPath("~/Upload/book"));
            System.IO.FileInfo[] filenames = dir.GetFiles("*.*");

            List<string> items = new List<string>();
            foreach (var file in filenames)
            {
                items.Add(file.Name);
            }
            return items;   
        }   
        //public FileResult Download(string fileName)
        //{
        //    string fullPath = Path.Combine(Server.MapPath("~/Upload/book"), fileName);
        //    byte[] fileBytes = System.IO.File.ReadAllBytes(fullPath);
        //    return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        //}
        public ActionResult Delete(int? id)
        {
            var selectedBook = db.tbl_book.Find(id);
            if (id != null)
            {
                if (System.IO.File.Exists(Server.MapPath(selectedBook.tbl_photo.URL)))
                {
                    System.IO.File.Delete(Server.MapPath(selectedBook.tbl_photo.URL));
                }
                if (System.IO.File.Exists(Server.MapPath(selectedBook.Fileurl)))
                {
                    System.IO.File.Delete(Server.MapPath(selectedBook.Fileurl));
                }
                db.tbl_book.Remove(selectedBook);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }
}