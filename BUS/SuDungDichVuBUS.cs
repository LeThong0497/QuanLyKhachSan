using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;
using DAL;

namespace BUS
{
    public class SuDungDichVuBUS
    {
        SuDungDichVuDAL sddvdal = new SuDungDichVuDAL();

        public int InsertSDDV(eSuDungDichVu p)
        {
            return sddvdal.insertCTDV(p);
        }

        public List<eSuDungDichVu> getctdv(string mathue)
        {
            return sddvdal.getctdv(mathue);
        }

        public int updateCTDV(eSuDungDichVu update)
        {
           return  sddvdal.updateCTDV(update);
        }
    }
}
