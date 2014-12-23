using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using MVCForum.Domain;
using MVCForum.Domain.Constants;
using MVCForum.Domain.DomainModel;
using MVCForum.Domain.Interfaces.Repositories;
using MVCForum.Domain.Interfaces.Services;
using MVCForum.Utilities;

namespace MVCForum.Services
{
  public partial class WaterService : IWaterService
  {
    private readonly IWaterResultRepository _waterResultRepository;

    public WaterService(IWaterResultRepository waterResultRepository)
    {
      _waterResultRepository = waterResultRepository;
    }

    public IList<WaterResult> GetAll()
    {
      return _waterResultRepository.GetAll();
    }

    public void Delete(WaterResult result)
    {
      _waterResultRepository.Delete(result);
    }

    public IList<WaterResult> GetByUser(MembershipUser user)
    {
      return _waterResultRepository.GetByUser(user);
    }

    /// <summary>
    /// Add a new category notification
    /// </summary>
    /// <param name="category"></param>
    public void Add(WaterResult category)
    {
      _waterResultRepository.Add(category);
    }
  }
}

