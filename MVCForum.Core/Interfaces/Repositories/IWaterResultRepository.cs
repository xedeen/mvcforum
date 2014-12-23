using System;
using System.Collections.Generic;
using MVCForum.Domain.DomainModel;

namespace MVCForum.Domain.Interfaces.Repositories
{
  public partial interface IWaterResultRepository
    {
        IList<WaterResult> GetAll();
        IList<WaterResult> GetByUser(MembershipUser user);
        WaterResult Add(WaterResult result);
        void Delete(WaterResult result);
        WaterResult Get(Guid id);
        void Update(WaterResult item);
    }
}
