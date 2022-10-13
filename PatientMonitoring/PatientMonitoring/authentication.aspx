<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="authentication.aspx.cs" Inherits="PatientMonitoring.authentication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
    <link rel="stylesheet" href="assets/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="3"><center><h1>Welcome to Patient Monitoring Portal</h1></center>
                        <h2>Personal Informations</h2></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Patient Name</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Age</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Weight</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Number" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Gender</p></td>
                    <td class="auto-style2">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="166px">
                            <asp:ListItem Value="male">Male</asp:ListItem>
                            <asp:ListItem Value="female">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Mobile No.</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox8" runat="server" TextMode="Phone" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        <h2>Doctor&#39;s Information</h2></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Illness</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox4" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Complaints</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox5" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Past History (P/H)</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox6" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Treatments</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox7" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Button cssClass="btn btn-primary" ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" />
                    </td>
                </tr>
            </table>
            </center>
        </div>
    </form>
</body>
</html>
