using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskManager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            data = GirisYap();
            if (data.Rows.Count>0)
            {
                DataRow dr = data.Rows[0];
                Session["KullaniciId"] = dr["KullaniciId"].ToString();
                Session["KullaniciTipId"] = dr["KullaniciTipId"].ToString();
                Session["KullaniciAd"] = dr["KullaniciAd"].ToString();
                Session["KullaniciSoyad"] = dr["KullaniciSoyad"].ToString();
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblIslemSonuc.Text = "Kullanıcı Giriş Bilgileri Hatalı!";
                lblIslemSonuc.CssClass = "islemHatali";
                lblIslemSonuc.Visible = true;
            }
        }

        public static string MD5Sifrele(string sifrelenecekVeri)
        {
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] b1 = System.Text.Encoding.UTF8.GetBytes(sifrelenecekVeri);

            byte[] hash = md5.ComputeHash(b1);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }

        private DataTable GirisYap()
        {
            string Sifre = MD5Sifrele(txtSifre.Text);
            string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Task_Kullanici WHERE KullaniciEposta='" + txtKullaniciAd .Text+ "' AND KullaniciSifre='"+ Sifre+ "'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
    }
}