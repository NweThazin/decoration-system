<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginFormPage.aspx.cs" Inherits="LoginFormPage" %>
<%@ PreviousPageType VirtualPath="~/AddToCardpage.aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modern Interior Decoration Coffee Shop Myanmar</title>
    <link rel="stylesheet" type="text/css" href="css/loginDesign.css"/>
     <link rel="shortcut icon" href="images/aaa.jpeg" type="images/jpeg"/>
    <style type="text/css">
        .auto-style1 {
            height: 378px;
        }
        .auto-style2 {
            height: 378px;
            width: 722px;
        }
        .auto-style3 {
            width: 722px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%; height: 100%">
            <tr>
                <td class="auto-style1" style="width: 25%"></td>
                <td class="auto-style2">
        <div class="box">
            <div class="content">
            <h1>Login Form</h1>
            <table style="width: 100%; height: 171px;">
                <tr>
                    <td style="width: 30%;">
                        <asp:Label ID="Label1" runat="server" CssClass="loginGroup" Text="User Email"></asp:Label>
                    </td>
                    <td style="width: 40%">
                        <asp:TextBox ID="txtUserEmail" runat="server" class="field"></asp:TextBox>
                    </td>
                    <td style="width: 30%; text-align: left;">
                <asp:RequiredFieldValidator ID="requiredUserEmail" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%;">
                        <asp:Label ID="Label2" runat="server" CssClass="loginGroup" Text="Password"></asp:Label>
                    </td>
                    <td style="width: 40%">
                        <asp:TextBox ID="txtUserPwd" runat="server" class="field" TextMode="Password"></asp:TextBox>
                    </td>
                    <td style="width: 30%; text-align: left;">
                <asp:RequiredFieldValidator ID="requiredPassword" runat="server" ControlToValidate="txtUserPwd" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%">&nbsp;</td>
                    <td style="width: 40%">
                        <asp:Button ID="btnLogin" runat="server" Text="Log in" class="btn" OnClick="btnLogin_Click"/>
                    </td>
                    <td style="width: 30%; text-align: left;">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
                <asp:LinkButton ID="lnkbtnToRegisterPage" runat="server" Font-Names="Times New Roman" Font-Size="Large" ForeColor="#FFBF00" CausesValidation="False" OnClick="lnkbtnToRegisterPage_Click">Register</asp:LinkButton>
                <br />
                <br />
                <asp:LinkButton ID="lnkbtnToResetPassword" runat="server" Font-Names="Times New Roman" Font-Size="Large" ForeColor="#FFBF00" CausesValidation="False" OnClick="lnkbtnToResetPassword_Click">Forget Password</asp:LinkButton>
                <br />
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>

                </td>
                <td class="auto-style1" style="width: 25%">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Admins] WHERE [adminID] = @adminID" InsertCommand="INSERT INTO [Admins] ([adminName], [adminEmail], [adminPassword]) VALUES (@adminName, @adminEmail, @adminPassword)" SelectCommand="SELECT * FROM [Admins] WHERE (([adminEmail] = @adminEmail) AND ([adminPassword] = @adminPassword))" UpdateCommand="UPDATE [Admins] SET [adminName] = @adminName, [adminEmail] = @adminEmail, [adminPassword] = @adminPassword WHERE [adminID] = @adminID">
                        <DeleteParameters>
                            <asp:Parameter Name="adminID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="adminName" Type="String" />
                            <asp:Parameter Name="adminEmail" Type="String" />
                            <asp:Parameter Name="adminPassword" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUserEmail" Name="adminEmail" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUserPwd" Name="adminPassword" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="adminName" Type="String" />
                            <asp:Parameter Name="adminEmail" Type="String" />
                            <asp:Parameter Name="adminPassword" Type="String" />
                            <asp:Parameter Name="adminID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerID] = @customerID" InsertCommand="INSERT INTO [Customers] ([customerName], [customerNRC], [customerPhone], [customerAddress], [customerEmail], [customerStatus], [customerPassword]) VALUES (@customerName, @customerNRC, @customerPhone, @customerAddress, @customerEmail, @customerStatus, @customerPassword)" SelectCommand="SELECT * FROM [Customers] WHERE (([customerEmail] = @customerEmail) AND ([customerPassword] = @customerPassword))" UpdateCommand="UPDATE [Customers] SET [customerName] = @customerName, [customerNRC] = @customerNRC, [customerPhone] = @customerPhone, [customerAddress] = @customerAddress, [customerEmail] = @customerEmail, [customerStatus] = @customerStatus, [customerPassword] = @customerPassword WHERE [customerID] = @customerID">
                        <DeleteParameters>
                            <asp:Parameter Name="customerID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="customerName" Type="String" />
                            <asp:Parameter Name="customerNRC" Type="String" />
                            <asp:Parameter Name="customerPhone" Type="Decimal" />
                            <asp:Parameter Name="customerAddress" Type="String" />
                            <asp:Parameter Name="customerEmail" Type="String" />
                            <asp:Parameter Name="customerStatus" Type="Int32" />
                            <asp:Parameter Name="customerPassword" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUserEmail" Name="customerEmail" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUserPwd" Name="customerPassword" PropertyName="Text" Type="String" />
                        </SelectParameters>
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
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ServiceTeams] WHERE [serviceID] = @serviceID" InsertCommand="INSERT INTO [ServiceTeams] ([serviceName], [servicePassword], [serviceEmail]) VALUES (@serviceName, @servicePassword, @serviceEmail)" SelectCommand="SELECT * FROM [ServiceTeams] WHERE (([serviceEmail] = @serviceEmail) AND ([servicePassword] = @servicePassword))" UpdateCommand="UPDATE [ServiceTeams] SET [serviceName] = @serviceName, [servicePassword] = @servicePassword, [serviceEmail] = @serviceEmail WHERE [serviceID] = @serviceID">
                        <DeleteParameters>
                            <asp:Parameter Name="serviceID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="serviceName" Type="String" />
                            <asp:Parameter Name="servicePassword" Type="String" />
                            <asp:Parameter Name="serviceEmail" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUserEmail" Name="serviceEmail" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUserPwd" Name="servicePassword" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="serviceName" Type="String" />
                            <asp:Parameter Name="servicePassword" Type="String" />
                            <asp:Parameter Name="serviceEmail" Type="String" />
                            <asp:Parameter Name="serviceID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 25%">&nbsp;</td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [customerName], [customerEmail], [customerPassword] FROM [Customers] WHERE ([customerEmail] = @customerEmail)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUserEmail" Name="customerEmail" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ServiceTeams] WHERE ([serviceEmail] = @serviceEmail)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUserEmail" Name="serviceEmail" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td style="width: 25%">&nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
