<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminProfilePage.aspx.cs" Inherits="AdminProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 25%;
            height: 30px;
            text-align: right;
        }
        .auto-style2 {
            height: 30px;
            text-align: left;
        }
        .auto-style3 {
            width: 10%;
            }
        .auto-style4 {
            height: 51px;
        }
        .auto-style5 {
            text-align: left;
        }
        .auto-style6 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <table style="width:100%;" class="tex">
        <tr>
            <td>
                <fieldset class="customerInfo">
                <legend class="tex">Admin Profile Page</legend>

                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server" >
                            <table style="width:100%;" class="tex">
                                <tr>
                                    <td class="auto-style3" rowspan="3"></td>
                                    <td rowspan="3" style="text-align: left">
                                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="adminID" DataSourceID="SqlDataSource1" Height="50px" style="text-align: center" Width="415px">
                                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                            <Fields>
                                                <asp:BoundField DataField="adminName" HeaderText="Admin Name" SortExpression="adminName" />
                                                <asp:BoundField DataField="adminEmail" HeaderText="Admin Email" SortExpression="adminEmail" />
                                            </Fields>
                                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                        </asp:DetailsView>
                                        <br />
                                        <asp:Button ID="btnChangePassword" runat="server" CssClass="btngroup" OnClick="btnChangePassword_Click" style="text-align: left"  Text="Change Password" CausesValidation="False" />
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Admins] WHERE ([adminID] = @adminID)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="adminID" SessionField="adminid" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style4"></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <table style="width:100%;" class="tex">
                                <tr>
                                    <td class="auto-style1">Enter Current Password:</td>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorGroup" ValidationGroup="adminChangePwd">Enter Current Password</asp:RequiredFieldValidator>
                                        &nbsp;<asp:Label ID="lblMessage" runat="server" CssClass="validatorGroup" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%" class="auto-style6">Enter New Password:</td>
                                    <td class="auto-style5">
                                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="CustomValidator" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" CssClass="validatorGroup" ValidationGroup="adminChangePwd">Enter Password at least 8 characters</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%" class="auto-style6">Confirm New Password:</td>
                                    <td class="auto-style5">
                                        <asp:TextBox ID="txtConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmNewPassword" ErrorMessage="CompareValidator" ForeColor="Red" CssClass="validatorGroup" ValidationGroup="adminChangePwd">Reenter Password</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="auto-style6" colspan="2">
                                        <br />
                                        <asp:Button ID="btnSave" runat="server" CssClass="btngroup" Height="34px" OnClick="btnSave_Click" Text="Save" ValidationGroup="adminChangePwd" Width="86px" />
                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btngroup" Height="34px" OnClick="btnCancel_Click" Text="Cancel" Width="85px" />
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 25%" class="auto-style6">
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Admins] WHERE [adminID] = @adminID" InsertCommand="INSERT INTO [Admins] ([adminName], [adminEmail], [adminPassword]) VALUES (@adminName, @adminEmail, @adminPassword)" SelectCommand="SELECT * FROM [Admins] WHERE (([adminEmail] = @adminEmail) AND ([adminPassword] = @adminPassword))" UpdateCommand="UPDATE [Admins] SET[adminPassword] = @adminPassword WHERE [adminID] = @adminID">
                                            <DeleteParameters>
                                                <asp:Parameter Name="adminID" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="adminName" Type="String" />
                                                <asp:Parameter Name="adminEmail" Type="String" />
                                                <asp:Parameter Name="adminPassword" Type="String" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="adminEmail" SessionField="adminemail" Type="String" />
                                                <asp:ControlParameter ControlID="txtOldPassword" Name="adminPassword" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="txtNewPassword" Name="adminPassword" PropertyName="Text" />
                                                <asp:SessionParameter Name="adminID" SessionField="adminid" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style5">&nbsp;</td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>

                    </fieldset>
            </td>
        </tr>
        </table>
      
</asp:Content>

