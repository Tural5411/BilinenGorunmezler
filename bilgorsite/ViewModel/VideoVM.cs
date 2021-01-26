using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bilgorsite.Models;
using PagedList;

namespace bilgorsite.ViewModel
{
    public class VideoVM
    {
        public IPagedList<tbl_video> videos { get; set; }
        public List<tbl_video> videoList { get; set; }
    }
}