using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eSuDungDichVu
    {
        private string maDV;
        private string maThue;
        private int soLuong;
        private DateTime ngaySD;
        private TimeSpan gioSD;

        public eSuDungDichVu(string maDV, string maThue, int soLuong, DateTime ngaySD, TimeSpan gioSD)
        {
            this.maDV = maDV;
            this.soLuong = soLuong;
            this.maThue = maThue;
            this.ngaySD = ngaySD;
            this.gioSD = gioSD;
        }

        public eSuDungDichVu()
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

        public DateTime NgaySD
        {
            get
            {
                return ngaySD;
            }

            set
            {
                ngaySD = value;
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

        public TimeSpan GioSD
        {
            get
            {
                return gioSD;
            }

            set
            {
                gioSD = value;
            }
        }
    }
}
