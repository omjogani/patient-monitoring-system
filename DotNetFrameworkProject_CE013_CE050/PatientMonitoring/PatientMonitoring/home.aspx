<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="PatientMonitoring.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Monitoring System</title>
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
    <form id="form1" runat="server">
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
           
            <div class="container mainContent">
              <div class="row">
                  <div>
                      <br /><br /><br /><br />
                    <h1>Welcome to <br/>Patient Monitoring Portal</h1><br />
                    <p style="font-size:25px">Now Store and Maintain Patient Record <br/>Easily and Paperless using Patient <br>Monitoring System.</p> 
                      <a class="btn" href="view_patients.aspx">View Patients</a>
                  </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <img src="assets/doctor.png" height="600px" width="600px" />
              </div>
            </div>
        </div>
    </form>
</body>
</html>
