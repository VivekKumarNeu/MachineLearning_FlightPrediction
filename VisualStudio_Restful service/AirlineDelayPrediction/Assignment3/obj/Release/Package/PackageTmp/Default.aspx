<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <%-- <div class="wrapper">
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
                    <a href="dashboard.html">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="user.html">
                        <i class="pe-7s-user"></i>
                        <p>Prediction</p>
                    </a>
                </li> 
            </ul>
        </div>
    </div>--%>

    <div class="main-panel">

        <div class="content">
            <div class="container-fluid">
       



                <div class="row">
                    <div class="col-md-6">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title">Welcome to Flight Prediction Engine</h4>
                            </div>
                            <div class="content">
                                
                            </div>
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
<%--</div>--%>
</asp:Content>
