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
      private readonly ICategoryService _categoryService;
      private MembershipUser LoggedOnUser;
      private MembershipRole UsersRole;

      public WaterController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager,
        IMembershipService membershipService, ILocalizationService localizationService,
        IRoleService roleService, ISettingsService settingsService,
        IWaterService waterService, ICategoryService categoryService)
        : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
      {
        _waterService = waterService;
        _categoryService = categoryService;
        LoggedOnUser = UserIsAuthenticated ? MembershipService.GetUser(Username) : null;
        UsersRole = LoggedOnUser == null ? RoleService.GetRole(AppConstants.GuestRoleName) : LoggedOnUser.Roles.FirstOrDefault();
      }

      public PartialViewResult CreateSendWaterButton()
      {
        var viewModel = new SendOrExportWaterButtonViewModel
        {
          LoggedOnUser = LoggedOnUser
        };

        if (LoggedOnUser != null)
        {
          // Add all categories to a permission set
          var allCategories = _categoryService.GetAll();
          using (UnitOfWorkManager.NewUnitOfWork())
          {
            foreach (var category in allCategories)
            {
              // Now check to see if they have access to any categories
              // if so, check they are allowed to create topics - If no to either set to false
              viewModel.UserCanSendWater = false;
              var permissionSet = RoleService.GetPermissions(category, UsersRole);
              if (permissionSet[AppConstants.PermissionUpdateWaterResult].IsTicked)
              {
                viewModel.UserCanSendWater = true;
                break;
              }
            }
          }
        }
        return PartialView(viewModel);
      }

      public PartialViewResult CreateExportWaterButton()
      {
        var viewModel = new SendOrExportWaterButtonViewModel
        {
          LoggedOnUser = LoggedOnUser
        };

        if (LoggedOnUser != null)
        {
          // Add all categories to a permission set
          var allCategories = _categoryService.GetAll();
          using (UnitOfWorkManager.NewUnitOfWork())
          {
            foreach (var category in allCategories)
            {
              // Now check to see if they have access to any categories
              // if so, check they are allowed to create topics - If no to either set to false
              viewModel.UserCanSendWater = false;
              var permissionSet = RoleService.GetPermissions(category, UsersRole);
              if (permissionSet[AppConstants.PermissionExportWaterResult].IsTicked)
              {
                viewModel.UserCanSendWater = true;
                break;
              }
            }
          }
        }
        return PartialView(viewModel);
      }


        [ChildActionOnly]
        public PartialViewResult Index()
        {
          var viewModel = new WaterViewModel();

          if (LoggedOnUser != null)
          {
            // Add all categories to a permission set
            var allCategories = _categoryService.GetAll();
            using (UnitOfWorkManager.NewUnitOfWork())
            {
              foreach (var category in allCategories)
              {
                // Now check to see if they have access to any categories
                // if so, check they are allowed to create topics - If no to either set to false
                viewModel.UserCanSendWater = false;
                var permissionSet = RoleService.GetPermissions(category, UsersRole);
                if (permissionSet[AppConstants.PermissionUpdateWaterResult].IsTicked)
                {
                  viewModel.UserCanSendWater = true;
                  break;
                }
              }
            }
          }

          if (viewModel.UserCanSendWater)
          {
            var result = _waterService.GetByUser(LoggedOnUser).OrderByDescending(x => x.Date).FirstOrDefault();
            if (null != result)
            {
              viewModel.Cold = result.Cold;
              viewModel.Hot = result.Hot;
              viewModel.LatestMonthCold = result.Cold;
              viewModel.LatestMonthHot = result.Hot;
              viewModel.LatestMonthTime = result.Date;
            }
          }
          return PartialView("WaterForm", viewModel);
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
