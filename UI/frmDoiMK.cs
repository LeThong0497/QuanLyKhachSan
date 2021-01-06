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

namespace Home
{
    public partial class frmDoiMK : DevExpress.XtraEditors.XtraForm
    {
        public frmDoiMK()
        {
            InitializeComponent();
        }

        private void chkDMK_CheckedChanged(object sender, EventArgs e)
        {
            if (chkDMK.Checked)
            {
                panel.Enabled = true;
            }
            else
            {
                panel.Enabled = false;
            }
        }
    }
}