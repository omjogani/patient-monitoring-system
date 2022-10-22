<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_record.aspx.cs" Inherits="PatientMonitoring.update_record" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="#">Patients<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="#">Statistics<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="#">About<span class="sr-only">(current)</span></a>
                  </li>                  
                </ul>
                    // TODO: HREF TO LOGOUT
              </div>
            </nav>
            <div>
            <center>
                <form id="form1" class="mx-auto" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="3">
                        <h2>Doctor&#39;s Information</h2></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Illness</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="illness_text" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                        <asp:HiddenField ID="hf_recordid" runat="server" />

                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Complaints</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="complaints_text" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Past History (P/H)</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="pho_text" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2">
                        <p style="font-size:20px">Treatments</p></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="treatment_text" runat="server" Height="54px" TextMode="MultiLine" Width="222px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                
                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Button cssClass="btn btn-primary" ID="btn_udpate" runat="server" Text="Update Record" OnClick="btn_udpate_Click" />
                        <asp:Button cssClass="btn btn-primary" ID="btn_delete" runat="server" Text="Delete Record" OnClick="btn_delete_Click"/>
                    </td>
                </tr>
             </table>
                        </form>

                    </center>
                
                </div>
        </div>
</body>
</html>
