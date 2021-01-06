using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using Entyti;
using DAL;

namespace BUS
{
    public class PhongBUS
    {
        PhongDAL pdal = new PhongDAL();
        public List<ePhong> getallp()
        {
            return pdal.getallphong();
        }
        public List<ePhong> gettinhtrangp(bool tinhtrang)
        {
            return pdal.gettinhtrangphong(tinhtrang);
        }
        public string maPhong(string ten)
        {
            return pdal.maPhong(ten);
        }
        public void updateTinhTrangPhong(ePhong pupdate)
        {
           pdal.updateTinhTrangPhong(pupdate);
        }
        public string getLoaiPhong_ByID(string id)
        {
            return pdal.getLoaiPhong_ByID(id);
        }
        public ePhong getEPhong_byID(string ma)
        {
            return pdal.getEPhong_byID(ma);
        }
        public string getTenPhong_ByID(string id)
        {
            return pdal.getTenPhong_ByID(id);
        }
        public List<ePhong> getLoaiPhong(string maLoaiPhong)
        {
            return pdal.getLoaiPhong(maLoaiPhong);
        }
        public List<ePhong> getLoaiPhong_Trong(string maLoaiPhong, bool tinhTrang)
        {
            return pdal.getLoaiPhong_Trong(maLoaiPhong, tinhTrang);
        }
        public ArrayList Tang()
        {
            return pdal.Tang();
        }
        public List<ePhong> getTang(string tang)
        {
            return pdal.getTang(tang);
        }
        public List<ePhong> getTang_PhongTrong(string tang, bool tinhtrang)
        {
            return pdal.getTang_PhongTrong(tang, tinhtrang);
        }
    }
}
