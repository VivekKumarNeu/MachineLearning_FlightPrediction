<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="PricePrediction.aspx.cs" Inherits="FinalProject.PricePrediction" %>

<!DOCTYPE html>

<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight Delay Prediction</title>

    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
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
    <link id="Link1" runat="server" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link id="Link2" runat="server" href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link id="Link3"  runat="server" href="assests/css/pe-icon-7-stroke.css" rel="stylesheet" />
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

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
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
                Flight Price Prediction</h3>
            </div>


        </div>
    </div>
<div class="main-panel">

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Price Predication of flight</h4>
                            </div>
                            <div class="content">
                                <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Carrier Name</label>
                                                <asp:TextBox class="form-control" ID="txtBoxcarrierName" runat="server" value="UA"/>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Origin</label>
                                                <asp:TextBox class="form-control" ID="txtBoxOrigin" runat="server" value="JFK"/>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Destination</label>
                                                <asp:TextBox class="form-control" ID="txtBoxDestination" runat="server" value="BOS"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Date : </label><br />
                                                <asp:DropDownList class="form-group" ID="txtDropBoxHour" runat="server">
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
                                                    <asp:ListItem value="1">13</asp:ListItem>
                                                    <asp:ListItem value="2">14</asp:ListItem>
                                                    <asp:ListItem value="3">15</asp:ListItem>
                                                    <asp:ListItem value="4">16</asp:ListItem>
                                                    <asp:ListItem value="5">17</asp:ListItem>
                                                    <asp:ListItem value="6">18</asp:ListItem>
                                                    <asp:ListItem value="7">19</asp:ListItem>
                                                    <asp:ListItem value="8">20</asp:ListItem>
                                                    <asp:ListItem value="9">21</asp:ListItem>
                                                    <asp:ListItem value="10">22</asp:ListItem>
                                                    <asp:ListItem value="11">23</asp:ListItem>
                                                    <asp:ListItem value="12">24</asp:ListItem>
                                                    <asp:ListItem value="1">25</asp:ListItem>
                                                    <asp:ListItem value="2">26</asp:ListItem>
                                                    <asp:ListItem value="3">27</asp:ListItem>
                                                    <asp:ListItem value="4">28</asp:ListItem>
                                                    <asp:ListItem value="5">29</asp:ListItem>
                                                    <asp:ListItem value="6">30</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                  
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Predict Price </label><asp:TextBox class="form-control" ID="predictflight" runat="server"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Button ID="PredictButton" Text="Predict" runat="server" OnClick="Page_Load" class="btn btn-info btn-fill pull-left" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="clearfix"></div>
                                </form>
                                <div class="form-group" style="margin:17px">
                                Sample input format</br>
                                <table border=1>
                                    <tr>
                                       <th>Carrier Name</th>
                                        <th>Origin</th>
                                        <th>Destination</th>
                                        <th>Date</th>
                                    </tr>
                                    <tr>
                                        <td>UA</td>
                                        <td>JFK</td>
                                        <td>BOS</td>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>B6</td>
                                        <td>JFK</td>
                                        <td>SJU</td>
                                        <td>7</td>
                                    </tr>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
                </div>
    </form>
</body>
</html>

