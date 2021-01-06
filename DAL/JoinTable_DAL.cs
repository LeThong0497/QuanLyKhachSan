using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;

namespace DAL
{
    public class JoinTable_DAL
    {
        dbQLKhachSanDataContext db = new dbQLKhachSanDataContext();
        
        public List<eHonLoan> GetPhong_ThuePhong(bool s, int trangThai)
        {
            List<eHonLoan> ls = new List<eHonLoan>();
            var q = from p in db.Phongs join t in db.ThuePhongs
                    on p.maPhong equals t.maPhong
                    where p.tinhTrang == s && t.trangThai == trangThai
                    select new {p.maPhong , p.maLoaiPhong, p.tenPhong, t.maThue , t.ngayRa};
            foreach (var item in q)
            {
                eHonLoan hl = new eHonLoan();
                hl.MaPhong = item.maPhong;
                hl.MaLoaiPhong = item.maLoaiPhong;
                hl.MaThue = item.maThue;
                hl.TenPhong = item.tenPhong;
                hl.NgayTra = item.ngayRa;
                ls.Add(hl);
            }
            return ls;
        }

        public List<eHonLoan> GetPhog_TraVaoNgay(bool s, int trangThai, DateTime date)
        {
            List<eHonLoan> ls = new List<eHonLoan>();
            var q = from p in db.Phongs
                    join t in db.ThuePhongs
                    on p.maPhong equals t.maPhong
                    where p.tinhTrang == s && t.trangThai == trangThai && t.ngayRa == date
                    select new { p.maPhong, p.maLoaiPhong, p.tenPhong, t.maThue, t.ngayRa };
            foreach (var item in q)
            {
                eHonLoan hl = new eHonLoan();
                hl.MaPhong = item.maPhong;
                hl.MaLoaiPhong = item.maLoaiPhong;
                hl.MaThue = item.maThue;
                hl.TenPhong = item.tenPhong;
                hl.NgayTra = item.ngayRa;
                ls.Add(hl);
            }
            return ls;
        }

    }
}
