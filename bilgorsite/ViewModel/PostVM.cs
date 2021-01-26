using bilgorsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace bilgorsite.ViewModel
{
    public class PostVM
    {
        public IPagedList<tbl_post> posts { get; set; }
        public List<tbl_post> postList { get; set; }
        public tbl_post postSingle { get; set; }
        public List<tbl_category> categories { get; set; }
        public tbl_category categorySingle { get; set; }
        public List<tbl_book> books { get; set; }
        public List<tbl_video> videos { get; set; }
        public List<aspnet_Users> users { get; set; }
        public int sortBy { get; set; }
        public string searchTerm { get; set; }
    }
}