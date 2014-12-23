using System;
using System.Collections.Generic;
using System.ComponentModel;
using MVCForum.Domain.DomainModel;

namespace MVCForum.Website.ViewModels
{
  public class WaterViewModel
  {
    public DateTime? LatestMonthTime { get; set; }
    public int? LatestMonthHot { get; set; }
    public int? LatestMonthCold { get; set; }

    [DisplayName("Холодная: ")]
    public int Cold { get; set; }

    [DisplayName("Горячая: ")]
    public int Hot { get; set; }
  }
}