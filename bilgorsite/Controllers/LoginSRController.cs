using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;
using bilgor.App_Classes;
using bilgorsite.Models;

namespace bilgorsite.Controllers
{
    //[Authorize]
    public class LoginSRController : Controller
    {
        Model1 db = new Model1();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LoginEnter()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginEnter(User u, string Rememberme)
        {
            bool data = Membership.ValidateUser(u.UserName, u.Password);
            if (data == true)
            {
                if (Rememberme == "on")
                {
                    FormsAuthentication.RedirectFromLoginPage(u.UserName, true);
                }
                else
                    FormsAuthentication.RedirectFromLoginPage(u.UserName, false);
                //return RedirectToAction("Index", "Home");
            }
            TempData["Log"] = "Şifrə və ya Login yanlışdır";
            return RedirectToAction("Index","Home");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult RememberMe()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RememberMe(string email)
        {
            var mail = db.aspnet_Membership.Where(x => x.Email == email).SingleOrDefault();
            if (mail != null)
            {
                Random rnd = new Random();
                int yenisifre = rnd.Next();

                aspnet_Membership user = new aspnet_Membership();
                user.Password = Crypto.Hash(Convert.ToString(yenisifre), "MD5");
                db.SaveChanges();

                WebMail.SmtpServer = "smtp.gmail.com";
                WebMail.EnableSsl = true;
                WebMail.UserName = "sonsuzbilgiaz@gmail.com";
                WebMail.Password = "dilman99";
                WebMail.SmtpPort = 587;
                WebMail.Send(email, "Sonsuzbilgi.az İstifadəçi şifrəniz", "Şifrəniz:" + yenisifre);
                TempData["Remember"] = "Mailinizə şifrə göndərildi ...";
            }
            return RedirectToAction("Index", "Home");
        }
    }
}