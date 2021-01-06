using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;

namespace DAL
{
    public class PhongDAL
    {
        dbQLKhachSanDataContext db = new dbQLKhachSanDataContext();

        public List<ePhong> getallphong()
        {
            var litsphong = (from x in db.Phongs select x).ToList();
            List<ePhong> ls = new List<ePhong>();
            foreach (Phong item in litsphong)
            {
                ePhong p = new ePhong();
                p.MaPhong = item.maPhong;
                p.TenPhong = item.tenPhong;
                p.Tang = Convert.ToInt32(item.tang);
                p.GhiChu = item.ghiChu;
                p.MaLoaiPhong = item.maLoaiPhong;
                p.TinhTrang = Convert.ToBoolean(item.tinhTrang);
                ls.Add(p);
            }
            return ls;
        }

        public List<ePhong> gettinhtrangphong(bool tinhtrang)
        {
            var litsphong = (from x in db.Phongs where x.tinhTrang.Equals(tinhtrang) select x).ToList();
            List<ePhong> ls = new List<ePhong>();
            foreach (Phong item in litsphong)
            {
                ePhong p = new ePhong();
                p.MaPhong = item.maPhong;
                p.TenPhong = item.tenPhong;
                p.Tang = Convert.ToInt32(item.tang);
                p.GhiChu = item.ghiChu;
                p.MaLoaiPhong = item.maLoaiPhong;
                p.TinhTrang = Convert.ToBoolean(item.tinhTrang);
                ls.Add(p);
            }
            return ls;
        }

        public List<ePhong> getLoaiPhong(string maLoaiPhong)
        {
            var litsphong = (from x in db.Phongs where x.maLoaiPhong.Equals(maLoaiPhong) select x).ToList();
            List<ePhong> ls = new List<ePhong>();
            foreach (Phong item in litsphong)
            {
                ePhong p = new ePhong();
                p.MaPhong = item.maPhong;
                p.TenPhong = item.tenPhong;
                p.Tang = Convert.ToInt32(item.tang);
                p.GhiChu = item.ghiChu;
                p.MaLoaiPhong = item.maLoaiPhong;
                p.TinhTrang = Convert.ToBoolean(item.tinhTrang);
                ls.Add(p);
            }
            return ls;
        }

        public List<ePhong> getLoaiPhong_Trong(string maLoaiPhong, bool tinhTrang)
        {
            var litsphong = (from x in db.Phongs where x.maLoaiPhong.Equals(maLoaiPhong) && x.tinhTrang == tinhTrang select x).ToList();
            List<ePhong> ls = new List<ePhong>();
            foreach (Phong item in litsphong)
            {
                ePhong p = new ePhong();
                p.MaPhong = item.maPhong;
                p.TenPhong = item.tenPhong;
                p.Tang = Convert.ToInt32(item.tang);
                p.GhiChu = item.ghiChu;
                p.MaLoaiPhong = item.maLoaiPhong;
                p.TinhTrang = Convert.ToBoolean(item.tinhTrang);
                ls.Add(p);
            }
            return ls;
        }

        public ePhong getEPhong_byID(string ma)
        {
            ePhong p = new ePhong();
            Phong ph = db.Phongs.Where(n => n.maPhong.Trim().Equals(ma)).SingleOrDefault();
            p.MaPhong = ph.maPhong;
            p.TenPhong = ph.tenPhong;
            p.Tang = Convert.ToInt32(ph.tang);
            p.GhiChu = ph.ghiChu;
            p.MaLoaiPhong = ph.maLoaiPhong;
            p.TinhTrang = Convert.ToBoolean(ph.tinhTrang);
            return p;
        }

        public string maPhong(string tenPhong)
        {
            Phong p = db.Phongs.Where(n => n.tenPhong.Trim().Equals(tenPhong)).SingleOrDefault();
            return p.maPhong;
        }

        public void updateTinhTrangPhong(ePhong pupdate)
        {
            IQueryable<Phong> p = db.Phongs.Where(x => x.maPhong.Equals(pupdate.MaPhong));
            p.First().tinhTrang = Convert.ToBoolean(pupdate.TinhTrang);
            db.SubmitChanges();
        }

        public string getLoaiPhong_ByID(string id)
        {
            Phong p = db.Phongs.Where(n => n.maPhong.Trim().Equals(id)).SingleOrDefault();
            return p.maLoaiPhong.Trim();
        }

        public string getTenPhong_ByID(string id)
        {
            Phong p = db.Phongs.Where(n => n.maPhong.Trim().Equals(id)).SingleOrDefault();
            return p.tenPhong.Trim();
        }

        ArrayList tang = new ArrayList();

        public ArrayList Tang()
        {
            var phong = (from x in db.Phongs select x.tang).Distinct();
            foreach (var item in phong)
            {
                tang.Add(item);
            }
            return tang;
        }

        public List<ePhong> getTang(string tang)
        {
            var litsphong = (from x in db.Phongs where x.tang.Equals(tang) select x).ToList();
            List<ePhong> ls = new List<ePhong>();
            foreach (Phong item in litsphong)
            {
                ePhong p = new ePhong();
                p.MaPhong = item.maPhong;
                p.TenPhong = item.tenPhong;
                p.Tang = Convert.ToInt32(item.tang);
                p.GhiChu = item.ghiChu;
                p.MaLoaiPhong = item.maLoaiPhong;
                p.TinhTrang = Convert.ToBoolean(item.tinhTrang);
                ls.Add(p);
            }
            return ls;
        }

        public List<ePhong> getTang_PhongTrong(string tang, bool tinhtrang)
        {
            var litsphong = (from x in db.Phongs where x.tang.Equals(tang) && x.tinhTrang == tinhtrang select x).ToList();
            List<ePhong> ls = new List<ePhong>();
            foreach (Phong item in litsphong)
            {
                ePhong p = new ePhong();
                p.MaPhong = item.maPhong;
                p.TenPhong = item.tenPhong;
                p.Tang = Convert.ToInt32(item.tang);
                p.GhiChu = item.ghiChu;
                p.MaLoaiPhong = item.maLoaiPhong;
                p.TinhTrang = Convert.ToBoolean(item.tinhTrang);
                ls.Add(p);
            }
            return ls;
        }

    }
}
