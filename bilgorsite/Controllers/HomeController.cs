using bilgorsite.Models;
using bilgorsite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace bilgorsite.Controllers
{
    public class HomeController : Controller
    {
        Model1 db = new Model1();
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult Footer()
        {
            PostVM VM = new PostVM();
            VM.categories = db.tbl_category.Take(6).ToList();
            VM.postList = db.tbl_post.Take(3).ToList();
            return PartialView(VM);
        }
        public ActionResult Search(string searchTerm, int? sortBy)
        {
            Model1 db = new Model1();
            sortBy = sortBy.HasValue ? sortBy : 1;
            PostVM VM = new PostVM();
            VM.postList = db.tbl_post.ToList();
            VM.books = db.tbl_book.ToList();
            VM.sortBy = sortBy.Value;
            VM.searchTerm = searchTerm;
            
                List<tbl_post> posts = db.tbl_post.ToList();
                List<tbl_video> videos = db.tbl_video.ToList();
                List<tbl_book> books = db.tbl_book.ToList();

                var post = db.tbl_post.AsQueryable();
                var video = db.tbl_video.AsQueryable();
                var book = db.tbl_book.AsQueryable();

                if (sortBy.HasValue)
                {
                    switch (sortBy)
                    {
                        case 1:
                            book = book.Where(x => x.Name.Contains(searchTerm));
                                break;
                        case 2:
                            video = video.Where(x => x.Title.Contains(searchTerm));
                            break;
                        case 3:
                            post = post.Where(x => x.Title.Contains(searchTerm));
                            break;
                        default:
                            break;
                    }
                }
            return View(VM);
        }
        public ActionResult About()
        {
            PostVM VM = new PostVM();
            VM.books = db.tbl_book.ToList();
            VM.postList = db.tbl_post.ToList();
            VM.videos = db.tbl_video.ToList();
            VM.users = db.aspnet_Users.OrderByDescending(x=>x.PhotoId).Take(3).ToList();


            return View(VM);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpPost]
        public ActionResult Contact(string ad = null, string email = null, string baslig = null, string metn = null)
        {
            if (ad != null && email != null && metn != null)
            {
                WebMail.SmtpServer = "smtp.gmail.com";
                WebMail.EnableSsl = true;
                WebMail.UserName = "sonsuzbilgiaz@gmail.com";
                WebMail.Password = "dilman99";
                WebMail.SmtpPort = 587;
                WebMail.Send("sonsuzbilgiaz@gmail.com", baslig, email + "-" + metn);
                TempData["elaqe"] = "Mesajiniz ugurla gonderildi";
            }
            else
            {
                TempData["elaqe"] = "Xəta baş verdi ... Təkrar yoxlayın";

            }
            return View();
        }
    }
}