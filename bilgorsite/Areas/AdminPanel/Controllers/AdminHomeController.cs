using bilgorsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace bilgorsite.Areas.AdminPanel.Controllers
{
    [Authorize]
    public class AdminHomeController : Controller
    {
        Model1 db = new Model1();
        // GET: AdminPanel/AdminHome
        [Authorize(Roles ="Admin,Moderator,Yazıçı")]
        public ActionResult Index()
        {
            var users = Membership.GetAllUsers();
            ViewBag.count= users.Count.ToString();
            ViewBag.users = Membership.GetNumberOfUsersOnline();
            ViewBag.bookCount = db.tbl_book.Count();
            ViewBag.postCount = db.tbl_post.Count();
            ViewBag.videoCount = db.tbl_video.Count();
            ViewBag.posts = db.tbl_post.OrderByDescending(x => x.PostId).Take(5).ToList();
            ViewBag.books = db.tbl_book.OrderByDescending(x => x.BookId).Take(5).ToList();
            ViewBag.videos = db.tbl_video.OrderByDescending(x => x.VideoId).Take(5).ToList();
            return View();
        }
    }
}