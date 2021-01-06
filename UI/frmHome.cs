using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraBars;
using BUS;
using Entyti;
using System.Threading;

namespace Home
{
    public partial class frmHome : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public bool isDead = false;
        bool isDangXuat = false;
        frmDangNhap frmDangNhap;
        string s;
        double donGia;
        List<ePhong> listp = new List<ePhong>();
        PhongBUS pbus = new PhongBUS();
        List<eLoaiPhong> listlp = new List<eLoaiPhong>();
        LoaiPhongBUS lpbus = new LoaiPhongBUS();
        JoinTable_BUS joinbus = new JoinTable_BUS();

        public frmHome()
        {
            InitializeComponent();
        }

        public frmHome(frmDangNhap sql)
        {
            InitializeComponent();
            frmDangNhap = sql;
        }

        private void timerDateSystem_Tick(object sender, EventArgs e)
        {
            DateTime time = DateTime.Now;
            this.lblTime.Text = time.ToString();
        }

        public string tenloaiphong(string maLoaiPhong)
        {

            foreach (var item in lpbus.getall())
            {
                if (item.MaLoaiPhong.Trim().Equals(maLoaiPhong))
                {
                    s = item.TenLoaiPhong;
                }
            }
            return s;
        }

        public double donGiaphong(string maLoaiPhong)
        {
            foreach (var item in lpbus.getall())
            {
                if (item.MaLoaiPhong.Trim().Equals(maLoaiPhong))
                {
                    donGia = item.DonGia;
                }
            }
            return donGia;
        }

