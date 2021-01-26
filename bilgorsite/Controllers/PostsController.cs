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
    public class PostsController : Controller
    {
        Model1 db = new Model1();
        // GET: Posts
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult Postlar(Guid id,int page =1)
        {
            PostVM VM = new PostVM();
            VM.posts = db.tbl_post.Where(x=>x.aspnet_Users.UserId==id).OrderByDescending(x => x.PostId).ToPagedList(1, 6);
            VM.categories = db.tbl_category.ToList();
            VM.books = db.tbl_book.Take(3).ToList();
            return View("PostPage", VM);
        }
        //[Route("Posts/{Name}-{id:int}")]
        //public ActionResult Kateqoriyalar(int id)
        //{
        //    PostVM VM = new PostVM();
        //    VM.posts = db.tbl_post.Where(x => x.CategoryId == id).OrderByDescending(x => x.PostId).ToPagedList(1, 6);
        //    VM.categories = db.tbl_category.ToList();
        //    VM.books = db.tbl_book.Take(3).ToList();
        //    return View("PostPage", VM);
        //}
        public PartialViewResult PostList()
        {
            ViewBag.last = db.tbl_post.OrderByDescending(x => x.PostId).Take(1).FirstOrDefault();
            PostVM VM = new PostVM();
            VM.postList= db.tbl_post.OrderByDescending(x => x.Views).Take(6).ToList();
            return PartialView(VM);
        }
        [Route("Posts/{title}-{id:int}")]
        public ActionResult PostDetail(int id)
        {
            PostVM VM = new PostVM();
            VM.postSingle = db.tbl_post.SingleOrDefault(x => x.PostId == id);
            VM.categories = db.tbl_category.ToList();
            Baxildi(id);
            return View(VM);
        }
        public void Baxildi(int id)
        {
            tbl_post pst = db.tbl_post.FirstOrDefault(x => x.PostId == id);
            pst.Views++;
            db.SaveChanges();
        }
        public PartialViewResult RelatedCategory(int id)
        {
            PostVM VM = new PostVM();
            VM.postList = db.tbl_post.Where(x=>x.CategoryId==id).Take(6).ToList();
            
            return PartialView(VM);
        }
        public ActionResult PostPage(string searchTerm,int? id,int? sortBy,int? page =1)
        {
            sortBy = sortBy.HasValue ? sortBy : 2;
            PostVM VM = new PostVM();
            VM.posts = (IPagedList<tbl_post>)FilterBook(searchTerm, id, sortBy).ToPagedList((int)page,6);
            VM.postSingle = db.tbl_post.SingleOrDefault(x => x.PostId == id);
            VM.categories = db.tbl_category.ToList();
            VM.books = db.tbl_book.OrderByDescending(x => x.BookId).Take(3).ToList();
            VM.sortBy = sortBy.Value;
            VM.searchTerm = searchTerm;
            return View(VM);
        }

        private List<tbl_post> FilterBook(string searchTerm, int? id, int? sortBy)
        {
            var post = db.tbl_post.AsQueryable();
            if (id.HasValue)
            {
                post = post.Where(x => x.CategoryId == id);
            }
            if (!string.IsNullOrEmpty(searchTerm))
            {
                post = post.Where(x => x.Title.Contains(searchTerm));
            }
            if (sortBy != null)
            {
                switch (sortBy)
                {
                    case 1:
                        post = post.OrderBy(x => x.Title);
                        break;
                    case 2:
                        post = post.OrderByDescending(x => x.PostId);
                        break;
                    case 3:
                        post = post.OrderByDescending(x => x.Views);
                        break;
                    default:
                        post = post.OrderByDescending(x => x.PostId);
                        break;
                }
            }
            return post.ToList();
        }
    }
}