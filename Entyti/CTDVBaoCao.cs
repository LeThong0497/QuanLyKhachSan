using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class CTDVBaoCao
    {
        public string maDV { get; set; }
        public string tenDV { get; set; }
        public int soLuong { get; set; }
        public double donGia { get; set; }
        public double thanhTien
        {
            get
            {
                return soLuong * donGia;
            }
        }
    }
}
