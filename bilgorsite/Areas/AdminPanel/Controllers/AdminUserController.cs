using bilgor.App_Classes;
using bilgorsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;

namespace bilgorsite.Areas.AdminPanel.Controllers
{
    [Authorize]
    public class AdminUserController : Controller
    {
        [Authorize(Roles="Admin")]
        // GET: AdminPanel/AdminUser
        public ActionResult Index()
        {
            MembershipUserCollection users = Membership.GetAllUsers();
            return View(users);
        }

        [AllowAnonymous]
        public ActionResult NewUser()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult NewUser(User u)
        {
            MembershipCreateStatus status;
            Membership.CreateUser(u.UserName, u.Password, u.Email, u.SecretQuestion, u.SecretAnswer, true, out status);
            string message = "";

            switch (status)
            {
                case MembershipCreateStatus.Success:
                    break;
                case MembershipCreateStatus.InvalidUserName:
                    
                    message += "Xətalı Login";
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    message += "Xətalı Şifrə";
                    break;
                case MembershipCreateStatus.InvalidQuestion:
                    message += "Xətalı Sual";
                    break;
                case MembershipCreateStatus.InvalidAnswer:
                    message += "Xətalı Cavab";
                    break;
                case MembershipCreateStatus.InvalidEmail:
                    message += "Xətalı Mail";
                    break;
                case MembershipCreateStatus.DuplicateUserName:
                    message += " İstifadə olunmuş istifadəçi logini";
                    break;
                case MembershipCreateStatus.DuplicateEmail:
                    message += "Bu Mail İstifadə olunub";
                    break;
                case MembershipCreateStatus.UserRejected:
                    message += "İstifadəçi bloklanıb";
                    break;
                case MembershipCreateStatus.InvalidProviderUserKey:
                    break;
                case MembershipCreateStatus.DuplicateProviderUserKey:
                    message += " İstifadə olunmuş istifadəçi açarı";
                    break;
                case MembershipCreateStatus.ProviderError:
                    break;
                default:
                    break;
            }
            ViewBag.Message = message;
            if (status == MembershipCreateStatus.Success)
            {
                return RedirectToAction("Index");
            }
            else
                ViewBag.Message = message;

            return View();
        }

        [Authorize(Roles="Admin")]
        public ActionResult AddUserRole()
        {
            ViewBag.RoleList =Roles.GetAllRoles().ToList();
            ViewBag.UserList = Membership.GetAllUsers();
            return View();
        }
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult AddUserRole(string UserName,string RolName)
        {
            Roles.AddUserToRole(UserName, RolName);
            return RedirectToAction("Index");
        }
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public string UserRoles(string UserName)
        {
            List<string> rols= Roles.GetRolesForUser(UserName).ToList();
            string rol = "";
            foreach (var r in rols)
            {
                rol += r + "-";
            }
            rol = rol.Remove(rol.Length - 1, 1);
            return rol;
        }
        [AllowAnonymous]
        public ActionResult ResetPassword()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult ResetPassword(string newpassword,string oldpassword)
        {
            MembershipUser user = Membership.GetUser(User.Identity.Name);
            if (newpassword != null)
            {
                user.ChangePassword(oldpassword, newpassword);
                TempData["Sifre"] = "Şifrə dəyişildi";
            }
            else
            {
                TempData["Sifre"] = "Xəta baş verdi.Şifrə dəyişilmədi";
            }
            return View();
        }
        [Authorize(Roles="Admin")]
        public ActionResult DeleteUser(string name)
        {
            Model1 db = new Model1();
            Membership.DeleteUser(name);
           
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}