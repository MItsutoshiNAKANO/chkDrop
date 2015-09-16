using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;

namespace ChkDrop
{
    public partial class ChkDrop : System.Web.UI.Page
    {
        private const string TARG = "target";
        private const string OBJ = "obj";
   

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string target = Request.Form[TARG];
                string obj = Request.Form[OBJ];
                Label1.Text = target + " " + obj;
                //foreach (string  k in Request.Params.Keys) {
                //    Label1.Text = Label1.Text + "<br/>" + k + "=" + Request.Params[k];
                //}
                return;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try {
                Label1.Text = e.ToString() + " " + sender.ToString();
            } catch (HttpException er) {
                Label1.Text = er.StackTrace;
            } finally
            {
            }

        }
    }
}