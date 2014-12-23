using System;
using System.Collections.Generic;
using System.Globalization;
using MVCForum.Domain.DomainModel;

namespace MVCForum.Domain.Interfaces.Services
{
  public partial interface IWaterService
  {
    IList<WaterResult> GetAll();
    void Delete(WaterResult notification);
    IList<WaterResult> GetByUser(MembershipUser user);
    void Add(WaterResult category);
  }
}
