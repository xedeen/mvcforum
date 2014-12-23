using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCForum.Domain.Constants;
using MVCForum.Domain.DomainModel;
using MVCForum.Domain.Interfaces.Services;
using MVCForum.Domain.Interfaces.UnitOfWork;
using MVCForum.Website.ViewModels;

namespace MVCForum.Website.Controllers
{
    public partial class WaterController : BaseController
    {
      private readonly IWaterService _waterService;
      private MembershipUser LoggedOnUser;
      private MembershipRole UsersRole;
      
      public WaterController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, ILocalizationService localizationService, 
            IRoleService roleService, ISettingsService settingsService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            
        }

        /// <summary>
        /// Lists out all languages in a partial view. For example, used to display list of 
        /// available languages along the top of every page
        /// </summary>
        /// <returns></returns>
        [ChildActionOnly]
        public ActionResult Index()
        {
          var viewModel = new WaterViewModel
            {
              LatestMonthCold = 1212,
              LatestMonthHot = 4561,
              Cold = 1212,
              Hot = 4561,
              LatestMonthTime = DateTime.Now.AddMonths(-1),
            };
            return PartialView("_WaterBlock", viewModel);
        }

        /// <summary>
        /// Change the current language (typically called from each language link generated in this controller's index method)
        /// </summary>
        /// <param name="lang"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SetWaterResults(int cold,int hot)
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
              MembershipService.Get
               /* var language = LocalizationService.Get(lang);
                LocalizationService.CurrentLanguage = language;

                // The current language is stored in a cookie
                var cookie = new HttpCookie(AppConstants.LanguageIdCookieName)
                {
                    HttpOnly = false,
                    Value = language.Id.ToString(),
                    Expires = DateTime.UtcNow.AddYears(1)
                };

                Response.Cookies.Add(cookie);

                //TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                //{
                //    Message = LocalizationService.GetResourceString("Language.Changed"),
                //    MessageType = GenericMessages.success
                //};
              */
                return Content("success"); 
            }
        }
    }
}
