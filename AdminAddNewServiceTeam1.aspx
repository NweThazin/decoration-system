<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminAddNewServiceTeam1.aspx.cs" Inherits="AdminAddNewServiceTeam1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 10%;
            height: 118px;
        }
        .auto-style4 {
            width: 288px;
            text-align: right;
            height: 118px;
        }
        .auto-style5 {
            width: 10%;
        }
        .auto-style6 {
            text-align: right;
            width: 288px;
            height: 30px;
        }
        .auto-style7 {
            height: 30px;
        }
        .auto-style8 {
            width: 10%;
            height: 43px;
        }
        .auto-style9 {
            text-align: right;
            width: 288px;
            height: 43px;
        }
        .auto-style10 {
            height: 43px;
        }
        .auto-style11 {
            width: 5%;
            height: 43px;
        }
        .auto-style12 {
            width: 10%;
            height: 35px;
        }
        .auto-style13 {
            text-align: right;
            width: 288px;
            height: 35px;
        }
        .auto-style14 {
            height: 35px;
        }
        .auto-style15 {
            width: 5%;
            height: 35px;
        }
        .auto-style16 {
            width: 10%;
            height: 28px;
        }
        .auto-style17 {
            text-align: right;
            width: 288px;
            height: 28px;
        }
        .auto-style18 {
            height: 28px;
        }
        .auto-style19 {
            width: 5%;
            height: 28px;
        }
        .auto-style20 {
            height: 118px;
        }
        .auto-style21 {
            width: 5%;
            height: 118px;
        }
        .auto-style22 {
            width: 10%;
            height: 36px;
        }
        .auto-style23 {
            width: 288px;
            text-align: right;
            height: 36px;
        }
        .auto-style24 {
            height: 36px;
        }
        .auto-style25 {
            width: 5%;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
            <legend>Add Service Team</legend>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatLayout="Flow">
                <asp:ListItem Value="1" >View Service Team</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">Add New Service Team</asp:ListItem>
            </asp:RadioButtonList>
 <fieldset class="customerInfo">
            <legend>Add New Service Team</legend>
            <table style="width: 105%; height: 294px;">
                <tr>
                    <td class="auto-style5" rowspan="6"></td>
                    <td class="auto-style6" style="width: 30%">Service Team Name:</td>
                    <td class="auto-style7" style="text-align: left">
                        <asp:TextBox ID="txtname" runat="server" Height="20px" Width="163px" ValidationGroup="addserviceteam"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Name" ForeColor="Red" ControlToValidate="txtname" ValidationGroup="addserviceteam" CssClass="validatorGroup"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                    <td style="width: 5%" class="auto-style5" rowspan="6">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="width: 30%">Service Team Password:</td>
                    <td class="auto-style10" style="text-align: left">
                        <asp:TextBox ID="txtpass" runat="server" Height="20px" TextMode="Password" Width="163px" ValidationGroup="addserviceteam"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ForeColor="Red" ControlToValidate="txtpass" ValidationGroup="addserviceteam" CssClass="validatorGroup"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13" style="width: 30%">Service Team Confirm Password:</td>
                    <td class="auto-style14" style="text-align: left">
                        <asp:TextBox ID="txtconfirmpass" runat="server" Height="20px" TextMode="Password" Width="163px" ValidationGroup="addserviceteam"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Must Match" ForeColor="Red" ControlToCompare="txtpass" ControlToValidate="txtconfirmpass" ValidationGroup="addserviceteam" CssClass="validatorGroup"></asp:CompareValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17" style="width: 30%">Service Team Email:</td>
                    <td class="auto-style18" style="text-align: left">
                        <asp:TextBox ID="txteamil" runat="server" Height="20px" TextMode="Email" Width="163px" ValidationGroup="addserviceteam"></asp:TextBox>
&nbsp;<asp:Label ID="lbMag" runat="server" ForeColor="Red" CssClass="validatorGroup"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23" style="width: 30%">
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Service Team" CssClass="btngroup" ValidationGroup="addserviceteam" Height="32px" Width="183px" />
                    </td>
                    <td class="auto-style24" style="text-align: left">
                        <br />
                        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" CssClass="btngroup" CausesValidation="False" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="width: 30%">
                        &nbsp;</td>
                    <td class="auto-style20" style="text-align: left">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ServiceTeams] WHERE [serviceID] = @serviceID" InsertCommand="INSERT INTO [ServiceTeams] ([serviceName], [servicePassword], [serviceEmail]) VALUES (@serviceName, @servicePassword, @serviceEmail)" SelectCommand="SELECT * FROM [ServiceTeams] WHERE (([serviceName] = @serviceName) OR ([serviceEmail] = @serviceEmail))" UpdateCommand="UPDATE [ServiceTeams] SET [serviceName] = @serviceName, [servicePassword] = @servicePassword, [serviceEmail] = @serviceEmail WHERE [serviceID] = @serviceID">
                <DeleteParameters>
                    <asp:Parameter Name="serviceID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtname" Name="serviceName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtpass" Name="servicePassword" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txteamil" Name="serviceEmail" PropertyName="Text" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtname" Name="serviceName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txteamil" Name="serviceEmail" PropertyName="Text" Type="String" />
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
            </table>
            </fieldset>
</fieldset><br />
</asp:Content>

