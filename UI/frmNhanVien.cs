using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using Entyti;
using BUS;

namespace Home
{
    public partial class frmNhanVien : DevExpress.XtraEditors.XtraForm
    {
        List<eNhanVien> listNV; //Khai báo danh sách phòng học (TreeView)
        NhanVienBUS nvBus;
        eNhanVien nv = new eNhanVien();
        public frmNhanVien()
        {
            InitializeComponent();
        }

        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            nvBus = new NhanVienBUS();
            listNV = new List<eNhanVien>();
            listNV = nvBus.getallnv();
            gclDSNV.DataSource = listNV;
            cboListTim.Items.Add("Tìm theo mã");
            cboListTim.Items.Add("Tìm theo tên");
            cboListTim.Items.Add("Tìm theo Số điện thoại");
            cboListTim.Items.Add("Tìm theo Số CMND");
        }
        private void txtCmnd_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            nv = nvBus.tangma();
            if (Convert.ToInt32(nv.MaNV.Substring(5)) > 10)
            {
                txtMa.Text = "NV000" + (Convert.ToInt32(nv.MaNV.Substring(5)) + 1).ToString();
            }
            else if (Convert.ToInt32(nv.MaNV.Substring(4, 5)) < 100)
            {
                txtMa.Text = "NV00" + (Convert.ToInt32(nv.MaNV.Substring(4, 5)) + 1).ToString();
            }
            else if (Convert.ToInt32(nv.MaNV.Substring(3, 5)) < 1000)
            {
                txtMa.Text = "NV0" + (Convert.ToInt32(nv.MaNV.Substring(3, 5)) + 1).ToString();
            }
            else
            {
                txtMa.Text = "NV" + (Convert.ToInt32(nv.MaNV.Substring(2, 5)) + 1).ToString();
            }
            eNhanVien newnv = new eNhanVien();
            newnv.MaNV = txtMa.Text.Trim();
            newnv.HoTen = txtTen.Text;
            newnv.SoCMND = txtCmnd.Text;
            newnv.SoDT = txtSdt.Text;
           // newnv.PassWord = txtPass.Text;
            newnv.ChucVu = false;
            if (radNam.Checked == true)     newnv.GioiTinh = true;
            else newnv.GioiTinh = false;
            newnv.NgaySinh = Convert.ToDateTime(dtpNS.Text);
            int kq = nvBus.InsertNhanVien(newnv);
            if (kq == 1)
                MessageBox.Show("Thêm thành công!!!");
            else
            {
                MessageBox.Show("Bị trùng mã, nhập lại");
                txtMa.Focus();
            }
            //đưa lại gridview
            List<eNhanVien> listNhanVien = nvBus.getallnv();
            gclDSNV.DataSource = listNhanVien;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            eNhanVien newnv = new eNhanVien();
            //Đối tượng lấy ra từ text
            newnv.MaNV = txtMa.Text;
            newnv.HoTen = txtTen.Text;
            if (radNam.Checked)
            {
                newnv.GioiTinh = true;
            }
            else
            {
                newnv.GioiTinh = false;
            }
            newnv.ChucVu = false;
            newnv.SoCMND = txtCmnd.Text;
            newnv.SoDT = txtSdt.Text;
            //newnv.PassWord = txtPass.Text;
            newnv.NgaySinh = Convert.ToDateTime(dtpNS.Text);
            ////Đối tượng lấy ra từ gridcontrols
            //eNhanVien nvgrid = new eNhanVien();
            //nvgrid.MaNV= gridViewNV.GetRowCellValue(gridViewNV.FocusedRowHandle, gridViewNV.Columns[0]).ToString();
            //nvgrid.HoTen= gridViewNV.GetRowCellValue(gridViewNV.FocusedRowHandle, gridViewNV.Columns[1]).ToString();
            
