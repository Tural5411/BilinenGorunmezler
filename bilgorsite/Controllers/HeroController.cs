using bilgorsite.Models;
using bilgorsite.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bilgorsite.Controllers
{
    public class HeroController : Controller
    {
        Model1 db = new Model1();
        // GET: Hero
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult Heros()
        {
            VideoVM VM = new VideoVM();
            VM.videoList = db.tbl_video.OrderByDescending(x => x.Title).Take(4).ToList();
            return PartialView(VM);
        }
        public PartialViewResult SingleHero()
        {
            VideoVM VM = new VideoVM();
            VM.videoList=db.tbl_video.OrderByDescending(x => x.VideoId).Take(1).ToList();
            return PartialView(VM);
        }
    }
}