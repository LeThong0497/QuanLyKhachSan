using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eHonLoan
    {
        string maThue, maPhong, maKhach, maNV, maLoaiPhong, tenPhong;
        bool tinhTrang;
        DateTime ngayTra;

        public eHonLoan(string maThue, string maPhong, string maKhach, string maNV, string maLoaiPhong, string tenPhong, bool tinhTrang, DateTime ngayTra)
        {
            this.maThue = maThue;
            this.maPhong = maPhong;
            this.maKhach = maKhach;
            this.maNV = maNV;
            this.maLoaiPhong = maLoaiPhong;
            this.tenPhong = tenPhong;
            this.tinhTrang = tinhTrang;
            this.ngayTra = ngayTra;
        }

        public eHonLoan()
        {

        }

        public string MaKhach
        {
            get
            {
                return maKhach;
            }

            set
            {
                maKhach = value;
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

        public string MaNV
        {
            get
            {
                return maNV;
            }

            set
            {
                maNV = value;
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

        public string MaThue
        {
            get
            {
                return maThue;
            }

            set
            {
                maThue = value;
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

        public DateTime NgayTra
        {
            get
            {
                return ngayTra;
            }

            set
            {
                ngayTra = value;
            }
        }
    }
}
