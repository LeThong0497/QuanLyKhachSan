using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;
using DAL;

namespace BUS
{
    public class LoaiPhongBUS
    {
        LoaiPhongDAL lpdal = new LoaiPhongDAL();
        public List<eLoaiPhong> getall()
        {
            return lpdal.getalllp();
        }
        public double donGia(string maLoaiPhong)
        {
            return lpdal.donGia(maLoaiPhong);
        }
        public string getma_ByTen(string tenLoaiPhong)
        {
            return lpdal.getma_ByTen(tenLoaiPhong);
        }
        public List<eLoaiPhong> getDOnGia(double min, double max)
        {
            return lpdal.getDOnGia(min,max);
        }
    }
}
