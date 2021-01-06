using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eThuePhong
    {
        private string maThuePhong, maPhong, maKH,maNV;
        private DateTime ngayVao, ngayRa;
        private int trangThai;
        private TimeSpan gioVao, gioRa;

        public eThuePhong(TimeSpan gioVao, TimeSpan gioRa,string maNV, string maThuePhong, string maPhong, string maKH, DateTime ngayVao, DateTime ngayRa, int trangThai)
        {
            this.maThuePhong = maThuePhong;
            this.maPhong = maPhong;
            this.maKH = maKH;
            this.maNV = maNV;
            this.ngayVao = ngayVao;
            this.ngayRa = ngayRa;
            this.trangThai = trangThai;
            this.gioVao = gioVao;
            this.gioRa = gioRa;
        }

        public eThuePhong()
        {

        }

        public string MaThuePhong
        {
            get
            {
                return maThuePhong;
            }

            set
            {
                maThuePhong = value;
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

        public int TrangThai
        {
            get
            {
                return trangThai;
            }

            set
            {
                trangThai = value;
            }
        }

        public TimeSpan GioVao
        {
            get
            {
                return gioVao;
            }

            set
            {
                gioVao = value;
            }
        }

        public TimeSpan GioRa
        {
            get
            {
                return gioRa;
            }

            set
            {
                gioRa = value;
            }
        }
    }
}
