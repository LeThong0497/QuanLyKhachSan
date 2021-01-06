using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;
using DAL;

namespace BUS
{
    public class ThanhToanBUS
    {
        ThanhToanDAL ttdal = new ThanhToanDAL();

        public int insertThanhToan(eThanhToan tt)
        {
            return ttdal.insertThanhToan(tt);
        }
        public string gemaHD_BymaThue(string id)
        {
            return ttdal.gemaHD_BymaThue(id);
        }
    }
}
