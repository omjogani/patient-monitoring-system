<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_patient.aspx.cs" Inherits="PatientMonitoring.add_patient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Patient</title>
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
            padding: 10px 20px 10px 20px;
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
        <div>
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
            <div>
            <center>
                <form id="form1" class="mx-auto" runat="server">
            <table class="auto-style1">
                <tr>
                    <td><h2>Patient Information</h2></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Patient Name</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="patient_name" cssClass="form-control rounded" placeholder="Enter Name" runat="server" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="patient_name" ErrorMessage="Name is required..."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Age</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="patient_age" cssClass="form-control rounded" runat="server" placeholder="Enter Age" TextMode="Number" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="patient_age" ErrorMessage="Age is required..."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Weight</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="patient_weight" cssClass="form-control rounded" placeholder="Enter Weight" runat="server" TextMode="Number" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="patient_weight" ErrorMessage="Weight is required..."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Gender</p></td>
                    <td class="auto-style2">
                        <asp:RadioButtonList ID="patient_gender" runat="server" Width="137px">
                            <asp:ListItem selected Value="male">Male</asp:ListItem>
                            <asp:ListItem Value="female">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Button cssClass="btn btn-primary"  ID="Submit" runat="server" Text="Add Patient" OnClick="Submit_Click" />
                    </td>
                </tr>
             </table>
                        </form>

                    </center>
                
                </div>
        </div>
</body>
</html>
