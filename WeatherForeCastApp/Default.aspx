<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WeatherForecastApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

<title>Weather Forecast App</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Segoe UI',sans-serif;
    height:100vh;
    overflow:hidden;

    background:
    linear-gradient(rgba(0,0,0,0.35),
    rgba(0,0,0,0.35)),
    url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=2070');

    background-size:cover;
    background-position:center;

    color:white;
}

/* NAVBAR */

.navbar{

    width:100%;
    height:70px;

    background:rgba(0,0,0,0.20);

    backdrop-filter:blur(10px);

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:0 40px;
}

.logo{
    font-size:30px;
    font-weight:bold;
}

.logo span{
    color:#7df9ff;
}

.menu a{
    color:white;
    text-decoration:none;
    margin-left:25px;
    font-size:18px;
    transition:0.3s;
}

.menu a:hover{
    color:#7df9ff;
}

/* MAIN SECTION */

.main-container{

    height:calc(100vh - 140px);

    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

    padding:10px;
}

.title{
    font-size:50px;
    font-weight:bold;
    text-align:center;
}

.title span{
    color:#7df9ff;
}

.subtitle{
    margin-top:8px;
    font-size:20px;
}

/* SEARCH */

.search-section{

    margin-top:25px;

    display:flex;
    gap:15px;
}

.input-city{

    width:450px;

    padding:16px;

    border:none;

    border-radius:15px;

    font-size:18px;

    outline:none;
}

.search-btn{

    padding:16px 30px;

    border:none;

    border-radius:15px;

    background:#007BFF;

    color:white;

    font-size:18px;

    cursor:pointer;

    transition:0.3s;
}

.search-btn:hover{
    background:#0056b3;
}

/* WEATHER CARD */

.weather-card{

    width:88%;
    max-width:1150px;

    margin-top:25px;

    background:rgba(255,255,255,0.12);

    backdrop-filter:blur(15px);

    border-radius:25px;

    padding:25px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    box-shadow:0px 10px 30px rgba(0,0,0,0.4);
}

.left-side{
    width:38%;
}

.city{
    font-size:42px;
    font-weight:bold;
}

.temp{
    font-size:70px;
    margin-top:10px;
    font-weight:bold;
}

.weather{
    margin-top:8px;
    font-size:28px;
    text-transform:capitalize;
}

.right-side{

    width:58%;

    display:grid;

    grid-template-columns:repeat(2,1fr);

    gap:15px;
}

.info-box{

    background:rgba(255,255,255,0.12);

    padding:18px;

    border-radius:18px;

    text-align:center;
}

.info-box i{

    font-size:28px;

    margin-bottom:10px;

    color:#7df9ff;
}

.info-title{
    font-size:20px;
}

.info-value{

    margin-top:8px;

    font-size:28px;

    font-weight:bold;
}

/* FOOTER */

.footer{

    width:100%;
    height:70px;

    background:rgba(0,0,0,0.25);

    backdrop-filter:blur(10px);

    display:flex;
    justify-content:space-around;
    align-items:center;

    position:absolute;
    bottom:0;
}

.footer-item{

    display:flex;
    align-items:center;
    gap:10px;
}

.footer-item i{

    font-size:24px;

    color:#7df9ff;
}

.footer-item h3{
    font-size:16px;
}

.footer-item p{
    font-size:13px;
}

/* MOBILE */

@media(max-width:900px){

body{
    overflow:auto;
}

.main-container{
    height:auto;
}

.weather-card{
    flex-direction:column;
}

.left-side,
.right-side{
    width:100%;
}

.title{
    font-size:35px;
}

.input-city{
    width:250px;
}

.menu{
    display:none;
}

.footer{
    height:auto;
    padding:15px;
    flex-wrap:wrap;
    gap:15px;
    position:relative;
}

}

</style>

</head>

<body>

<form id="form1" runat="server">

<!-- NAVBAR -->

<div class="navbar">

<div class="logo">
☁️ <span>Weather Forecast App</span>
</div>

<div class="menu">
<a href="#">Home</a>
<a href="#">About</a>
<a href="#">Contact</a>
</div>

</div>

<!-- MAIN -->

<div class="main-container">

<div class="title">
Get Real-Time <span>Weather Forecast</span>
</div>

<div class="subtitle">
Enter any city name to get current weather information
</div>

<!-- SEARCH -->

<div class="search-section">

<asp:TextBox
ID="txtCity"
runat="server"
CssClass="input-city"
placeholder="Enter city name">
</asp:TextBox>

<asp:Button
ID="btnWeather"
runat="server"
Text="Get Weather"
CssClass="search-btn"
OnClick="btnWeather_Click" />

</div>

<!-- WEATHER CARD -->

<div class="weather-card">

<div class="left-side">

<div class="city">
<asp:Label ID="lblCity" runat="server"></asp:Label>
</div>

<div class="temp">
<asp:Label ID="lblTemp" runat="server"></asp:Label>
</div>

<div class="weather">
<asp:Label ID="lblWeather" runat="server"></asp:Label>
</div>

</div>

<div class="right-side">

<div class="info-box">

<i class="fa-solid fa-temperature-half"></i>

<div class="info-title">
Temperature
</div>

<div class="info-value">
<asp:Label ID="lblTemp2" runat="server"></asp:Label>
</div>

</div>

<div class="info-box">

<i class="fa-solid fa-droplet"></i>

<div class="info-title">
Humidity
</div>

<div class="info-value">
<asp:Label ID="lblHumidity" runat="server"></asp:Label>
</div>

</div>

<div class="info-box">

<i class="fa-solid fa-wind"></i>

<div class="info-title">
Wind Speed
</div>

<div class="info-value">
<asp:Label ID="lblWind" runat="server"></asp:Label>
</div>

</div>

<div class="info-box">

<i class="fa-solid fa-cloud"></i>

<div class="info-title">
Condition
</div>

<div class="info-value">
<asp:Label ID="lblCondition" runat="server"></asp:Label>
</div>

</div>

</div>

</div>

</div>

<!-- FOOTER -->

<div class="footer">

<div class="footer-item">

<i class="fa-solid fa-cloud"></i>

<div>
<h3>Weather Forecast App</h3>
<p>© 2025 All Rights Reserved</p>
</div>

</div>

<div class="footer-item">

<i class="fa-solid fa-tower-broadcast"></i>

<div>
<h3>Real-time Data</h3>
<p>Live weather updates</p>
</div>

</div>

<div class="footer-item">

<i class="fa-solid fa-crosshairs"></i>

<div>
<h3>Accurate Forecast</h3>
<p>Reliable information</p>
</div>

</div>

<div class="footer-item">

<i class="fa-solid fa-mobile-screen"></i>

<div>
<h3>Easy to Use</h3>
<p>Simple and Fast</p>
</div>

</div>

<div class="footer-item">

<i class="fa-solid fa-code"></i>

<div>
<h3>API Integration</h3>
<p>OpenWeather Real-time Data</p>
</div>

</div>

</div>

</div>

</form>

</body>

</html>