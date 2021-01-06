using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class ePhong
    {
        private string maPhong, tenPhong, ghiChu, maLoaiPhong;
        private int tang;
        private bool tinhTrang;

        public ePhong(string maPhong, string tenPhong, string ghiChu, string maLoaiPhong, int tang, bool tinhTrang)
        {
            this.maPhong = maPhong;
            this.tenPhong = tenPhong;
            this.ghiChu = ghiChu;
            this.maLoaiPhong = maLoaiPhong;
            this.tang = tang;
            this.tinhTrang = tinhTrang;
        }

        public ePhong()
        {

        }

        public string GhiChu
        {
            get
            {
                return ghiChu;
            }

            set
            {
                ghiChu = value;
            }
        }

        public string MaLoaiPhong
        {
            get
            {
                return maLoaiPhong;
            }

            set
            {
                maLoaiPhong = value;
            }
        }

        public string MaPhong
        {
            get
            {
                return maPhong;
            }

            set
            {
                maPhong = value;
            }
        }

        public int Tang
        {
            get
            {
                return tang;
            }

            set
            {
                tang = value;
            }
        }

        public string TenPhong
        {
            get
            {
                return tenPhong;
            }

            set
            {
                tenPhong = value;
            }
        }

        public bool TinhTrang
        {
            get
            {
                return tinhTrang;
            }

            set
            {
                tinhTrang = value;
            }
        }
    }
}