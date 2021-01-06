using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eKhachHang
    {
        private string maKH, tenKH, soCMND, soDT, maDoan;
        private bool gioiTinh;

        public eKhachHang(string maKH, string tenKH, string soCMND, string soDT, string maDoan, bool gioiTinh)
        {
            this.maKH = maKH;
            this.tenKH = tenKH;
            this.soCMND = soCMND;
            this.soDT = soDT;
           this.maDoan = maDoan;
            this.gioiTinh = gioiTinh;
        }

        public eKhachHang()
        {
            this.maKH = "";
            this.tenKH = "";
            this.soCMND = "";
            this.soDT = "";
            this.maDoan = "";
            this.gioiTinh = true;
        }

        public string MaKH
        {
            get
            {
                return maKH;
            }

            set
            {
                maKH = value;
            }
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

        public string SoCMND
        {
            get
            {
                return soCMND;
            }

            set
            {
                soCMND = value;
            }
        }

        public string SoDT
        {
            get
            {
                return soDT;
            }

            set
            {
                soDT = value;
            }
        }

        public string MaDoan
        {
            get
            {
                return maDoan;
            }

            set
            {
                maDoan = value;
            }
        }

        public bool GioiTinh
        {
            get
            {
                return gioiTinh;
            }

            set
            {
                gioiTinh = value;
            }
        }
    }
}
