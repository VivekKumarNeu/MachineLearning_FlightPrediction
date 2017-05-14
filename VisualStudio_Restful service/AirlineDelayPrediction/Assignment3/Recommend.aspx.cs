using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Recommend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void do_suggest(object sender, EventArgs e)
        {
            Recommendation.recommend("luftansa", "7", txtUser.Text, tableSuggestions);
        }
    }
}