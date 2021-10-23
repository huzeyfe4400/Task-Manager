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
    public partial class Gorev : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null && Session["KullaniciTipId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Request.QueryString["islem"] == "Ok")
            {
                string taskid = Request.QueryString["TaskId"].ToString();
                GorevGuncelle("2", taskid);
            }
            if (Request.QueryString["islem"] == "Hold")
            {
                string taskid = Request.QueryString["TaskId"].ToString();
                GorevGuncelle("1", taskid);
            }
            KayitListele();
        }

        protected void GorevGuncelle(string status, string TaskId)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);

                string sql = @"UPDATE Task_List SET Status='"+status+"' Where TaskId="+ TaskId + "";
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
                lblIslemSonuc.Text = "Görev Başarıyla Güncellendi";
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


        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["TaskManager"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = @"SELECT List.*,Kullanici.KullaniciAd FROM Task_List List LEFT OUTER JOIN Task_Kullanici Kullanici ON List.TaskKullaniciId=Kullanici.KullaniciId";
                if (Session["KullaniciTipId"].ToString() == "2")
                {
                    sql += " WHERE List.TaskKullaniciId='" + Session["KullaniciId"].ToString() + "'";
                }
                using (SqlCommand cmd = new SqlCommand(sql))
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