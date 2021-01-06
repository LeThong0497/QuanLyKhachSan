using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Collections.Generic;
using Entyti;

namespace Home
{
    public partial class InHoaDon : DevExpress.XtraReports.UI.XtraReport
    {
        public InHoaDon()
        {
            InitializeComponent();
        }

        public void InHoaDonInData(string tenNV, string tenKH, string soPhong, string soHD, string thoiGianInHD,
    DateTime ngayDen, DateTime ngayRa, double tienPhong, List<CTDVBaoCao> ls)
        {
            pTenKH.Value = tenKH;
            pTenNV.Value = tenNV;
            pNgayDen.Value = ngayDen;
            pNgayRa.Value = ngayRa;
            pThoiGianGhiHoaDon.Value = thoiGianInHD;
            pSoHoaDon.Value = soHD;
            pSoPhong.Value = soPhong;
            pTienPhong.Value = tienPhong;
            objectDataSource1.DataSource = ls;
        }

    }
}
