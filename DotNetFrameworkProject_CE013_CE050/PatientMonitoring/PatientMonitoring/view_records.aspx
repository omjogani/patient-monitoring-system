<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_records.aspx.cs" Inherits="PatientMonitoring.view_records" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Details</title>
     <link rel="stylesheet" href="assets/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
    <style>
        body {
            background-image: url("assets/background.png");
            background-repeat: no-repeat;
            background-size: cover;

        }
        mainContent {
            text-align: center;
            justify-content: center;
            display: flex;
        }
        th:first-of-type {
          border-top-left-radius: 10px;
          padding: 10px;
        }
        th:last-of-type {
          border-top-right-radius: 10px;
          padding: 10px;
        }
        tr:last-of-type td:first-of-type {
          border-bottom-left-radius: 10px;
        }
        tr:last-of-type td:last-of-type {
          border-bottom-right-radius: 10px;
        }
        .btn {
            background: #3498db;
            background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
            background-image: -moz-linear-gradient(top, #3498db, #2980b9);
            background-image: -ms-linear-gradient(top, #3498db, #2980b9);
            background-image: -o-linear-gradient(top, #3498db, #2980b9);
            background-image: linear-gradient(to bottom, #3498db, #2980b9);
            -webkit-border-radius: 28;
            -moz-border-radius: 28;
            border-radius: 28px;
            -webkit-box-shadow: 1px 1px 15px #999799;
            -moz-box-shadow: 1px 1px 15px #999799;
            box-shadow: 1px 1px 15px #999799;
            font-family: Arial;
            color: #ffffff;
            font-size: 20px;
            padding: 5px 20px 5px 20px;
            text-decoration: none;
        }
        table{
            width:70%;
        }

        .btn:hover {
            background: #3cb0fd;
            background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
            background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <a class="navbar-brand" href="#">Patient Monitoring Portal</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="home.aspx">Home <span class="sr-only">(current)</span></a>
                  </li>
                    </li>
                    <li class="nav-item active">
                    <a class="nav-link" href="add_patient.aspx">Add Patient<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="view_patients.aspx">Patients<span class="sr-only">(current)</span></a>
                  </li>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="about_us.aspx">About<span class="sr-only">(current)</span></a>
                  </li>                
                </ul>
                  
              </div>
            </nav>
        <center>
           
        <div>
            <br />
            <asp:Label ID="lbl_name" style="font-size:25px;" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
         <!--
            <div class="row w-100  justify-content-center align-items-center">
                <asp:TextBox ID="txt_search" cssClass="form-control w-25 rounded" placeholder="Search Patient" runat="server"></asp:TextBox> &nbsp;&nbsp;
                <asp:Button ID="btn_search" cssClass="btn" runat="server" Text="Button" />
            </div>
            <br /> -->
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
            </center>
    </form>
</body>
</html>
