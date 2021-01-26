using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bilgorsite.Models;

namespace bilgorsite.Areas.AdminPanel.AreaView
{
    public class BookVM
    {
        public string Name { get; set; }
        public string Context { get; set; }
        public int Page { get; set; }
    }
}