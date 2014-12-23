using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using MVCForum.Data.Context;
using MVCForum.Domain.DomainModel;
using MVCForum.Domain.Interfaces;
using MVCForum.Domain.Interfaces.Repositories;

namespace MVCForum.Data.Repositories
{
    public partial class WaterResultRepository : IWaterResultRepository
    {
        private readonly MVCForumContext _context;

        public WaterResultRepository(IMVCForumContext context)
        {
            _context = context as MVCForumContext;
        }

        public IList<WaterResult> GetAll()
        {
            return _context.WaterResult.ToList();
        }

        public IList<WaterResult> GetByUser(MembershipUser user)
        {
          return _context.WaterResult
                .Where(x => x.User.Id == user.Id)
                .ToList();
        }

        public WaterResult Add(WaterResult result)
        {
          return _context.WaterResult.Add(result);
        }

        public WaterResult Get(Guid id)
        {
          return _context.WaterResult.FirstOrDefault(wr => wr.Id == id);
        }

        public void Update(WaterResult item)
        {
            // Check there's not an object with same identifier already in context
            if (_context.WaterResult.Local.Select(x => x.Id == item.Id).Any())
            {
                throw new ApplicationException("Object already exists in context - you do not need to call Update. Save occurs on Commit");
            }
            _context.Entry(item).State = EntityState.Modified;  
        }

        public void Delete(WaterResult result)
        {
          _context.WaterResult.Remove(result);
        }
    }
}
