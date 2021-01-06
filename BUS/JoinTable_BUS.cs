using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;
using DAL;

namespace BUS
{
    public class JoinTable_BUS
    {
        JoinTable_DAL joindal = new JoinTable_DAL();

        public List<eHonLoan> GetPhong_ThuePhong(bool s, int TrangThai)
        {
            return joindal.GetPhong_ThuePhong(s, TrangThai);
        }

        public List<eHonLoan> GetPhog_TraVaoNgay(bool s, int trangThai, DateTime date)
        {
            return joindal.GetPhog_TraVaoNgay(s, trangThai, date);
        }
    }
}
