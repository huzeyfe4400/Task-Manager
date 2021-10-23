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
    public partial class KullaniciEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null && Session["KullaniciTipId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                KullaniciTipDoldur();
            }
        }

        protected void KullaniciTipDoldur()
        {
            DataTable data = new DataTable();
            data = GetData();
            if (data.Rows.Count > 0)
            {
                dropKullaniciTip.Items.Add(new ListItem("Seçiniz..", "0"));

                for (int i = 0; i < data.Rows.Count; i++)
                {
                    DataRow dr = data.Rows[i];

                    string kullanicitipid = dr["KullaniciTipId"].ToString();
                    string kullanicitip = dr["KullaniciTip"].ToString();

                    dropKullaniciTip.Items.Add(new ListItem(kullanicitip, kullanicitipid));
                }
            }

            data.Dispose();

        }

        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Task_Kullanici_Tip"))
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

        protected void dropKullaniciTip_SelectedIndexChanged(object sender, EventArgs e)
        {

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
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                string Sifre = MD5Sifrele(txtSifre.Text);
                string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);

                string sql = @"INSERT INTO Task_Kullanici(KullaniciAd,KullaniciSoyad,KullaniciTipId,KullaniciSifre,KullaniciEposta)VALUES('" + txtAd.Text + "','" + txtSoyad.Text + "','" + dropKullaniciTip.SelectedValue + "','" + Sifre + "','" + txtEposta.Text + "')";
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        sda.InsertCommand = new SqlCommand(sql, con);
                        sda.InsertCommand.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();
                    }
                }
                lblIslemSonuc.Text = "Kullanıcı Kaydı Başarılı";
                lblIslemSonuc.CssClass = "islemBasarili";
                lblIslemSonuc.Visible = true;
            }
            catch (Exception exp)
            {
                lblIslemSonuc.Text = "Hata : " + exp.Message;
                lblIslemSonuc.CssClass = "islemHatali";
                lblIslemSonuc.Visible = true;
            }
        }
    }
}