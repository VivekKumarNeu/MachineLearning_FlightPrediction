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

    public class Recommendation
    {

        public static void recommend(string airline, string rating,string author,Table tblRecommendations)
        {
            string apiKey = "8Gh7KAwosKW5sh0Xd0t44KVMZPVNhpyqU7MoyQgYbPvy+8oc6tVBH5VSHh+9ERzXcD3jotZURpAk+4EbFejQ+g==";
            string url = "https://ussouthcentral.services.azureml.net/workspaces/8ac8e85e1193499f96198bb430b8dfcf/services/69725bbc10084f128addd80da08c37e0/execute?api-version=2.0&details=true";
            //string dateTime = pro.date_value;
            //DateTime dt = Convert.ToDateTime(dateTime);
            //pro.Month_value = dt.Month.ToString();
            //pro.DayOfWeek_value = dictionary[dt.DayOfWeek.ToString()];
            recommend(apiKey, url, airline, rating, author,tblRecommendations);
        }



        public static void recommend(string api,string uri,string airline, string rating,string author,Table tblRecommendations)
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
                                ColumnNames = new string[] { "author", "airline_name", "overall_rating", },
                                Values = new string[,] {  { author,airline,rating },  }
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
                    for(int i=1;i<4;i++)
                    {
                        TableRow tRow = new TableRow();
                        TableCell tCell = new TableCell();
                        TableCell tCell1 = new TableCell();
                        TableCell tCell2 = new TableCell();
                        tCell.Text = "Suggestion" + i;
                        tCell2.Text = responseBody.Results.output1.value.Values[0][i];
                        tRow.Cells.Add(tCell);
                        tRow.Cells.Add(tCell1);
                        tRow.Cells.Add(tCell2);
                        tblRecommendations.Rows.Add(tRow);
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