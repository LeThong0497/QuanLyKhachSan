using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;
using DAL;

namespace BUS
{
    public class ThuePhongBUS
    {
        ThuePhongDAL tpdal = new ThuePhongDAL();

        public string getMaThue_ByMaPhongTrangThai(string maPhong, int trangThai)
        {
            return tpdal.getMaThue_ByMaPhongTrangThai(maPhong, trangThai);
        }

        public int insertThuePhong(eThuePhong tp)
        {
            return tpdal.insertThuePhong(tp);
        }

        public List<eThuePhong> getMaThuePhong(string s)
        {
            return tpdal.getMaThuePhong(s);
        }

        public void updateThuePhong(eThuePhong tp)
        {
            tpdal.updateThuePhong(tp);
        }

        public string getMaPhong_ByMaThueTrangThai(string maThue, int trangThai)
        {
            return tpdal.getMaPhong_ByMaThueTrangThai(maThue, trangThai);
        }
    }
}
