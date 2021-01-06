using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;

namespace DAL
{
    public class SuDungDichVuDAL
    {
        dbQLKhachSanDataContext db = new dbQLKhachSanDataContext();

        public int updateCTDV(eSuDungDichVu update)
        {
            IQueryable<SuDungDichVu> p = db.SuDungDichVus.Where(x => x.maThue.Equals(update.MaThue) && x.maDV.Equals(update.MaDV));
            p.First().soLuong = update.SoLuong;
            db.SubmitChanges();
            return 2;
        }
        public int insertCTDV(eSuDungDichVu ctdvnew)
        {
            SuDungDichVu ctdvtemp = new SuDungDichVu();
            ctdvtemp.maThue = ctdvnew.MaThue;
            ctdvtemp.maDV = ctdvnew.MaDV;            
            ctdvtemp.soLuong = ctdvnew.SoLuong;
            ctdvtemp.ngaySuDung = ctdvnew.NgaySD;
            ctdvtemp.gioSuDung = ctdvnew.GioSD;
            db.SuDungDichVus.InsertOnSubmit(ctdvtemp);
            db.SubmitChanges();
            return 1;
        }

        public List<eSuDungDichVu> getctdv(string mathue)
        {
            var listdv = db.SuDungDichVus.Where(x=>x.maThue.Trim().Equals(mathue)).ToList();
            List<eSuDungDichVu> ls = new List<eSuDungDichVu>();
            foreach (SuDungDichVu item in listdv)
            {
                eSuDungDichVu dv = new eSuDungDichVu();
                dv.MaDV = item.maDV.Trim();
                dv.MaThue = item.maThue.Trim();
                dv.SoLuong = Convert.ToInt32(item.soLuong);
                dv.NgaySD = item.ngaySuDung;
                dv.GioSD = item.gioSuDung;
                ls.Add(dv);
            }
            return ls;
        }

       

    }
}
