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
using System.Collections;
using Entyti;
using BUS;

namespace Home
{
    public partial class frmDatPhong : DevExpress.XtraEditors.XtraForm
    {

        frmHome frmHome;
        string maKH;
        List<eCTDV> ls = new List<eCTDV>();
        List<eKhachHang> lskh;
        List<eSuDungDichVu> lssddv = new List<eSuDungDichVu>();
        SuDungDichVuBUS sddvbus = new SuDungDichVuBUS();
        ThuePhongBUS tpbus = new ThuePhongBUS();
        DichVuBUS dvbus = new DichVuBUS();
        KhachHangBUS khbus = new KhachHangBUS();
        ArrayList mangDichVu = new ArrayList();
        int kieuForm;
        int q = 0;
        //Truyền dữ liệu từ form này sáng form khác
        public static string TenPhong = string.Empty;
        public static string TenLoaiPhong = string.Empty;
        public static string CMND = string.Empty;
        public static string TenKH = string.Empty;
        public static string SDT = string.Empty;
        public static string GioiTinh = string.Empty;
        public static string emailNV = string.Empty;
        public static string maThue = string.Empty;

        public frmDatPhong()
        {
            InitializeComponent();
        }

        /**Kiểu Form
        1: là form đặt phòng
        2: là form cập nhật dịch vụ**/
        //Form 1
        public frmDatPhong(frmHome sql)
        {
            InitializeComponent();
            frmHome = sql;
            kieuForm = 1;
        }
        //Form 2
        public frmDatPhong(string s)
        {
            InitializeComponent();
            this.Text = s;
            kieuForm = 2;
            panel4.Visible = false;
            panel3.Dock = DockStyle.Fill;
            dgvCTDV.Dock = DockStyle.Fill;
            //labelControl7.Visible = false;
           // comboBox1.Visible = false;
            label5.Visible = false;
            dtmNgayRa.Visible = false;
            btnLuu.Text = "Cập nhật dịch vụ";
            panel12.Location = new Point(666, 0);
            panel12.Size = new Size(245, 54);
            btnLuu.Size = new Size(191, 54);
        }

