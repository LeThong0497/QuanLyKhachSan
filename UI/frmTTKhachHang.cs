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

//using KimtToo;


namespace Home
{
    public partial class frmTTKhachHang : DevExpress.XtraEditors.XtraForm
    {
        KhachHangBUS khBus;
        eKhachHang kh = new eKhachHang();
        string cmnd, tenkh, sdt, giotinh;

        public frmTTKhachHang()
        {
            InitializeComponent();
        }
              
        private void btnThem_Click(object sender, EventArgs e)
        {
            DateTime time = DateTime.Now;
            eKhachHang newkh = new eKhachHang();
            
            newkh.MaKH = "KH" + time.ToString("ddMMyyhhmmss");
            newkh.TenKH = txtTenKhach.Text;
            newkh.SoCMND = txtCMND.Text;
            newkh.SoDT = txtSDT.Text;           
            if (radNam.Checked == true) newkh.GioiTinh = true;
            else newkh.GioiTinh = false;
            khBus = new KhachHangBUS();
            int kq = khBus.InsertKH(newkh);
            
            if (kq == 1)
            {
                MessageBox.Show("Thêm thành công!!!");
                cmnd = txtCMND.Text;
                tenkh = txtTenKhach.Text;
                sdt = txtCMND.Text;
                if (radNam.Checked)
                {
                    giotinh = "Nam";
                }
                else
                {
                    giotinh = "Nữ";
                }
                this.Close();
            }
            else
            {
                MessageBox.Show("Bị trùng mã, nhập lại");
            }          
        }

        private void frmTTKhachHang_FormClosing(object sender, FormClosingEventArgs e)
        {
            frmDatPhong.CMND = cmnd;
            frmDatPhong.TenKH = tenkh;
            frmDatPhong.SDT = sdt;
            frmDatPhong.GioiTinh = giotinh;
            
        }
        
    }
}