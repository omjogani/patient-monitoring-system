<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_patients.aspx.cs" Inherits="PatientMonitoring.view_patients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patients</title>
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
          padding: 10px;
        }
        tr:last-of-type td:last-of-type {
          border-bottom-right-radius: 10px;
        }
        table{
            width:70%;
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
            <br /><br />
        <div class="row h-100 justify-content-center align-items-center">
            <asp:TextBox ID="txt_search" cssClass="form-control w-25 rounded" placeholder="Search Patient" runat ="server"></asp:TextBox> &nbsp;
            <asp:Button ID="btn_search" cssClass="btn" runat="server" Text="Search" OnClick="btn_search_Click" />
        </div>
            <br />
        
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Name" DataField="name" SortExpression="Name"  />
                    <asp:BoundField HeaderText="Age" DataField="Age" />
                    <asp:BoundField HeaderText="Weight" DataField="Weight" />
                    <asp:BoundField HeaderText="Gender" DataField="Gender" />
                    <asp:BoundField HeaderText="Date" DataField="Date" SortExpression="Date"/>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandArgument='<%# Bind("Id") %>' CommandName="ThisBtnClick" Text="Edit" OnClick="EditRecord" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Add Record">
                        <ItemTemplate>
                            <asp:Button ID="Button2" runat="server" CommandArgument='<%# Bind("Id") %>' CommandName="ThisBtnClick" Text="Add Record" OnClick="AddRecord" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="View Records">
                        <ItemTemplate>
                            <asp:Button ID="Button3" runat="server" CommandArgument='<%# Bind("Id") %>' CommandName="ThisBtnClick" Text="View Records" OnClick="ViewRecords" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
            </center>
    </form>
</body>
</html>
