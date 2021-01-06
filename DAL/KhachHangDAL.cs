using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;

namespace DAL
{
    public class KhachHangDAL
    {
        dbQLKhachSanDataContext db = new dbQLKhachSanDataContext();

        public List<eKhachHang> get()
        {
            var listkh = (from x in db.KhachHangs select x).ToList();
            List<eKhachHang> ls = new List<eKhachHang>();
            foreach (KhachHang item in listkh)
            {
                eKhachHang kh = new eKhachHang();
                kh.MaKH = item.maKH.Trim();
                kh.TenKH = item.tenKh.Trim();
                kh.SoCMND = item.soCMND.Trim();
                kh.SoDT = item.soDT.Trim();
                kh.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                kh.MaDoan = item.maDoan;
                ls.Add(kh);
            }
            return ls;
        }
        public int insertKH(eKhachHang khmoi)
        {
            KhachHang khtemp = new KhachHang();
            khtemp.maKH = khmoi.MaKH;
            khtemp.soCMND = khmoi.SoCMND;
            khtemp.soDT = khmoi.SoDT;
            khtemp.tenKh = khmoi.TenKH;
            if (khmoi.MaDoan == "")
            {
                khtemp.maDoan = null;
            }
            else
            {
                khtemp.maDoan = khmoi.MaDoan;
            }
            khtemp.gioiTinh = Convert.ToByte(khmoi.GioiTinh);
            db.KhachHangs.InsertOnSubmit(khtemp);
            db.SubmitChanges();
            return 1;
        }
        public List<eKhachHang> getcmnd(string s)
        {
            //var listkh = (from x in db.KhachHangs where x.soCMND.Trim().Equals(s) select x).ToList();
            var listkh = db.KhachHangs.Where(x => x.soCMND.Trim().Equals(s)).ToList();
            List<eKhachHang> ls = new List<eKhachHang>();
            foreach (KhachHang item in listkh)
            {
                eKhachHang kh = new eKhachHang();
                kh.MaKH = item.maKH.Trim();
                kh.TenKH = item.tenKh.Trim();
                kh.SoCMND = item.soCMND.Trim();
                kh.SoDT = item.soDT.Trim();
                kh.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                kh.MaDoan = item.maDoan;
                ls.Add(kh);
            }
            return ls;
        }

        public List<eKhachHang> getmaKH(string s)
        {
            var listkh = (from x in db.KhachHangs where x.maKH.Trim().Equals(s) select x).ToList();
            List<eKhachHang> ls = new List<eKhachHang>();
            foreach (KhachHang item in listkh)
            {
                eKhachHang kh = new eKhachHang();
                kh.MaKH = item.maKH.Trim();
                kh.TenKH = item.tenKh.Trim();
                kh.SoCMND = item.soCMND.Trim();
                kh.SoDT = item.soDT.Trim();
                kh.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                kh.MaDoan = item.maDoan;
                ls.Add(kh);
            }
            return ls;
        }
        public string getenKH_ByID(string id)
        {
            KhachHang nv = db.KhachHangs.Where(x => x.maKH.Equals(id)).SingleOrDefault();
            return nv.tenKh;
        }

        public string geMaKH_ByCMND(string cmnd)
        {
            KhachHang nv = db.KhachHangs.Where(x => x.soCMND.Equals(cmnd)).SingleOrDefault();
            return nv.maKH;
        }
    }
}


