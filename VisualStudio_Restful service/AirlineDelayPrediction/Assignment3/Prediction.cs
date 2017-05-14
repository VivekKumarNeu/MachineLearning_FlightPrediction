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
    public class Prediction
    {
        public static void predict(PredictedValueClass pro,TextBox txtRegression)
        {
            string apiKey = "xY7y2pEuEEuC15hNAVsWyOgLb17wfTSYXeVrCZ/ItnWTSLOtBxR8o897nctz3SAk4wtCfGebpz10iMC8YpZCng==";
            string url = "https://ussouthcentral.services.azureml.net/workspaces/8ac8e85e1193499f96198bb430b8dfcf/services/cc0caa25467f4741b3e441e2e569013d/execute?api-version=2.0&details=true";       
            predict(pro,apiKey, url, txtRegression);
        }

        public static void predict(PredictedValueClass pro,string api, string uri, TextBox txtBox)
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
                                ColumnNames = new string[] { "DayofMonth", "DayOfWeek", "ArrTime", "FlightNum", "DepDelay", "Hour", "VisibilityMPH", },
                                Values = new string[,] {  { pro.day_value , pro.dayofweek_value, pro.arrivalTime_value,pro.flightNum_value,pro.departureDelay_value, pro.hour_value,pro.visibility_value },  }

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
                    txtBox.Text = responseBody.Results.output1.value.Values[0][7];
                }
            }
        }
        
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

    }
}