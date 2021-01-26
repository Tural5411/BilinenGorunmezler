using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace bilgorsite.Controllers
{
    [Authorize]
    public class RoleController : Controller
    {
        
        // GET: Role
        [Authorize(Roles="Admin")]
        public ActionResult Index()
        {
            List<string> rols = Roles.GetAllRoles().ToList();
            return View(rols);
        }
        [Authorize(Roles = "Admin")]
        public ActionResult AddRole()
        {
            return View();
        }
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult AddRole(string roleName)
        {
            Roles.CreateRole(roleName);

            return RedirectToAction("Index");
        }
    }
}