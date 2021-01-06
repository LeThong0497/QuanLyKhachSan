using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eDichVu
    {
        private string maDV, tenDV;
        private double donGia;
        private int soLuong;

        public eDichVu(string maDV, string tenDV, double donGia, int soLuong)
        {
            this.maDV = maDV;
            this.tenDV = tenDV;
            this.donGia = donGia;
            this.soLuong = soLuong;
        }

        public eDichVu()
        {

        }

        public string MaDV
        {
            get
            {
                return maDV;
            }

            set
            {
                maDV = value;
            }
        }

        public string TenDV
        {
            get
            {
                return tenDV;
            }

            set
            {
                tenDV = value;
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
    }
}
