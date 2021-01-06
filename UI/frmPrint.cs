using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using Entyti;
using BUS;

namespace Home
{
    public partial class frmPrint : DevExpress.XtraEditors.XtraForm
    {
        public frmPrint()
        {
            InitializeComponent();
        }

        public void InHoaDonInTuReport(BaoCao bc, List<CTDVBaoCao> ls)
        {
            InHoaDon report = new InHoaDon();
            foreach (DevExpress.XtraReports.Parameters.Parameter item in report.Parameters)
            {
                item.Visible = false;
            }
            report.InHoaDonInData(bc.tenNV, bc.tenKH, bc.soPhong, bc.soHD, bc.thoiGianInHD, bc.ngayDen, bc.ngayRa, bc.tienPhong, ls.ToList());
            documentViewer1.DocumentSource = report;
            report.CreateDocument();
        }

        private void documentViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}