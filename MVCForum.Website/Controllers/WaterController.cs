using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MVCForum.Domain.Constants;
using MVCForum.Domain.DomainModel;
using MVCForum.Domain.Interfaces.Services;
using MVCForum.Domain.Interfaces.UnitOfWork;
using MVCForum.Website.ViewModels;
using MembershipUser = MVCForum.Domain.DomainModel.MembershipUser;

namespace MVCForum.Website.Controllers
{
    public partial class WaterController : BaseController
    {
      private readonly IWaterService _waterService;
      private MembershipUser LoggedOnUser;
      private MembershipRole UsersRole;

      public WaterController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager,
        IMembershipService membershipService, ILocalizationService localizationService,
        IRoleService roleService, ISettingsService settingsService,
        IWaterService waterService)
        : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
      {
        _waterService = waterService;
        LoggedOnUser = UserIsAuthenticated ? MembershipService.GetUser(Username) : null;
      } 
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
        [Authorize]
        public ActionResult SetWaterResults(int cold,int hot)
        {
          if (LoggedOnUser == null)
          {
            throw new Exception(LocalizationService.GetResourceString("Errors.NoAccess"));
          }

          // Quick check to see if user is locked out, when logged in
          if (LoggedOnUser.IsLockedOut | !LoggedOnUser.IsApproved)
          {
            FormsAuthentication.SignOut();
            throw new Exception(LocalizationService.GetResourceString("Errors.NoAccess"));
          }

          using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
          {
            _waterService.Add(new WaterResult
            {
              Cold = cold,
              Hot = hot,
              User = LoggedOnUser
            });

            try
            {
              unitOfWork.Commit();
            }

            catch (Exception ex)
            {
              unitOfWork.Rollback();
              LoggingService.Error(ex);
              throw new Exception(LocalizationService.GetResourceString("Errors.GenericMessage"));
            }
            return Content("success");
          }
        }
    }
}
