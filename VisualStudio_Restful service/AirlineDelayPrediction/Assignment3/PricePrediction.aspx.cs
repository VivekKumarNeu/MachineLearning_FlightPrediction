using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class PricePrediction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PredictedValueClass pricepredication = new PredictedValueClass();
            pricepredication.CarrierName = txtBoxcarrierName.Text;
            pricepredication.destination_value = txtBoxDestination.Text;
            pricepredication.origin_value = txtBoxOrigin.Text;
            pricepredication.Monthvalue = txtDropBoxHour.Text;

            FlightPricePrediction.classify(pricepredication, predictflight);

            //Classification.classify(predicted, txtclassification);
        }
    }
}