using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskManager
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] == null && Session["KullaniciTipId"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            Response.Redirect("Gorev.aspx");
        }
    }
}