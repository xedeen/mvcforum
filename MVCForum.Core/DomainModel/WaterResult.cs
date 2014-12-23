using System;
using System.Collections.Generic;
using MVCForum.Utilities;

namespace MVCForum.Domain.DomainModel
{
    public partial class WaterResult : Entity
    {
      public WaterResult()
      {
        Id = GuidComb.GenerateComb();
        Date = DateTime.Now;
      }

      public Guid Id { get; set; }
      public MembershipUser User { get; set; }
      public DateTime Date { get; set; }
      public int Hot { get; set; }
      public int Cold { get; set; }
    }
}
