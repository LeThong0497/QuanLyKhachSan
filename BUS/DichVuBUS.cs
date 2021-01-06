using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;
using DAL;

namespace BUS
{
    public class DichVuBUS
    {
        DichVuDAL dvdal = new DichVuDAL();
        public List<eDichVu> getalldv()
        {
            return dvdal.getdv();
        }

        public int InsertDichVu(eDichVu p)
        {
            return dvdal.insertDichVu(p);
        }

        public void SuaDV(eDichVu p)
        {

            dvdal.updateDichVu(p);
        }

        public bool XoaDV(string maDV)
        {
            return dvdal.deleteDichVu(maDV);
        }

        public eDichVu tangma()
        {
            return dvdal.maTangTuDong();
        }

        public List<eDichVu> getallMaDV(string s)
        {
            return dvdal.getAllma(s);
        }

        public List<eDichVu> getallTenDV(string s)
        {
            return dvdal.getAllten(s);
        }

        public string getTenDV_byID(string id)
        {
            return dvdal.getTenDV_byID(id);
        }

        public double getDonGia_byID(string id)
        {
            return dvdal.getDonGia_byID(id);
        }       
    }
}
