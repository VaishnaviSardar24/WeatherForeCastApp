using System;
using System.Net;
using Newtonsoft.Json.Linq;

namespace WeatherForecastApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void btnWeather_Click(object sender, EventArgs e)
        {
            try
            {
                string city = txtCity.Text.Trim();

                string apiKey = "f92f745a2863003a65c8a163a603ae72";

                string url =
                "https://api.openweathermap.org/data/2.5/weather?q="
                + city +
                "&appid=" + apiKey +
                "&units=metric";

                using (WebClient client = new WebClient())
                {
                    string response =
                    client.DownloadString(url);

                    JObject data =
                    JObject.Parse(response);

                    lblCity.Text = city;

                    string temp =
                    data["main"]["temp"].ToString();

                    lblTemp.Text =
                    temp + " °C";

                    lblTemp2.Text =
                    temp + " °C";

                    lblHumidity.Text =
                    data["main"]["humidity"].ToString() + "%";

                    lblWind.Text =
                    data["wind"]["speed"].ToString() + " km/h";

                    string weather =
                    data["weather"][0]["description"].ToString();

                    lblWeather.Text = weather;

                    lblCondition.Text = weather;
                }
            }
            catch (Exception ex)
            {
                lblCity.Text = "";
                lblTemp.Text = "";
                lblHumidity.Text = "";
                lblWind.Text = "";
                lblWeather.Text = "";

                lblCondition.Text =
                "Error";
            }
        }
    }
}