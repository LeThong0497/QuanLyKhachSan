using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eHoaDon
    {
        private string tenKH, tenNV, soPhong;
        private DateTime ngayRa, ngayVao;
        private int soLuong;
        private double donGia;
        private string tenDichVu;
        private string maHoaDon;
        private double tienPhong;

        const double VAT = 0.1;

        public eHoaDon(double tienPhong, string tenDichVu, string maHoaDon, string tenKH, string tenNV, string soPhong, DateTime ngayRa, DateTime ngayVao, int soLuong, double donGia)
        {
            this.tenKH = tenKH;
            this.tenNV = tenNV;
            this.soPhong = soPhong;
            this.ngayRa = ngayRa;
            this.ngayVao = ngayVao;
            this.soLuong = soLuong;
            this.donGia = donGia;
            this.tenDichVu = tenDichVu;
            this.maHoaDon = maHoaDon;
            this.tienPhong = tienPhong;
        }

        public eHoaDon()
        {

        }

        public string TenKH
        {
            get
            {
                return tenKH;
            }

            set
            {
                tenKH = value;
            }
        }

        public string TenNV
        {
            get
            {
                return tenNV;
            }

            set
            {
                tenNV = value;
            }
        }

        public string SoPhong
        {
            get
            {
                return soPhong;
            }

            set
            {
                soPhong = value;
            }
        }

        public DateTime NgayRa
        {
            get
            {
                return ngayRa;
            }

            set
            {
                ngayRa = value;
            }
        }

        public DateTime NgayVao
        {
            get
            {
                return ngayVao;
            }

            set
            {
                ngayVao = value;
            }
        }

        public int SoLuong
        {
            get
            {
                return soLuong;
            }

            set
            {
                soLuong = value;
            }
        }

        public double DonGia
        {
            get
            {
                return donGia;
            }

            set
            {
                donGia = value;
            }
        }

        public string TenDichVu
        {
            get
            {
                return tenDichVu;
            }

            set
            {
                tenDichVu = value;
            }
        }

        public string MaHoaDon
        {
            get
            {
                return maHoaDon;
            }

            set
            {
                maHoaDon = value;
            }
        }

        public double TienPhong
        {
            get
            {
                return tienPhong;
            }

            set
            {
                tienPhong = value;
            }
        }
    }
}
