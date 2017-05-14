using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class ArrivalDelay : System.Web.UI.Page
    {
        public static void InitializeDictionary(Dictionary<string, string> dictionary)
        {
            dictionary.Add("Monday", "0");
            dictionary.Add("Tuesday", "1");
            dictionary.Add("Wednesday", "2");
            dictionary.Add("Thursday", "3");
            dictionary.Add("Friday", "4");
            dictionary.Add("Saturday", "5");
            dictionary.Add("Sunday", "6");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void do_Prediction(object sender, EventArgs e)
        {
            Dictionary<string, string> dictionary =
                 new Dictionary<string, string>();
            InitializeDictionary(dictionary);
            PredictedValueClass predicted = new PredictedValueClass();
            predicted.date_value = txtBoxDate.Text;
            predicted.hour_value = txtDropBoxHour.Text;
            predicted.arrivalTime_value = txtArrivalTime.Text;
            predicted.departureDelay_value = txtDepartureDelay.Text;
            predicted.flightNum_value = txtFlightNum.Text;
            predicted.visibility_value = txtVisibility.Text;
            string dateTime = predicted.date_value;
            DateTime dt = Convert.ToDateTime(dateTime);
            predicted.day_value = dt.Day.ToString();
            predicted.dayofweek_value = dictionary[dt.DayOfWeek.ToString()];
            Prediction.predict(predicted, txtRegression);
        }
    }
}