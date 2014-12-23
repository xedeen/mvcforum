using System.Data.Entity.ModelConfiguration;
using MVCForum.Domain.DomainModel;

namespace MVCForum.Data.Mapping
{
  public class WaterResultMapping : EntityTypeConfiguration<WaterResult>
  {
    public WaterResultMapping()
    {
      HasKey(x => x.Id);

      HasRequired(x => x.User).WithMany(x => x.WaterResults).Map(x => x.MapKey("MembershipUser_Id"));

    }
  }
}
