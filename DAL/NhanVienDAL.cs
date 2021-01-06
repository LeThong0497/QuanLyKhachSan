using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entyti;

namespace DAL
{
   public class NhanVienDAL
    {
        dbQLKhachSanDataContext db = new dbQLKhachSanDataContext();
        public List<eNhanVien> getnv()
        {
            var listnv = (from x in db.NhanViens select x).ToList();
            List<eNhanVien> ls = new List<eNhanVien>();
            foreach (NhanVien item in listnv)
            {
                eNhanVien nv = new eNhanVien();
                nv.MaNV = item.maNV.Trim();
                nv.HoTen = item.tenNV;
                nv.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                nv.NgaySinh = Convert.ToDateTime(item.ngaySinh);
                nv.SoCMND = item.soCMND.Trim();
                nv.SoDT = item.soDT.Trim();
              //  nv.PassWord = item.passWord.Trim();
                nv.ChucVu = Convert.ToBoolean(item.chucVu); 
                ls.Add(nv);
            }
            return ls;
        }

        public int insertNhanVien(eNhanVien nvmoi)
        {
            NhanVien nvtemp = new NhanVien();
            nvtemp.maNV = nvmoi.MaNV;
            nvtemp.tenNV = nvmoi.HoTen;
            nvtemp.soCMND = nvmoi.SoCMND;
            nvtemp.soDT = nvmoi.SoDT;
            nvtemp.ngaySinh = Convert.ToDateTime(nvmoi.NgaySinh);
            nvtemp.gioiTinh = Convert.ToByte(nvmoi.GioiTinh);
            nvtemp.chucVu = Convert.ToByte(nvmoi.ChucVu);
            nvtemp.passWord = nvmoi.PassWord;
            db.NhanViens.InsertOnSubmit(nvtemp);
            db.SubmitChanges();
            return 1;
        }

        public void updateNhanVien(eNhanVien nvupdate)
        {
            IQueryable<NhanVien> nv = db.NhanViens.Where(x => x.maNV.Equals(nvupdate.MaNV));
            nv.First().tenNV = nvupdate.HoTen;
            nv.First().ngaySinh = nvupdate.NgaySinh;
            nv.First().passWord = nvupdate.PassWord;
            nv.First().soCMND = nvupdate.SoCMND;
            nv.First().soDT = nvupdate.SoDT;
            nv.First().chucVu = Convert.ToByte(nvupdate.ChucVu);
            nv.First().gioiTinh =Convert.ToByte(nvupdate.GioiTinh);
            db.SubmitChanges();
        }

        public bool deleteNhanVien(string maNV)
        {
            NhanVien nvtemp = db.NhanViens.Where(x => x.maNV == maNV).FirstOrDefault();
            if (nvtemp != null)
            {
                db.NhanViens.DeleteOnSubmit(nvtemp);
                db.SubmitChanges(); //cập nhật việc xóa vào CSDL
                return true; //xóa thành công
            }
            return false;
        }

        public eNhanVien maTangTuDong()
        {
            eNhanVien nv = new eNhanVien();
            NhanVien item = (from x in db.NhanViens orderby  x.maNV descending select x).FirstOrDefault();
            nv.MaNV = item.maNV;
            nv.HoTen = item.tenNV;
            nv.GioiTinh = Convert.ToBoolean(item.gioiTinh);
            nv.NgaySinh = Convert.ToDateTime(item.ngaySinh);
            nv.SoCMND = item.soCMND;
            nv.SoDT = item.soDT;
            nv.PassWord = item.passWord;
            nv.ChucVu = Convert.ToBoolean(item.chucVu);
            return nv;
        }

        public List<eNhanVien> getAllMa(string s)
        {
            var listnv = (from x in db.NhanViens where x.maNV.Contains(s) select x).ToList();
            List<eNhanVien> ls = new List<eNhanVien>();
            foreach (NhanVien item in listnv)
            {
                eNhanVien nv = new eNhanVien();
                nv.MaNV = item.maNV;
                nv.HoTen = item.tenNV;
                nv.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                nv.NgaySinh = Convert.ToDateTime(item.ngaySinh);
                nv.SoCMND = item.soCMND;
                nv.SoDT = item.soDT;
                nv.PassWord = item.passWord;
                nv.ChucVu = Convert.ToBoolean(item.chucVu);
                ls.Add(nv);
            }
            return ls;
        }

        public List<eNhanVien> getAllTen(string s)
        {
            var listnv = (from x in db.NhanViens where x.tenNV.Contains(s) select x).ToList();
            List<eNhanVien> ls = new List<eNhanVien>();
            foreach (NhanVien item in listnv)
            {
                eNhanVien nv = new eNhanVien();
                nv.MaNV = item.maNV;
                nv.HoTen = item.tenNV;
                nv.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                nv.NgaySinh = Convert.ToDateTime(item.ngaySinh);
                nv.SoCMND = item.soCMND;
                nv.SoDT = item.soDT;
                nv.PassWord = item.passWord;
                nv.ChucVu = Convert.ToBoolean(item.chucVu);
                ls.Add(nv);
            }
            return ls;
        }

        public List<eNhanVien> getAllCMND(string s)
        {
            var listnv = (from x in db.NhanViens where x.soCMND.Contains(s) select x).ToList();
            List<eNhanVien> ls = new List<eNhanVien>();
            foreach (NhanVien item in listnv)
            {
                eNhanVien nv = new eNhanVien();
                nv.MaNV = item.maNV;
                nv.HoTen = item.tenNV;
                nv.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                nv.NgaySinh = Convert.ToDateTime(item.ngaySinh);
                nv.SoCMND = item.soCMND;
                nv.SoDT = item.soDT;
                nv.PassWord = item.passWord;
                nv.ChucVu = Convert.ToBoolean(item.chucVu);
                ls.Add(nv);
            }
            return ls;
        }

        public List<eNhanVien> getAllSoDT(string s)
        {
            var listnv = (from x in db.NhanViens where x.soDT.Contains(s) select x).ToList();
            List<eNhanVien> ls = new List<eNhanVien>();
            foreach (NhanVien item in listnv)
            {
                eNhanVien nv = new eNhanVien();
                nv.MaNV = item.maNV;
                nv.HoTen = item.tenNV;
                nv.GioiTinh = Convert.ToBoolean(item.gioiTinh);
                nv.NgaySinh = Convert.ToDateTime(item.ngaySinh);
                nv.SoCMND = item.soCMND;
                nv.SoDT = item.soDT;
                nv.PassWord = item.passWord;
                nv.ChucVu = Convert.ToBoolean(item.chucVu);
                ls.Add(nv);
            }
            return ls;
        }

        public bool GetTKQL(string email, string pass)
        {
            var q = from x in db.NhanViens where x.chucVu == 0 && x.email.Equals(email) && x.passWord.Equals(pass) select x;
            if (q.Any())
            {
                return true;
            }
            else return false;
        }

        public bool GetTKNV(string email, string pass)
        {
            var q = from x in db.NhanViens where x.chucVu == 1 && x.email.Equals(email) && x.passWord.Equals(pass) select x;
            if (q.Any())
            {
                return true;
            }
            else return false;
        }

        public string getmaNV_byEmail(string email)
        {
            NhanVien nv = db.NhanViens.Where(x => x.email.Equals(email)).SingleOrDefault();
            return nv.maNV;
        }
        public string getenNV_ByID(string id)
        {
            NhanVien nv = db.NhanViens.Where(x => x.maNV.Equals(id)).SingleOrDefault();
            return nv.tenNV;
        }
    }
}
