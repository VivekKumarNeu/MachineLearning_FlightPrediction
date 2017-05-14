<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Recommend.aspx.cs" Inherits="FinalProject.Recommend" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight Delay Prediction</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <!-- Bootstrap core CSS     -->
    <link href="assests/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link  href="assests/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link  href="assests/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link  href="assests/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link runat="server" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link runat="server" href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link  runat="server" href="assests/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script  src="assests/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script  src="assests/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script  src="assests/js/bootstrap-checkbox-radio-switch.js"></script>

	<!--  Charts Plugin -->
	<script  src="assests/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script  src="assests/js/bootstrap-notify.js"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script  src="assests/js/light-bootstrap-dashboard.js"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script  src="assests/js/demo.js"></script>
    <style>
        #tableSuggestions,th,td {
            border: 1px solid black;
        }
    </style>
    <script>
        $(document).ready(function() {
            $("#txtDropBoxHour").change(function () {
                var hour = $("#txtDropBoxHour").val();
                var newdate = $("#txtBoxDate").val().split('-');

                $.ajax({
                    type: "GET",
                    url: 'http://api.wunderground.com/api/2a9107686ea85180/history_' +
                    newdate[0] +
                    '' +
                    newdate[1] +
                    '' +
                    newdate[2] +
                    '/q/NY/NewYork.xml',
                    dataType: "xml",
                    success: function (xml) {
                        var temperature = $(xml).find('meantempi')[0].childNodes[0].nodeValue;
                        var dewpoint = $(xml).find('meandewpti')[0].childNodes[0].nodeValue;
                        var humidtymin = $(xml).find('minhumidity')[0].childNodes[0].nodeValue;
                        var humidtymax = $(xml).find('maxhumidity')[0].childNodes[0].nodeValue;
                        var humidty = (parseFloat(humidtymin) + parseFloat(humidtymax)) / 2;
                        var sealevel = $(xml).find('meanpressurei')[0].childNodes[0].nodeValue;
                        var visi = $(xml).find('visi')[0].childNodes[0].nodeValue;
                        var winddegrees = $(xml).find('meanwdird')[0].childNodes[0].nodeValue;
                        $("#txtTemperature").val(temperature);
                        $("#txtVisiblity").val(visi);
                        $("#txtSeaLevelPressure").val(sealevel);
                    }

                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

     <div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="assests/img/sidebar-5.jpg">

    <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->

        <div class="sidebar-wrapper">
            <div class="logo"><h3>
                Flight Prediction Engine</h3>
            </div>

            <ul class="nav">
                <li class="active">
                    <a href="/">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="Predict.aspx">
                        <i class="pe-7s-user"></i>
                        <p>Classification</p>
                    </a>
                </li> 
                 <li>
                    <a href="Recommend.aspx">
                        <i class="pe-7s-user"></i>
                        <p>Recommend</p>
                    </a>
                </li>
                <li>
                    <a href="ArrivalDelay.aspx">
                        <i class="pe-7s-user"></i>
                        <p>Predict Delay</p>
                    </a>
                </li> 
                  <li>
                    <a href="PricePrediction.aspx">
                        <i class="pe-7s-user"></i>
                        <p>Price Prediction</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
<div class="main-panel">

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Rate Flight</h4>
                            </div>
                            <div class="content">
                                <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>User</label>
                                                <asp:TextBox class="form-control" ID="txtUser" runat="server"/>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Button ID="btnSuggestFlight" Text="Suggest" runat="server" OnClick="do_suggest" class="btn btn-info btn-fill pull-left" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Table ID="tableSuggestions" runat="server"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="https://www.northeastern.edu/guidelines/images/page/AltLogo_S_koKO.png" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" src="assets/img/faces/face-3.jpg" alt="..."/>

                                      <h4 class="title">Team 3<br />
                                      </h4>
                                    </a>
                                </div>
                                <p class="description text-center">Sankalp Jadon<br>
                                                    Vivek Kumar<br>
                                                    Vyshak Srishylappa
                                </p>
                            </div>
                            <hr>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Northeastern University
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Advanced Data Science
                            </a>
                        </li>
                        <li>
                            <a href="#">
                               Prof. Krishnamoorthy
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </footer>

        </div>
                </div>
    </form>
</body>
</html>
