using bilgorsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using bilgorsite.ViewModel;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace bilgorsite.Controllers
{
    public class BooksController : Controller
    {
        Model1 db = new Model1();
        // GET: Books
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Kitablar(int id,int page = 1)
        {
            KitabVM VM = new KitabVM();
            VM.categories = db.tbl_bookCategory.ToList();
            VM.books = (IPagedList<tbl_book>)db.tbl_book.Where(x => x.BookCategoryId == id).OrderByDescending(x=>x.BookCategoryId).ToPagedList(1, 6);
            return View("BookPage", VM);
        }
        public PartialViewResult BookList()
        {
            var data = db.tbl_book.OrderByDescending(x => x.BookId).Take(8).ToList();
            return PartialView(data);
        }
        [Route("Books/{title}-{id:int}")]
        public ActionResult BookDetail(int id)
        {
            KitabVM VM = new KitabVM();
            VM.bookSingle = db.tbl_book.SingleOrDefault(x => x.BookId == id);
            VM.categories = db.tbl_bookCategory.ToList();
            return View(VM);
        }
        public PartialViewResult RelatedCategory(int id)
        {
            PostVM VM = new PostVM();
            VM.books = db.tbl_book.Where(x => x.BookCategoryId == id).Take(3).ToList();
            return PartialView(VM);
        }
 
        public ActionResult DownloadFile(int? id)
        {
            var uploads = (from u in db.tbl_book
                           where u.BookId == id
                           select u.Fileurl).FirstOrDefault();
            string filename = "File.pdf";
            string filepath = AppDomain.CurrentDomain.BaseDirectory + uploads;
            byte[] filedata = System.IO.File.ReadAllBytes(filepath);
            string contentType = MimeMapping.GetMimeMapping(filepath);

            var cd = new System.Net.Mime.ContentDisposition
            {
                FileName = filename,
                Inline = true,
            };

            Response.AppendHeader("Content-Disposition", cd.ToString());

            return File(filedata, contentType);
        }
        public ActionResult BookPage(string searchTerm, int? id, int? sortBy,int? page=1)
        {
            sortBy = sortBy.HasValue ? sortBy : 1;
            KitabVM VM = new KitabVM();
            VM.books = (IPagedList<tbl_book>)filterBook(searchTerm, id, sortBy).ToPagedList((int)page,6);
            VM.categories = db.tbl_bookCategory .ToList();
            VM.posts = db.tbl_post.ToList();
            VM.sortBy = sortBy.Value;
            VM.searchTerm = searchTerm;
            return View(VM);
        }

        
        public ActionResult AllSearch(string option,string search)
        {
            if (option == "Postlar")
            {
                return View(db.tbl_post.Where(x => x.Title == search || search == null).ToList());
            } else if (option == "Videolar")
            {
                return View(db.tbl_video.Where(x => x.Title == search || search == null).ToList());
            } else if (option == "Kitablar")
            {
                return View(db.tbl_book.Where(x => x.Name == search || search == null).ToList());
            }
            return View();
        }
        public List<tbl_book> filterBook(string searchTerm,int? id,int? sortBy)
        {
            var book = db.tbl_book.AsQueryable();
            if (id.HasValue)
            {
                book = db.tbl_book.Where(x => x.BookCategoryId == id);
            }
            if (!string.IsNullOrEmpty(searchTerm))
            {
                book = book.Where(x => x.Name.Contains(searchTerm));
            }
            if (sortBy.HasValue)
            {
                switch (sortBy)
                {
                    case 1:
                        book = book.OrderBy(x => x.Name);
                        break;
                    case 2:
                        book = book.OrderByDescending(x => x.BookId);
                        break;
                    case 3:
                        book = book.OrderByDescending(x => x.BookId);
                        break;
                    default:
                        book = book.OrderByDescending(x => x.BookId);
                        break;
                }
            }
            return book.ToList();
        }

        public PartialViewResult PopularPost()
        {
            KitabVM VM = new KitabVM();
            VM.posts = db.tbl_post.OrderByDescending(x => x.Views).Take(3).ToList();
            return PartialView(VM);
        }
    }
}