using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;
using DAL;

namespace BUS
{
  public  class NhanVienBUS
    {
        NhanVienDAL ndal = new NhanVienDAL();
        public List<eNhanVien> getallnv()
        {
            return ndal.getnv();
        }
        public int InsertNhanVien(eNhanVien p)
        {
            return ndal.insertNhanVien(p);
        }
        public void SuaNV(eNhanVien p)
        {
            ndal.updateNhanVien(p);
        }
        public bool XoaNV(string maNV)
        {
            return ndal.deleteNhanVien(maNV);
        }
        public eNhanVien tangma()
        {
            return ndal.maTangTuDong();
        }
        public List<eNhanVien> getallMaNV(string s)
        {
            return ndal.getAllMa(s);
        }
        public List<eNhanVien> getallTenNV(string s)
        {
            return ndal.getAllTen(s);
        }
        public List<eNhanVien> getallCMNDNV(string s)
        {
            return ndal.getAllCMND(s);
        }
        public List<eNhanVien> getallSoDTNV(string s)
        {
            return ndal.getAllSoDT(s);
        }
        //public bool GetTKQL(string email, string pass)
        //{
        //    return ndal.GetTKQL(email, pass);
        //}
        //public bool GetTKNV(string email, string pass)
        //{
        //    return ndal.GetTKNV(email, pass);
        //}
        //public string getmaNV_byEmail(string email)
        //{
        //    return ndal.getmaNV_byEmail(email);
        //}
        public string getenNV_ByID(string id)
        {
            return ndal.getenNV_ByID(id);
        }
    }
}
