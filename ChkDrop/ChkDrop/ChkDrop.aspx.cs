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

        private class Info {
            public string Str { get; set; }
        }

        private const int MAX_INFO = 4;
        private const int MAX_INFOS = 3;


        private List<List<Info>> MkInfos()
        {
            List<List<Info>> ans = new List<List<Info>>();
            for (int i = 1; i <= MAX_INFOS; ++i)
            {
                List<Info> infos = new List<Info>();
                for (int j = 1; j <= MAX_INFO; ++j)
                {
                    Info inf = new Info();
                    inf.Str = i + "_" + j;
                    infos.Add(inf);
                }
                ans.Add(infos);
            }
            return ans;
        }

        class Span : WebControl
        {
            public string Text { get; set; }
            public Span() : base(HtmlTextWriterTag.Span)
            {
            }

            protected override void RenderContents(HtmlTextWriter writer)
            {
                base.RenderContents(writer);
                writer.Write(Text);
            }
        }

        class Td : HtmlTableCell
        {
            public int ColNo { get; set; }
            public Td(Info inf, int rowno, int colno)
            {
                Span span = new Span();
                span.Text = inf.Str;
                span.ID = "o" + rowno + "_" + colno;
                span.CssClass = "DragBody";
                this.Controls.Add(span);
                this.ID = "p" + rowno + "_" + colno;
                this.Attributes["class"] = "DropBody";
            }
        }
 
        class Tr : HtmlTableRow
        {
            public Tr(List<Info> list, int rowno)
            {
                for (int i = 1; i <= list.Count; ++i)
                {
                    Td td = new Td(list[i - 1], rowno, i);
                    this.Controls.Add(td);
                }
            }
        }

        private void MkTbBody(List<List<Info>> infos)
        {
            for (int i = 1; i <= infos.Count; ++i)
            {
                Tr tr = new Tr(infos[i - 1], i);
                tr.ID = "row" + i;
                TableBody.Controls.Add(tr);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["infos"] = MkInfos();
                MkTbBody((List<List<Info>>) Session["infos"]);
                return;
            }
            string target = Request.Form[TARG];
            string obj = Request.Form[OBJ];
            Label1.Text = target + " " + obj;
            //foreach (string  k in Request.Params.Keys) {
            //    Label1.Text = Label1.Text + "<br/>" + k + "=" + Request.Params[k];
            //}
            MkTbBody((List<List<Info>>)Session["infos"]);
            return;

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