            //nvgrid.ChucVu = false;
            //nvgrid.SoCMND = gridViewNV.GetRowCellValue(gridViewNV.FocusedRowHandle, gridViewNV.Columns[2]).ToString();
            //nvgrid.SoDT = gridViewNV.GetRowCellValue(gridViewNV.FocusedRowHandle, gridViewNV.Columns[3]).ToString();
            //nvgrid.PassWord = gridViewNV.GetRowCellValue(gridViewNV.FocusedRowHandle, gridViewNV.Columns[4]).ToString();
            //nvgrid.NgaySinh = Convert.ToDateTime(gridViewNV.GetRowCellValue(gridViewNV.FocusedRowHandle, gridViewNV.Columns[7]).ToString());

            nvBus.SuaNV(newnv);
            //nvBus.SuaNV(nvgrid);
            //đưa lại datagridview
            List<eNhanVien> listNhanVien = nvBus.getallnv();
            gclDSNV.DataSource = listNhanVien;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            bool kq;
            DialogResult dlgHoi = MessageBox.Show("Bạn có chắc xóa",
                "Hoi xóa", MessageBoxButtons.YesNo,
                MessageBoxIcon.Question, MessageBoxDefaultButton.Button1);
            if (dlgHoi == DialogResult.Yes)
            {
                //mới xóa
                kq = nvBus.XoaNV(txtMa.Text);
                if (kq == true)
                {
                    //đưa lại datagridview
                    // string strMaPhong = trePhong.SelectedNode.Tag.ToString();
                    List<eNhanVien> listNV = nvBus.getallnv();
                    gclDSNV.DataSource = listNV;
                }
                else
                {
                    MessageBox.Show("Bạn hãy chọn nhân viên cần xóa!");
                }
            }
        }

        private void txtTim_TextChanged(object sender, EventArgs e)
        {
            //  IEnumerable<eNhanVien> dsNV;
            string str;
            str = txtTim.Text;
            if (cboListTim.Text.Equals("Tìm theo mã"))
            {

                gclDSNV.DataSource = nvBus.getallMaNV(str);
            }
            else
                 if (cboListTim.Text.Equals("Tìm theo tên"))
            {

                gclDSNV.DataSource = nvBus.getallTenNV(str);
            }
            else
                if (cboListTim.Text.Equals("Tìm theo Số CMND"))
            {
                gclDSNV.DataSource = nvBus.getallCMNDNV(str);
            }
            else
                gclDSNV.DataSource = nvBus.getallSoDTNV(str);
            //else
            //{
            //    dsSach = sach.getAllTen(str);
            //}
        }

        private void gridViewNV_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            MessageBox.Show("a");
            txtMa.Text = gridViewNV.GetFocusedRowCellValue("MaNV").ToString();
            txtTen.Text = gridViewNV.GetFocusedRowCellValue("HoTen").ToString();
            txtCmnd.Text = gridViewNV.GetFocusedRowCellValue("SoCMND").ToString();
            txtSdt.Text = gridViewNV.GetFocusedRowCellValue("SoDT").ToString();
            dtpNS.Text = gridViewNV.GetFocusedRowCellValue("NgaySinh").ToString();
            txtPass.Text = gridViewNV.GetFocusedRowCellValue("PassWord").ToString();
            if (Convert.ToBoolean(gridViewNV.GetFocusedRowCellValue("GioiTinh").ToString()) == true) radNam.Checked = true;
            else radNu.Checked = true;
        }

        private void gridViewNV_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            txtMa.Text = gridViewNV.GetFocusedRowCellValue("MaNV").ToString();
            txtTen.Text = gridViewNV.GetFocusedRowCellValue("HoTen").ToString();
            txtCmnd.Text = gridViewNV.GetFocusedRowCellValue("SoCMND").ToString();
            txtSdt.Text = gridViewNV.GetFocusedRowCellValue("SoDT").ToString();
            dtpNS.Text = gridViewNV.GetFocusedRowCellValue("NgaySinh").ToString();
            txtPass.Text = gridViewNV.GetFocusedRowCellValue("PassWord").ToString();
            if (Convert.ToBoolean(gridViewNV.GetFocusedRowCellValue("GioiTinh").ToString()) == true) radNam.Checked = true;
            else radNu.Checked = true;
        }
    }
}