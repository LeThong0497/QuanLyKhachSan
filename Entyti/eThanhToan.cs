using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entyti
{
    public class eThanhToan
    {
        private string maHD, maThuePhong;
        private DateTime ngayLap;
        private float thueVAT, giamGia;
        private TimeSpan gioLap;

        public eThanhToan(string maHD, string maThuePhong, DateTime ngayLap, float thueVAT, float giamGia, TimeSpan gioLap)
        {
            this.maHD = maHD;
            this.maThuePhong = maThuePhong;
            this.ngayLap = ngayLap;
            this.thueVAT = thueVAT;
            this.giamGia = giamGia;
            this.gioLap = gioLap;
        }

        public eThanhToan()
        {

        }

        public string MaHD
        {
            get
            {
                return maHD;
            }

            set
            {
                maHD = value;
            }
        }

        public float GiamGia
        {
            get
            {
                return giamGia;
            }

            set
            {
                giamGia = value;
            }
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

        public DateTime NgayLap
        {
            get
            {
                return ngayLap;
            }

            set
            {
                ngayLap = value;
            }
        }

        public float ThueVAT
        {
            get
            {
                return thueVAT;
            }

            set
            {
                thueVAT = value;
            }
        }

        public TimeSpan GioLap
        {
            get
            {
                return gioLap;
            }

            set
            {
                gioLap = value;
            }
        }

        public double tinhTienPhuThu(List<eThuePhong> ls, double tienPhong)
        {
            double phuThu = 0;
            TimeSpan nhan13h = new TimeSpan(13, 00, 00);
            TimeSpan nhan11h = new TimeSpan(11, 00, 00);
            TimeSpan nhan8h = new TimeSpan(8, 00, 00);
            TimeSpan nhan6h = new TimeSpan(6, 00, 00);
            foreach (eThuePhong item in ls)
            {
                if (item.GioVao <= nhan13h && item.GioVao > nhan11h)
                {
                    phuThu = (0.3 * tienPhong);
                }
                else if (item.GioVao <= nhan11h && item.GioVao > nhan8h)
                {
                    phuThu = (0.5 * tienPhong);
                }
                else if (item.GioVao < nhan6h)
                {
                    phuThu = 0;
                }
                else if (item.GioVao >= nhan13h)
                {
                    phuThu = 0;
                }
            }
            return phuThu;
        }

        public double tinhTienPhong(eThuePhong tp, double tienPhong, DateTime nhanPhong, DateTime traPhong)
        {
            double money = 0;
            TimeSpan date = traPhong - nhanPhong;
            int ngay = date.Days;
            int h = date.Hours;
            int m = date.Minutes;
            //Tính thuê theo giờ
            if (ngay == 0 && h == 0)
            {
                money = (0.2 * tienPhong);
            }
            if (ngay == 0 && h == 1)
            {
                money = (0.3 * tienPhong);
            }
            if (ngay == 0 && h > 2)
            {
                money = (0.5 * tienPhong);
            }
            if (ngay == 0 && h > 5)
            {
                money = tienPhong;
            }
            //Tính thuê theo ngày
            if (ngay > 0 && h > 6)
            {
                money = (ngay * tienPhong + tienPhong);
            }
            if (ngay > 0 && h < 6)
            {
                money = (ngay * tienPhong);
            }
            return money;
        }
    }

}
