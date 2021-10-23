using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskManager
{
    public partial class Kullanici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null && Session["KullaniciTipId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            KayitListele();
        }

        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Kullanici.KullaniciAd,Kullanici.KullaniciEposta,KullaniciSoyad,Tip.KullaniciTip FROM Task_Kullanici Kullanici LEFT OUTER JOIN Task_Kullanici_Tip Tip ON Kullanici.KullaniciTipId=Tip.KullaniciTipId"))
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

        protected void KayitListele()
        {
            lvListe.DataSource = GetData();
            lvListe.DataBind();

        }

        protected void test_Click(object sender, EventArgs e)
        {
            Response.Redirect("GorevEkle.aspx");
        }
    }
}