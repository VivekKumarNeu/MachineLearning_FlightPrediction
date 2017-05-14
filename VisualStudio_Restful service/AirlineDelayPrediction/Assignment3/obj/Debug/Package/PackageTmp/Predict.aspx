<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Predict.aspx.cs" Inherits="FinalProject.Predict" %>

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
                                <h4 class="title">Flight Details</h4>
                            </div>
                            <div class="content">
                                <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Origin</label>
                                                <asp:TextBox class="form-control" ID="txtBoxOrigin" runat="server" value="JFK"/>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Destination</label>
                                                <asp:TextBox class="form-control" ID="txtBoxDest" runat="server" value="BOS"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Travel Date : </label><asp:TextBox class="form-control" ID="txtBoxDate" runat="server" type="date" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Time : </label><asp:DropDownList class="form-group" ID="txtDropBoxHour" runat="server">
                                                     <asp:ListItem value="0">0</asp:ListItem>
                                                     <asp:ListItem value="1">1</asp:ListItem>
                                                    <asp:ListItem value="2">2</asp:ListItem>
                                                    <asp:ListItem value="3">3</asp:ListItem>
                                                    <asp:ListItem value="4">4</asp:ListItem>
                                                    <asp:ListItem value="5">5</asp:ListItem>
                                                    <asp:ListItem value="6">6</asp:ListItem>
                                                    <asp:ListItem value="7">7</asp:ListItem>
                                                    <asp:ListItem value="8">8</asp:ListItem>
                                                    <asp:ListItem value="9">9</asp:ListItem>
                                                    <asp:ListItem value="10">10</asp:ListItem>
                                                    <asp:ListItem value="11">11</asp:ListItem>
                                                    <asp:ListItem value="12">12</asp:ListItem>
                                                     <asp:ListItem value="13">13</asp:ListItem>
                                                    <asp:ListItem value="14">14</asp:ListItem>
                                                    <asp:ListItem value="15">15</asp:ListItem>
                                                    <asp:ListItem value="16">16</asp:ListItem>
                                                    <asp:ListItem value="17">17</asp:ListItem>
                                                    <asp:ListItem value="18">18</asp:ListItem>
                                                    <asp:ListItem value="19">19</asp:ListItem>
                                                    <asp:ListItem value="20">20</asp:ListItem>
                                                    <asp:ListItem value="21">21</asp:ListItem>
                                                    <asp:ListItem value="22">22</asp:ListItem>
                                                    <asp:ListItem value="23">23</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Flight : </label><asp:TextBox class="form-control" ID="txtFlightNum" runat="server"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Temperature</label><asp:TextBox class="form-control" runat="server" ID="txtTemperature" />
                                             </div>
                                            </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Visibility</label><asp:TextBox class="form-control" runat="server" ID="txtVisiblity" />
                                             </div>
                                            </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Sea Level Pressure</label><asp:TextBox class="form-control" runat="server" ID="txtSeaLevelPressure" />
                                             </div>
                                            </div>
                                        </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Button ID="PredictButton" Text="Predict" runat="server" OnClick="do_Prediction" class="btn btn-info btn-fill pull-left" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                               <label>Prediction:</label> <asp:TextBox class="form-control" runat="server" ID="txtclassification" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                            <table border=1>
                                    <tr>
                                       <th>Origin</th>
                                        <th>Destination</th>
                                        <th>Travel Date</th>
                                        <th>Time</th>
                                        <th>Flight</th>
                                        <th>Temperature</th>
                                        <th>Visibility</th>
                                        <th>Sea Level Pressure</th>
                                    </tr>
                                    <tr>
                                        <td>JFK</td>
                                        <td>BOS</td>
                                        <td>12/15/2016</td>
                                        <td>1000</td>
                                        <td>1767</td>
                                        <td>30</td>
                                        <td>10</td>
                                        <td>30.02</td>
                                    </tr>
                                    <tr>
                                        <td>JFK</td>
                                        <td>SJU</td>
                                        <td>18/12/2016</td>
                                        <td>1800</td>
                                        <td>4554</td>
                                        <td>25</td>
                                        <td>15</td>
                                        <td>29.92</td>
                                    </tr>
                                </table>
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
