using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Configuration;
using System.Web.UI.WebControls;
namespace FinalProject
{

    public class StringTablePred
    {
        public string[] ColumnNames { get; set; }
        public string[,] Values { get; set; }
    }

    class Classification
    {

        public static void classify(PredictedValueClass pro, TextBox txtBox1)
        {
            string apiKey = "FtV6rX/k/I/ivZ4n/Hk0mkaiAy0GGmUrxCdNw72RbigP4pLvNZ2S0Rt0PUqxTT794yw4qyjfLwMr+/mDSUoe6A==";
            string url = "https://ussouthcentral.services.azureml.net/workspaces/8ac8e85e1193499f96198bb430b8dfcf/services/b7b5380abffe43d09185aaea5a5a4f77/execute?api-version=2.0&details=true";
            //string dateTime = pro.date_value;
            //DateTime dt = Convert.ToDateTime(dateTime);
            //pro.Month_value = dt.Month.ToString();
            //pro.DayOfWeek_value = dictionary[dt.DayOfWeek.ToString()];
            calculate(apiKey, url, txtBox1, pro);
        }



        public static void calculate(string api, string uri, TextBox txtBox, PredictedValueClass pro)
        {
            using (var client = new HttpClient())
            {
                var scoreRequest = new
                {

                    Inputs = new Dictionary<string, StringTablePred>() {
                        {
                            "input1",
                            new StringTablePred()
                            {
                                ColumnNames = new string[] { "FlightNum", "Hour", "TemperatureF", "Sea_Level_PressureIn","VisibilityMPH",},
                                Values = new string[,] {  { pro.flightNum_value , pro.hour_value, pro.temp_value,pro.seaLevelPressure_value,pro.visibility_value },  }
                            }
                        },
                    },
                    GlobalParameters = new Dictionary<string, string>()
                    {
                    }
                };
                string apiKey = api;
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);
                client.BaseAddress = new Uri(uri);
                HttpResponseMessage response = client.PostAsJsonAsync("", scoreRequest).Result;

                if (response.IsSuccessStatusCode)
                {
                    string Jsonresponse = response.Content.ReadAsStringAsync().Result;
                    var responseBody = JsonConvert.DeserializeObject<RRSResponseObject>(Jsonresponse);
                    if(responseBody.Results.output1.value.Values[0][5].Equals("1",StringComparison.Ordinal))
                        txtBox.Text = "Cancelled";
                    else
                    {
                        txtBox.Text = "Not Cancelled";
                    }
                }
            }
        }

        #region Helper class
        private class RRSResponseObject
        {
            public Results Results { get; set; }
        }

        private class Results
        {
            public Output1 output1 { get; set; }
        }

        private class Output1
        {
            public string type { get; set; }
            public Value value { get; set; }
        }

        private class Value
        {
            public string[] ColumnNames { get; set; }
            public string[] ColumnTypes { get; set; }
            public string[][] Values { get; set; }
        }

        #endregion
    }
}