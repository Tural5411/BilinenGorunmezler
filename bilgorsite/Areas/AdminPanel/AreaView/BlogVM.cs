using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bilgorsite.Models;
using PagedList;

namespace bilgorsite.Areas.AdminPanel.AreaView
{
    public class BlogVM
    {
        public aspnet_Membership singleMember { get; set; }
        public IPagedList<tbl_post> posts { get; set; }
        public tbl_post singlePost { get; set; }
    }
}