        public void frmHome_Load(object sender, EventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            TaoGiaoDienPhong(pbus.getallp(), pbus.gettinhtrangp(false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng");            
        }
        /**Tạo sự kiện kích chuột phải vào label để lấy các thông tin trong label đó
         * ra truyền qua các form khác* */
        public void lblred_Click(object sender, MouseEventArgs e)
        {
            Label lbl = sender as Label;
            if (e.Button == MouseButtons.Right)
            {
                string[] list = lbl.Text.Split('\r');
                frmThanhToan.TenPhong = list[0];
                if (list[2].Substring(12, 10).Equals(" Phòng Vip"))
                {
                    frmThanhToan.LoaiPhong = list[2].Substring(12, 10);
                    frmDatPhong.TenPhong= list[0];
                    frmDatPhong.TenLoaiPhong= list[2].Substring(12, 10);
                }
                else
                {
                    frmDatPhong.TenLoaiPhong = list[2].Substring(12, 13); ;
                    frmThanhToan.LoaiPhong = list[2].Substring(12, 13);
                    frmDatPhong.TenPhong = list[0];
                }
                frmThanhToan.MaThue = list[4].Substring(15,15);
                frmDatPhong.maThue = list[4].Substring(15, 15);
            }
        }
        /**Tạo sự kiện kích chuột phải vào label để lấy các thông tin trong label đó
         * ra truyền qua các form khác
         * */
        private void lbl_ClickTP(object sender, MouseEventArgs e)
        {
            Label lbl = sender as Label;
            if (e.Button == MouseButtons.Right)
            {
                string[] list = lbl.Text.Split('\r');
                frmDatPhong.TenPhong = list[0];
                if (list[2].Substring(12, 10).Equals(" Phòng Vip"))
                {
                    frmDatPhong.TenLoaiPhong = list[2].Substring(12, 10);
                }
                else
                {
                    frmDatPhong.TenLoaiPhong = list[2].Substring(12, 13);
                }                            
            }
        }

        //Load giao diện các phòng trống và phòng có chứa khách hàng
        public void TaoGiaoDienPhong(List<ePhong> soPhong, List<ePhong> phongTrong, List<eHonLoan> coKhach, string title)
        {
            //Tạo ra một flowLayoutPanel để chứa các panel                   
            PhongBUS pbus = new PhongBUS();
            FlowLayoutPanel flowLayoutPanel3 = new FlowLayoutPanel();
            flowLayoutPanel3.AutoSize = true;
            flowLayoutPanel3.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            flowLayoutPanel1.Controls.Add(flowLayoutPanel3);
            Label text = new Label();
            text.Size = new Size(1850, 30);
            text.TextAlign = ContentAlignment.TopCenter;
            text.Text = title;
            flowLayoutPanel3.Controls.Add(text);
            //Tạo các label để chứa thông tin, màu sắc thể hiện các phòng
            foreach (var item in soPhong)
            {
                DevExpress.XtraEditors.PanelControl P0001 = new DevExpress.XtraEditors.PanelControl();
                Label lbl = new Label();
                flowLayoutPanel3.Controls.Add(P0001);
                P0001.Appearance.Options.UseBackColor = true;
                P0001.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
                P0001.Controls.Add(lbl);
                P0001.Location = new Point(3, 3);
                P0001.Name = item.MaPhong;
                P0001.Size = new Size(256, 163);
                lbl.Font = new Font("Tahoma", 10F);
                lbl.Dock = DockStyle.Fill;
                lbl.Size = new Size(252, 159);
                lbl.Text = item.TenPhong;
                lbl.TextAlign = ContentAlignment.TopCenter;
            }
            //Load thông tin của phòng trống vào từng label
            foreach (var item in phongTrong)
            {
                foreach (var pnl in flowLayoutPanel3.Controls.OfType<DevExpress.XtraEditors.PanelControl>())
                {
                    if (pnl.Name.Equals(item.MaPhong.Trim()))
                    {
                        pnl.BackColor = Color.LawnGreen;
                        foreach (var lbl in pnl.Controls.OfType<Label>())
                        {
                            lbl.BackColor = Color.LawnGreen;
                            lbl.Text = item.TenPhong + "\r\n\r\nLoại phòng: Phòng " + tenloaiphong(item.MaLoaiPhong.Trim()) + "\r\n\r\nGiá phòng: " + donGiaphong(item.MaLoaiPhong.Trim());
                            lbl.MouseDown += new MouseEventHandler(lbl_ClickTP);
                            lbl.ContextMenuStrip = cmnstrpSanSang;
                        }
                    }
                }
            }
            //Load thông tin của phòng đang có khách vào từng label
            foreach (var item in coKhach)
            {
                string[] s = { item.MaThue, item.MaPhong };
                foreach (var pnl in flowLayoutPanel3.Controls.OfType<DevExpress.XtraEditors.PanelControl>())
                {
                    if (pnl.Name.Equals(item.MaPhong.Trim()))
                    {
                        pnl.BackColor = Color.Red;
                        foreach (var lbl in pnl.Controls.OfType<Label>())
                        {
                            lbl.BackColor = Color.Red;
                            if (item.NgayTra < DateTime.Now)
                            {
                                lbl.Text = item.TenPhong + "\r\r\nLoại phòng: Phòng " + tenloaiphong(item.MaLoaiPhong.Trim()) + "\r\r\nMã thuê phòng: " + item.MaThue + "\r\r\nNgày trả: " + DateTime.Now.Date.ToShortDateString();
                            }
                            else
                            {
                                lbl.Text = item.TenPhong + "\r\r\nLoại phòng: Phòng " + tenloaiphong(item.MaLoaiPhong.Trim()) + "\r\r\nMã thuê phòng: " + item.MaThue + "\r\r\nNgày trả: " + item.NgayTra.Date.ToShortDateString();
                            }
                            lbl.MouseDown += new MouseEventHandler(lblred_Click);
                            lbl.ContextMenuStrip = cmnstrpCoKhach;
                        }
                    }
                }
            }

        }
        //Lọc các phòng trống có trong hệ thống
        private void toggleSwitchSS_Toggled(object sender, EventArgs e)
        {
            foreach (var item in flowLayoutPanel1.Controls.OfType<FlowLayoutPanel>())
            {
                if (toggleSwitchSS.IsOn != true)
                {
                    int s = 0;
                    foreach (var pnl in item.Controls.OfType<DevExpress.XtraEditors.PanelControl>())
                    {
                        if (pnl.BackColor == Color.LawnGreen)
                        {
                            s++;
                        }
                        pnl.Show();
                    }
                    this.toggleSwitchSS.Properties.OffText = "Sẵn sàng " + s.ToString();
                }
                else
                {
                    int s = 0;
                    foreach (var pnl in item.Controls.OfType<DevExpress.XtraEditors.PanelControl>())
                    {
                        if (pnl.BackColor != Color.LawnGreen)
                        {
                            pnl.Hide();
                        }
                        else
                        {
                            s++;
                        }
                    }
                    this.toggleSwitchSS.Properties.OnText = "Sẵn sàng " + s.ToString();
                }
            }
           
        }
        //Lọc các phòng đang có khách ở
        private void toggleSwitchCK_Toggled(object sender, EventArgs e)
        {
            foreach (var item in flowLayoutPanel1.Controls.OfType<FlowLayoutPanel>())
            {
                if (toggleSwitchCK.IsOn != true)
                {
                    int s = 0;
                    foreach (var pnl in item.Controls.OfType<DevExpress.XtraEditors.PanelControl>())
                    {
                        if (pnl.BackColor == Color.Red)
                        {
                            s++;
                        }
                        pnl.Show();
                    }
                    this.toggleSwitchCK.Properties.OffText = "Có khách " + s.ToString();
                }
                else
                {
                    int s = 0;
                    foreach (var pnl in item.Controls.OfType<DevExpress.XtraEditors.PanelControl>())
                    {
                        if (pnl.BackColor != Color.Red)
                        {
                            pnl.Hide();
                        }
                        else
                        {
                            s++;
                        }
                    }
                    this.toggleSwitchCK.Properties.OnText = "Có khách " + s.ToString();
                }
            }          
        }

        private void btnDatPhong_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmDatPhong frm = new frmDatPhong(this);
            frm.ShowDialog();
        }

        private void btndmk_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmDoiMK frm = new frmDoiMK();
            frm.ShowDialog();
        }

