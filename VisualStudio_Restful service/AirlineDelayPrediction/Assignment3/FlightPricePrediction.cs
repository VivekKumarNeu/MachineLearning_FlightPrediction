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

    public class StringTablepricepred
    {
        public string[] ColumnNames { get; set; }
        public string[,] Values { get; set; }
    }

    class FlightPricePrediction
    {

        public static void classify(PredictedValueClass pro, TextBox txtBox1)
        {
            string apiKey = "uT/tI1EzmRF15RVzGcPpgnwEXyUivx5ucb0LCePwpK+6aN5DNVDh4zFcej1qysS/ELfK/Ww3CMgLkC4tnwssuw==";
            string url = "https://ussouthcentral.services.azureml.net/workspaces/8ac8e85e1193499f96198bb430b8dfcf/services/dd23d43566cc4514aea0bde2bd1d7c2c/execute?api-version=2.0&details=true";
            calculate(apiKey, url, txtBox1, pro);
        }

        public static void calculate(string api, string uri, TextBox txtBox, PredictedValueClass pro)
        {
            using (var client = new HttpClient())
            {
                var scoreRequest = new
                {

                    Inputs = new Dictionary<string, StringTablepricepred>() {
                        {
                            "input1",
                            new StringTablepricepred()
                            {
                                ColumnNames = new string[] { "Month", "UniqueCarrier", "Origin", "Dest",},
                                Values = new string[,] {  {pro.Monthvalue,pro.CarrierName,pro.origin_value,pro.destination_value  },  }
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
                    txtBox.Text = responseBody.Results.output1.value.Values[0][4];
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