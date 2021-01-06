using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;

namespace DAL
{
    public class ThuePhongDAL
    {
        dbQLKhachSanDataContext db = new dbQLKhachSanDataContext();

        public int insertThuePhong(eThuePhong newtp)
        {
            ThuePhong temp = new ThuePhong();
            temp.maThue = newtp.MaThuePhong;
            temp.maKH = newtp.MaKH;
            temp.maNV = newtp.MaNV;
            temp.maPhong = newtp.MaPhong;
            temp.ngayVao = newtp.NgayVao;
            temp.ngayRa = newtp.NgayRa;
            temp.gioRa = newtp.GioRa;
            temp.gioVao = newtp.GioVao;
            temp.trangThai = Convert.ToByte(newtp.TrangThai);
            db.ThuePhongs.InsertOnSubmit(temp);
            db.SubmitChanges();
            return 1;
        }

        public List<eThuePhong> getMaThuePhong(string s)
        {
            var list = (from x in db.ThuePhongs where x.maThue.Trim().Equals(s.Trim()) select x).ToList();
            List<eThuePhong> ls = new List<eThuePhong>();
            foreach (ThuePhong item in list)
            {
                eThuePhong tp = new eThuePhong();
                tp.MaThuePhong = item.maThue.Trim();
                tp.MaNV = item.maNV.Trim();
                tp.MaPhong = item.maPhong.Trim();
                tp.NgayRa = item.ngayRa;
                tp.MaKH = item.maKH.Trim();
                tp.TrangThai = item.trangThai;
                tp.NgayVao = item.ngayVao;
                tp.GioVao = item.gioVao;
                tp.GioRa = item.gioRa;
                ls.Add(tp);
            }
            return ls;
        }

        public string getMaThue_ByMaPhongTrangThai(string maPhong, int trangThai)
        {
            ThuePhong tp = db.ThuePhongs.Where(x => x.maPhong.Equals(maPhong) && x.trangThai == 0).SingleOrDefault();
            return tp.maThue;
        }

        public void updateThuePhong(eThuePhong tp)
        {
            IQueryable<ThuePhong> tphong = db.ThuePhongs.Where(x => x.maThue.Equals(tp.MaThuePhong));
            tphong.First().gioRa = tp.GioRa;
            tphong.First().ngayRa = tp.NgayRa;
            tphong.First().trangThai = Convert.ToByte(tp.TrangThai);
            db.SubmitChanges();
        }

        public string getMaPhong_ByMaThueTrangThai(string maThue, int trangThai)
        {
            ThuePhong tp = db.ThuePhongs.Where(x => x.maThue.Equals(maThue) && x.trangThai == 0).SingleOrDefault();
            return tp.maPhong;
        }
    }
}
