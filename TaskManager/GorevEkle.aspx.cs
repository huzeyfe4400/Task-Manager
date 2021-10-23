using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManager.Classes;

namespace TaskManager
{
    public partial class GorevEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null && Session["KullaniciTipId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                kullaniciListele();
            }
        }

        protected void kullaniciListele()
        {
            DataTable data = new DataTable();
            data = Kullanicilar();
            if (data.Rows.Count > 0)
            {
                dropKullanici.Items.Add(new ListItem("Seçiniz..", "0"));

                for (int i = 0; i < data.Rows.Count; i++)
                {
                    DataRow dr = data.Rows[i];

                    string kullaniciid = dr["KullaniciId"].ToString();
                    string kullanici = dr["KullaniciAd"].ToString() + " " + dr["KullaniciSoyad"].ToString() + "~" + dr["KullaniciEposta"].ToString();

                    dropKullanici.Items.Add(new ListItem(kullanici, kullaniciid));
                }
            }

            data.Dispose();
        }
        private DataTable Kullanicilar()
        {
            string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Task_Kullanici"))
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

        private string MD5Sifrele(object text)
        {
            throw new NotImplementedException();
        }

        protected void dropKullanici_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dropOncelik_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dropAciliyet_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);

                string sql = @"INSERT INTO Task_List(TaskBaslik,TaskIcerik,Status,TaskBitisTarih,TaskDokuman,TaskKullaniciId,Aciliyet,Oncelik)VALUES('" + txtbaslik.Text + "','" + txticerik.Text + "','0','" + txtSonTarih.Text + "','','" + dropKullanici.SelectedValue + "','" + dropAciliyet.SelectedValue + "','" + dropOncelik.SelectedValue + "')";
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
                lblIslemSonuc.Text = "Görev Kaydı Başarılı";
                lblIslemSonuc.CssClass = "islemBasarili";
                lblIslemSonuc.Visible = true;
                ePostaGonder();
            }
            catch (Exception exp)
            {
                lblIslemSonuc.Text = "Hata : " + exp.Message;
                lblIslemSonuc.CssClass = "islemHatali";
                lblIslemSonuc.Visible = true;
            }
        }

        protected void ePostaGonder()
        {
            string[] kullaniciDizi = dropKullanici.SelectedItem.Text.Split('~');
            if (kullaniciDizi[1].ToString().IndexOf('@') >= 0)
            {
                string KullaniciEposta = kullaniciDizi[1];
                string mailIcerik = "";
                mailIcerik += "<p>Yeni Göreviniz Task Manager sistemi üzerinden size atanmıştır.</p>";
                string gonderimSonucu = MailGonder.GmailUzerinden("Task Manager Sistemi", mailIcerik, KullaniciEposta);
                if (gonderimSonucu == "OK")
                {

                }
                else
                {
                    lblIslemSonuc.Text = "Mail gönderimi başarısız!";
                    lblIslemSonuc.CssClass = "islemHatali";
                    lblIslemSonuc.Visible = true;
                }
            }
        }
    }
}