        private void btnLuu_MouseHover(object sender, EventArgs e)
        {
            btnLuu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(217)))), ((int)(((byte)(89)))));
        }

        private void btnLuu_MouseLeave(object sender, EventArgs e)
        {
            btnLuu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(168)))), ((int)(((byte)(210)))), ((int)(((byte)(242)))));
        }

        private void btnThoat_MouseLeave(object sender, EventArgs e)
        {
            btnThoat.BackColor = Color.FromArgb(((int)(((byte)(168)))), ((int)(((byte)(210)))), ((int)(((byte)(242)))));
        }

        private void btnThoat_MouseHover(object sender, EventArgs e)
        {
            btnThoat.BackColor = Color.FromArgb(((int)(((byte)(242)))), ((int)(((byte)(217)))), ((int)(((byte)(89)))));
        }

        private void frmDatPhong_Load(object sender, EventArgs e)
        {
            LoaiPhongBUS lpbus = new LoaiPhongBUS();
            dgvDichVu.DataSource = dvbus.getalldv();
            lblTenPhong.Text = TenPhong;
            lblLoaiPhong.Text = TenLoaiPhong;
        }
        //Lựa chọn dịch vụ để mua bán
        private void btnThem_Click(object sender, EventArgs e)
        {
            for (int i = 1; i < 31; i++)
            {
                cboSL.Items.Add(i);
            }
            string maDV = gridViewDV.GetRowCellValue(gridViewDV.FocusedRowHandle, gridViewDV.Columns[0]).ToString();
            string tenDV = gridViewDV.GetRowCellValue(gridViewDV.FocusedRowHandle, gridViewDV.Columns[1]).ToString();
            string donGia = gridViewDV.GetRowCellValue(gridViewDV.FocusedRowHandle, gridViewDV.Columns[2]).ToString();
            string soLuongDV = gridViewDV.GetRowCellValue(gridViewDV.FocusedRowHandle, gridViewDV.Columns[4]).ToString();
            eDichVu dvtemp = new eDichVu(maDV, tenDV, Convert.ToDouble(donGia), Convert.ToInt32(soLuongDV));
            mangDichVu.Add(dvtemp);
            eCTDV dv = new eCTDV();
            dv.MaDV = maDV;
            dv.TenDV = tenDV;
            dv.DonGia = Convert.ToDouble(donGia);
            dv.SoLuong = 1;
            foreach (var item in ls.ToList())
            {
                if (item.TenDV.Equals(tenDV))
                {
                    ls.Remove(item);
                }
            }
            ls.Add(dv);
            int index = gridViewDV.FocusedRowHandle;
            gridViewDV.DeleteRow(index);
            dgvCTDV.DataSource = ls.ToList();
        }
        //Xoá những dịch vụ không cần thiết
        private void btnXoa_Click(object sender, EventArgs e)
        {
            int index = gridViewCTDV.FocusedRowHandle;
            ls.RemoveAt(index);
            gridViewCTDV.DeleteRow(index);
        }

        private void txtSeachDV_TextChanged(object sender, EventArgs e)
        {
            if (txtSeachDV.Text == "")
            {
                dgvDichVu.DataSource = dvbus.getalldv();
            }
            else
            {
                dgvDichVu.DataSource = dvbus.getallTenDV(txtSeachDV.Text);
            }
        }
        //Kiểm trả khách hàng có tồn tại. Nếu không tồn tại thì tự mở form thêm khách hàng để thêm
        private void btnThemKH_Click(object sender, EventArgs e)
        {
            lskh = new List<eKhachHang>();
            string s = txtSeachKH.Text.Trim();
            lskh = khbus.getcmnd(s);
            if (lskh.Count == 0)
            {
                DialogResult ds = MessageBox.Show("Không có khách hàng. Hãy nhập thông tin khách hàng", "Thêm khách hàng", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (ds == DialogResult.OK)
                {
                    frmTTKhachHang frm = new frmTTKhachHang();
                    frm.ShowDialog();
                    txtCMND.Text = CMND;
                    txtSDT.Text = SDT;
                    txtHT.Text = TenKH;
                    if (GioiTinh.Equals("Nam"))
                    {
                        radNam.Checked = true;
                    }
                    else
                    {
                        radNu.Checked = true;
                    }
                }
            }
            else
            {
                foreach (var item in lskh)
                {
                    maKH = item.MaKH;
                    txtHT.Text = item.TenKH;
                    txtCMND.Text = item.SoCMND;
                    txtSDT.Text = item.SoDT;
                    if (item.GioiTinh)
                    {
                        radNam.Checked = true;
                    }
                    else
                    {
                        radNu.Checked = true;
                    }
                }
            }
        }

        public void checkTextBox()
        {
            if ((txtCMND.Text.Equals("") || txtHT.Text.Equals("") || txtSDT.Text.Equals("")))
            {
                MessageBox.Show("Phải lựa chọn khách hàng để đặt phòng");               
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (kieuForm == 1)
            {
                checkTextBox();
                //Thêm mã thuê phòng
                eThuePhong tp = new eThuePhong();
                PhongBUS pbus = new PhongBUS();
                NhanVienBUS nvbus = new NhanVienBUS();
                DateTime time = DateTime.Now;
                tp.MaThuePhong = "TP" +time.ToString("ddMMyyhhmmss");
                tp.MaPhong = pbus.maPhong(TenPhong);
                tp.MaKH = txtMaKH.Text;
                tp.NgayVao = DateTime.Now.Date;
                tp.NgayRa = Convert.ToDateTime(dtmNgayRa.Text);
             //   tp.MaNV = nvbus.getmaNV_byEmail(emailNV);
                tp.TrangThai = 0;
                TimeSpan gioVao = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
                tp.GioVao = gioVao;
                TimeSpan gioRa = new TimeSpan(14, 00, 00);
                tp.GioRa = gioRa;
                int a = tpbus.insertThuePhong(tp);
                if (a == 1)
                {
                    //Đổi tình trạng phòng thành phòng có khách khi đặt phòng thành công
                    ePhong p = new ePhong();
                    p.MaPhong = pbus.maPhong(TenPhong);
                    p.TinhTrang = true;
                    pbus.updateTinhTrangPhong(p);
                    MessageBox.Show("Đặt phòng thành công");
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Không thành công");
                    return;
                }

                DichVuBUS dvbus = new DichVuBUS();
                eDichVu dv = new eDichVu();

                //Thêm chi tiết dịch vụ nếu có đặt dịch vụ
                if (gridViewCTDV.RowCount > 0)
                {
                    eSuDungDichVu sddv = new eSuDungDichVu();
                    for (int i = 0; i < gridViewCTDV.RowCount; i++)
                    {
                        sddv.MaThue = tpbus.getMaThue_ByMaPhongTrangThai(tp.MaPhong, 0);
                        sddv.MaDV = gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[0]).ToString();
                        sddv.SoLuong = Convert.ToInt32(gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[2]).ToString());
                        sddv.NgaySD = DateTime.Now.Date;
                        sddv.GioSD = gioVao;
                        int s = sddvbus.InsertSDDV(sddv);
                        foreach (eDichVu item in mangDichVu)
                        {
                            //Cập nhật lại số lượng trong bảng dịch vụ
                            if (gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[0]).ToString() == item.MaDV)
                            {
                                dv.MaDV = item.MaDV;
                                dv.TenDV = item.TenDV;
                                dv.DonGia = item.DonGia;
                                dv.SoLuong = (item.SoLuong - Convert.ToInt32(gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[2])));
                                dvbus.SuaDV(dv);
                            }
                        }
                    }
                }
            }

            if (kieuForm == 2)
            {
                
                btnThemKH.Visible=true;
                //câp nhaaat dv
                TimeSpan gioVao = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
                if (gridViewCTDV.RowCount > 0)
                {
                    eSuDungDichVu sddv = new eSuDungDichVu();
                    for (int i = 0; i < gridViewCTDV.RowCount; i++)
                    {
                        sddv.MaThue = maThue.Trim();
                        sddv.MaDV = gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[0]).ToString();
                        /**Kiểm tra xem mã thuê và mã dịch vụ đó có trong csdl hay chưa
                        Nếu có thì hãy update lại số lượng
                        Chưa có thì thêm mới chi tiết dịch vụ**/
                        foreach (var item in sddvbus.getctdv(maThue.Trim()))
                        {
                            
                                //if (item.MaThue == null )
                              
                                //{
                                //    sddv.SoLuong = Convert.ToInt32(gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[2]).ToString());
                                //    sddv.NgaySD = DateTime.Now.Date;
                                //    sddv.GioSD = gioVao;
                                //    int s = sddvbus.InsertSDDV(sddv);
                                //}
                           
                                if ((item.MaThue.Equals(sddv.MaThue)) && (item.MaDV.Equals(sddv.MaDV)))
                                {
                               
                                        sddv.SoLuong = Convert.ToInt32(gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[2]).ToString()) + item.SoLuong;
                                        sddv.NgaySD = DateTime.Now.Date;
                                        sddv.GioSD = gioVao;
                                        q= sddvbus.updateCTDV(sddv);
                                
                                }



                              if (q==0)
    
                                {
                                    sddv.SoLuong = Convert.ToInt32(gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[2]).ToString());
                                    sddv.NgaySD = DateTime.Now.Date;
                                    sddv.GioSD = gioVao;
                                    int s = sddvbus.InsertSDDV(sddv);
                                }
                        }
                        DichVuBUS dvbus = new DichVuBUS();
                        eDichVu dv = new eDichVu();
                        foreach (eDichVu item in mangDichVu)
                        {
                            //Cập nhật lại số lượng trong bảng dịch vụ
                            if (gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[0]).ToString() == item.MaDV)
                            {
                                dv.MaDV = item.MaDV;
                                dv.TenDV = item.TenDV;
                                dv.DonGia = item.DonGia;
                                dv.SoLuong = (item.SoLuong - Convert.ToInt32(gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[2])));
                                dvbus.SuaDV(dv);
                            }
                        }
                    }
                    MessageBox.Show("Cập nhật dịch vụ thành công");
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Không có dịch vụ cần cập nhật xin nhập lại");
                }
            }
        }

        //Chọn ngày để trả phòng, không được chọn ngày nhỏ hơn ngày hiện tại
        private void dtmNgayRa_ValueChanged(object sender, EventArgs e)
        {
            TimeSpan date = dtmNgayRa.Value - DateTime.Now.Date;
            if (date.Days < 0)
            {
                MessageBox.Show("Nhập ngày lớn hơn ngày hiện tại");
                dtmNgayRa.Focus();
                return;
            }
        }
        //Load lại giao diện chính khi đã đặt phòng xong
        private void frmDatPhong_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (kieuForm == 1)
            {
                JoinTable_BUS joinbus = new JoinTable_BUS();
                PhongBUS pbus = new PhongBUS();
                frmHome.cleanGiaoDien();
                frmHome.TaoGiaoDienPhong(pbus.getallp(), pbus.gettinhtrangp(false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng");
            }          
        }
        //Kiểm tra xem số lượng dịch vụ cần đặt có lớn hơn số lượng dịch vụ có trong khi
        private void gridViewCTDV_Click(object sender, EventArgs e)
        {
            eDichVu dv = new eDichVu();
            for (int i = 0; i < gridViewCTDV.RowCount; i++)
            {
                foreach (eDichVu item in mangDichVu)
                {
                    if (gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[0]).ToString() == item.MaDV && item.SoLuong < Convert.ToInt32(gridViewCTDV.GetRowCellValue(i, gridViewCTDV.Columns[2])))
                    {
                        ls.RemoveAt(i);
                        gridViewCTDV.DeleteRow(i);
                        DevExpress.XtraEditors.XtraMessageBox.Show("Số lượng dịch vụ " + item.TenDV.ToLower() + " đã hết");
                        return;
                    }
                }
            }
        }

        private void txtCMND_TextChanged(object sender, EventArgs e)
        {
            txtMaKH.Text = khbus.getMaKH_ByCMND(txtCMND.Text);

        }

        private void btnThemDatP_Click(object sender, EventArgs e)
        {
            frmTTKhachHang frm = new frmTTKhachHang();
            frm.ShowDialog();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ds = MessageBox.Show("Bạn Có Muốn Thoát ?", "Thoát", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ds == DialogResult.Yes)
            {
                //Environment.Exit(0);
                this.Close();
            }
           
        }
    }
}