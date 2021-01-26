using bilgorsite.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace bilgorsite.ViewModel
{
    public class KitabVM
    {
        public IPagedList<tbl_book> books { get; set; }
        public tbl_book bookSingle { get; set; }
        public List<tbl_bookCategory> categories { get; set; }
        public List<tbl_post> posts { get; set; }
        public int sortBy { get; set; }
        public string searchTerm { get; set; }
    }
}