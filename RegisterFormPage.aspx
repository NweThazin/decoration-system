<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterFormPage.aspx.cs" Inherits="RegisterFormPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modern Interior Decoration Coffee Shop Myanmar</title>
    <%--    //To Link The Css Page--%>
    <link rel="stylesheet" type="text/css" href="css/RegisterDesign.css"/>
     <link rel="shortcut icon" href="images/aaa.jpeg" type="images/jpeg"/>
    <style type="text/css">
        .auto-style1 {
            height: 336px;
            width: 25%;
        }
        .auto-style2 {
            width: 485px;
        }
        .auto-style3 {
            width: 485px;
            height: 336px;
        }
        .auto-style4 {
            height: 336px;
            width: 17%;
        }
        .auto-style5 {
            width: 17%;
        }
        .auto-style6 {
            width: 30%;
            height: 51px;
        }
        .auto-style7 {
            height: 51px;
            width: 334px;
            text-align: left;
        }
        .auto-style8 {
            width: 334px;
            text-align: left;
        }
        .auto-style9 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%; height: 100%">
        <tr>
            <td class="auto-style4" style="width: 15%"></td>
            <td class="auto-style3">

        <div class="box">
        <div class="content">
            <h1>Registration Form</h1>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <table style="width: 100%;">
                <tr>
                    <td style="width: 30%; text-align: right;">
                        <asp:Label ID="lblCustName" runat="server" CssClass="loginGroup" Text="Name:"></asp:Label>
                    </td>
                    <td style="width: 30%;" class="auto-style8">
                        <asp:TextBox ID="txtCustName" runat="server" CssClass="field"></asp:TextBox>
                    </td>
                    <td style="width: 10%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustName" ErrorMessage="RequiredFieldValidator" ForeColor="Red" Font-Size="Large">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="auto-style6">
                        <asp:Label ID="lblCustNRC" runat="server" CssClass="loginGroup" Text="NRC:"></asp:Label>
                        <br />
                    </td>
                    <td style="width: 30%;" class="auto-style7">
                        <asp:TextBox ID="txtCustNRC" runat="server" CssClass="field"></asp:TextBox>
                    </td>
                    <td class="auto-style6" style="width: 10%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustNRC" ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red" style="text-align: center">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCustNRC" ErrorMessage="Please Enter this format:00/AaBaCc(N)000000" ForeColor="Red" ValidationExpression="\d{1,2}/\w{6}(\(N\))\d{6}" style="text-align: center"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right;">
                        <asp:Label ID="lblCustPhone" runat="server" CssClass="loginGroup" Text="Phone No:"></asp:Label>
                    </td>
                    <td style="width: 30%;" class="auto-style8">
                        <asp:TextBox ID="txtCustPhone" runat="server" CssClass="field"></asp:TextBox>
                    </td>
                    <td style="width: 10%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustPhone" ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red">*</asp:RequiredFieldValidator>
                        &nbsp;<br />
                        <asp:RegularExpressionValidator ID="regularPhone" runat="server" ControlToValidate="txtCustPhone" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]*">Must Be Number</asp:RegularExpressionValidator>
                        <br />
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtCustPhone" ErrorMessage="CustomValidator" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate">Enter Correct Your Phone No !</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right;">
                        <asp:Label ID="lblCustAddress" runat="server" CssClass="loginGroup" Text="Address:"></asp:Label>
                    </td>
                    <td style="width: 30%;" class="auto-style8">
                        <asp:TextBox ID="txtCustAddress" runat="server" Height="59px" TextMode="MultiLine" Width="230px" CssClass="field"></asp:TextBox>
                    </td>
                    <td style="width: 10%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustAddress" ErrorMessage="RequiredFieldValidator" ForeColor="Red" Font-Size="Large">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right;">
                        <asp:Label ID="lblCustEmail" runat="server" CssClass="loginGroup" Text="Email:"></asp:Label>
                    </td>
                    <td style="width: 30%;" class="auto-style8">
                        <asp:TextBox ID="txtCustEmail" runat="server" CssClass="field"></asp:TextBox>
                    </td>
                    <td style="width: 10%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCustEmail" ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCustEmail" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Enter Correct Email Address!</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right;">
                        <asp:Label ID="lblCustPwd" runat="server" CssClass="loginGroup" Text="Password:"></asp:Label>
                    </td>
                    <td style="width: 30%;" class="auto-style8">
                        <asp:TextBox ID="txtCustPwd" runat="server" TextMode="Password" CssClass="field"></asp:TextBox>
                    </td>
                    <td style="width: 10%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCustPwd" ErrorMessage="RequiredFieldValidator" Font-Size="Large" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <br />
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtCustPwd" ErrorMessage="CustomValidator" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate">Enter Password, at least eight characters! 	 </asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right;">
                        <asp:Label ID="lblCustConPwd" runat="server" CssClass="loginGroup" Text="Confirm Password:"></asp:Label>
                    </td>
                    <td style="width: 30%;" class="auto-style8">
                        <asp:TextBox ID="txtCustConfirmPwd" runat="server" Height="16px" TextMode="Password" CssClass="field"></asp:TextBox>
                    </td>
                    <td style="width: 10%">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtCustPwd" ControlToValidate="txtCustConfirmPwd" ErrorMessage="CompareValidator" ForeColor="Red">Reenter Your Password !</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; width: 30%;" colspan="3" class="auto-style9">
                        <asp:Button ID="btnRegister" runat="server" CssClass="registerbtn" Text="Register" OnClick="btnRegister_Click" />
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" CssClass="registerbtn" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" />
                    &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center; width: 30%;" colspan="3" class="auto-style9">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                </table>
                
        </div>
    </div>


                </td>
                <td class="auto-style1" style="width: 20%">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE ([customerEmail] = @customerEmail)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtCustEmail" Name="customerEmail" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerID] = @customerID" InsertCommand="INSERT INTO [Customers] ([customerName], [customerNRC], [customerPhone], [customerAddress], [customerEmail], [customerStatus], [customerPassword]) VALUES (@customerName, @customerNRC, @customerPhone, @customerAddress, @customerEmail, @customerStatus, @customerPassword)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [customerName] = @customerName, [customerNRC] = @customerNRC, [customerPhone] = @customerPhone, [customerAddress] = @customerAddress, [customerEmail] = @customerEmail, [customerStatus] = @customerStatus, [customerPassword] = @customerPassword WHERE [customerID] = @customerID">
                        <DeleteParameters>
                            <asp:Parameter Name="customerID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtCustName" Name="customerName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtCustNRC" Name="customerNRC" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtCustPhone" Name="customerPhone" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtCustAddress" Name="customerAddress" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtCustEmail" Name="customerEmail" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="0" Name="customerStatus" Type="Int32" />
                            <asp:ControlParameter ControlID="txtCustPwd" DefaultValue="" Name="customerPassword" PropertyName="Text" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="customerName" Type="String" />
                            <asp:Parameter Name="customerNRC" Type="String" />
                            <asp:Parameter Name="customerPhone" Type="Decimal" />
                            <asp:Parameter Name="customerAddress" Type="String" />
                            <asp:Parameter Name="customerEmail" Type="String" />
                            <asp:Parameter Name="customerStatus" Type="Int32" />
                            <asp:Parameter Name="customerPassword" Type="String" />
                            <asp:Parameter Name="customerID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
                <td class="auto-style5" style="width: 15%">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td style="width: 20%">&nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
