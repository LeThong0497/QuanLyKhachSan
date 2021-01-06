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
using System.Threading;
using Entyti;
using BUS;

namespace Home
{
    public partial class frmDangNhap : DevExpress.XtraEditors.XtraForm
    {

        public frmDangNhap()
        {
            InitializeComponent();
        }

        private void open_frmMain()
        {
            Application.Run(new frmHome());
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            
            if (txtEmail.Text.Equals("admin")&& txtPass.Text.Equals("admin"))
            {
                Thread th = new Thread(open_frmMain);
                th.Start();
                this.Close();
            }
        }

        private void frmDangNhap_Load(object sender, EventArgs e)
        {

        }
    }
}