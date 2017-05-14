using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Predict : System.Web.UI.Page
    {

    
        protected void do_Prediction(object sender, EventArgs e)
        {
            PredictedValueClass predicted=new PredictedValueClass();
            predicted.destination_value = txtBoxDest.Text;
            predicted.origin_value = txtBoxOrigin.Text;
            predicted.date_value = txtBoxDate.Text;
            predicted.hour_value = txtDropBoxHour.Text;
            predicted.flightNum_value = txtFlightNum.Text;
            predicted.temp_value = txtTemperature.Text;
            predicted.seaLevelPressure_value = txtSeaLevelPressure.Text;
            predicted.visibility_value = txtVisiblity.Text;
            Classification.classify(predicted, txtclassification);
        }
    }
}