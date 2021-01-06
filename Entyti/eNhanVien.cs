using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eNhanVien
    {
        private string maNV, hoTen, soCMND, soDT,passWord;
        private bool gioiTinh, chucVu;

        private DateTime ngaySinh;

        public eNhanVien(string maNV, string hoTen, string soCMND, string soDT,string passWord,  bool gioiTinh, bool chucVu, DateTime ngaySinh)
        {
            this.maNV = maNV;
            this.hoTen = hoTen;
            this.soCMND = soCMND;
            this.soDT = soDT;
            this.passWord = passWord;
            this.gioiTinh = gioiTinh;
            this.chucVu = chucVu;
            this.ngaySinh = ngaySinh;
        }

        public eNhanVien()
        {
 
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

        public string HoTen
        {
            get
            {
                return hoTen;
            }

            set
            {
                hoTen = value;
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

        public string PassWord
        {
            get
            {
                return passWord;
            }

            set
            {
                passWord = value;
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

        public bool ChucVu
        {
            get
            {
                return chucVu;
            }

            set
            {
                chucVu = value;
            }
        }

        public DateTime NgaySinh
        {
            get
            {
                return ngaySinh;
            }

            set
            {
                ngaySinh = value;
            }
        }
    }
}
