using bilgorsite.Models;
using bilgorsite.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace bilgorsite.Controllers
{
    public class VideosController : Controller
    {
        Model1 db = new Model1();
        // GET: Videos
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult VideoPage(int? page = 1)
        {
            VideoVM VM = new VideoVM();
            VM.videos = (IPagedList<tbl_video>)db.tbl_video.OrderByDescending(x => x.VideoId).ToPagedList((int)page, 8);
            return View(VM);
        }
    }
}