        private void btndv_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmDichVu frm = new frmDichVu();
            frm.ShowDialog();
        }

        private void btnphong_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmPhong frm = new frmPhong();
            frm.ShowDialog();
        }

        private void btnKH_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmKhachHang frm = new frmKhachHang();
            frm.ShowDialog();
        }

        private void btnNV_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmNhanVien frm = new frmNhanVien();
            frm.ShowDialog();
        }

        private void traPhongToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmThanhToan frm = new frmThanhToan(this);
            frm.ShowDialog();
        }

        private void DatPhongToolStripMenuItem_Click(object sender, EventArgs e)
        {       
            frmDatPhong frm = new frmDatPhong(this);
            frm.ShowDialog();
        }

        private void back_login()
        {
            Application.Run(new frmDangNhap());
        }

        private void btnDangXuat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            isDangXuat = true;
            DialogResult ds = MessageBox.Show("Bạn Có Muốn Đăng Xuất ?", "Đăng xuất", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ds == DialogResult.Yes)
            {
                Thread th = new Thread(back_login);
#pragma warning disable CS0618 // Type or member is obsolete
                th.ApartmentState = ApartmentState.STA;
#pragma warning restore CS0618 // Type or member is obsolete

                th.Start();

                this.Close();
            }
            else
            {
                return;
            }
        }

        private void frmHome_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (isDead == false)
            {
                if (!isDangXuat)
                {
                    DialogResult ds = MessageBox.Show("Bạn Có Muốn Thoát ?", "Thoát", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ds == DialogResult.Yes)
                    {
                        Environment.Exit(0);
                    }
                    else
                    {
                        e.Cancel = true;
                    }
                }
            }
        }

        public void cleanGiaoDien()
        {
            foreach (var item in flowLayoutPanel1.Controls.OfType<FlowLayoutPanel>())
            {
                item.Hide();
            }
            FlowLayoutPanel flowLayoutPanel3 = new FlowLayoutPanel();
            flowLayoutPanel3.AutoSize = true;
            flowLayoutPanel3.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            flowLayoutPanel1.Controls.Add(flowLayoutPanel3);
        }

        private void dtpNgayTra_ValueChanged(object sender, EventArgs e)
        {
            cleanGiaoDien();
            List<ePhong> phRong = new List<ePhong>();
            List<ePhong> phKhach = new List<ePhong>();
            PhongBUS pbus = new PhongBUS();
            foreach (var item in joinbus.GetPhog_TraVaoNgay(true, 0,Convert.ToDateTime(dtpNgayTra.Text)))
            {
                pbus.getEPhong_byID(item.MaPhong);
                phKhach.Add(pbus.getEPhong_byID(item.MaPhong));
            }
            TaoGiaoDienPhong(phKhach, phRong, joinbus.GetPhog_TraVaoNgay(true, 0, Convert.ToDateTime(dtpNgayTra.Text)), "Phòng trả trong ngày: "+dtpNgayTra.Text );
        }

        private void btn500_ItemClick(object sender, ItemClickEventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            LoaiPhongBUS lpbus = new LoaiPhongBUS();
            foreach (var item in lpbus.getDOnGia(0,500000))
            {
                TaoGiaoDienPhong(pbus.getLoaiPhong(item.MaLoaiPhong), pbus.getLoaiPhong_Trong(item.MaLoaiPhong, false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng dưới 500,000 đồng");
            }         
        }

        private void btnTheoPhong_ItemClick(object sender, ItemClickEventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            TaoGiaoDienPhong(pbus.getallp(), pbus.gettinhtrangp(false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng");
        }

        private void btnTheoLoaiPhong_ItemClick(object sender, ItemClickEventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            LoaiPhongBUS lpbus = new LoaiPhongBUS();
            TaoGiaoDienPhong(pbus.getLoaiPhong(lpbus.getma_ByTen("Normal")), pbus.getLoaiPhong_Trong(lpbus.getma_ByTen("Normal"), false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng Normal");
            TaoGiaoDienPhong(pbus.getLoaiPhong(lpbus.getma_ByTen("Double")), pbus.getLoaiPhong_Trong(lpbus.getma_ByTen("Double"), false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng Double");
            TaoGiaoDienPhong(pbus.getLoaiPhong(lpbus.getma_ByTen("Triple")), pbus.getLoaiPhong_Trong(lpbus.getma_ByTen("Triple"), false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng Triple");
            TaoGiaoDienPhong(pbus.getLoaiPhong(lpbus.getma_ByTen("Family")), pbus.getLoaiPhong_Trong(lpbus.getma_ByTen("Family"), false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng Family");
            TaoGiaoDienPhong(pbus.getLoaiPhong(lpbus.getma_ByTen("Vip")), pbus.getLoaiPhong_Trong(lpbus.getma_ByTen("Vip"), false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng Vip");
            TaoGiaoDienPhong(pbus.getLoaiPhong(lpbus.getma_ByTen("Deluxe")), pbus.getLoaiPhong_Trong(lpbus.getma_ByTen("Deluxe"), false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng Deluxe");
        }

        private void btnTheoTang_ItemClick(object sender, ItemClickEventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            foreach (var item in pbus.Tang())
            {
                TaoGiaoDienPhong(pbus.getTang(item.ToString()), pbus.getTang_PhongTrong(item.ToString(), false), joinbus.GetPhong_ThuePhong(true, 0), "Tầng " + item.ToString());
            }

        }

        private void btn1000_ItemClick(object sender, ItemClickEventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            LoaiPhongBUS lpbus = new LoaiPhongBUS();
            foreach (var item in lpbus.getDOnGia(500000, 1000000))
            {
                TaoGiaoDienPhong(pbus.getLoaiPhong(item.MaLoaiPhong), pbus.getLoaiPhong_Trong(item.MaLoaiPhong, false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng 500,000 đồng đến 1 triệu đồng");
            }
        }

        private void btn1500_ItemClick(object sender, ItemClickEventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            LoaiPhongBUS lpbus = new LoaiPhongBUS();
            foreach (var item in lpbus.getDOnGia(1000000, 1500000))
            {
                TaoGiaoDienPhong(pbus.getLoaiPhong(item.MaLoaiPhong), pbus.getLoaiPhong_Trong(item.MaLoaiPhong, false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng 1 triệu đồng đến 1 triệu 500 nghìn đồng");
            }
        }

        private void btnHon1500_ItemClick(object sender, ItemClickEventArgs e)
        {
            cleanGiaoDien();
            PhongBUS pbus = new PhongBUS();
            LoaiPhongBUS lpbus = new LoaiPhongBUS();
            foreach (var item in lpbus.getDOnGia(1500000, int.MaxValue))
            {
                TaoGiaoDienPhong(pbus.getLoaiPhong(item.MaLoaiPhong), pbus.getLoaiPhong_Trong(item.MaLoaiPhong, false), joinbus.GetPhong_ThuePhong(true, 0), "Phòng trên 1 triệu 500 nghìn đồng");
            }
        }

        private void ThemDichVuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmDatPhong frm = new frmDatPhong("Cập nhật dịch vụ");
            frm.ShowDialog();
        }

        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void lblTime_Click(object sender, EventArgs e)
        {

        }

        private void thongTinKHToolStripMenuItem_Click(object sender, EventArgs e)
        {
         
        }

        private void btnQLPhong_ItemClick(object sender, ItemClickEventArgs e)
        {
            frmPhong frm = new frmPhong();
            frm.ShowDialog();
        }

        private void btnQLNhanVien_ItemClick(object sender, ItemClickEventArgs e)
        {
            frmNhanVien frm = new frmNhanVien();
            frm.ShowDialog();
        }

        private void ntnQlyDichVu_ItemClick(object sender, ItemClickEventArgs e)
        {
            frmDichVu frm = new frmDichVu();
            frm.ShowDialog();
        }
    }
}
