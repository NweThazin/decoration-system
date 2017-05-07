<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageServiceTeam.master" AutoEventWireup="true" CodeFile="ServiceTeamProfile.aspx.cs" Inherits="ServiceTeamProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5
        {
            text-align: center;
        }
        .auto-style6
        {
            width: 662px;
            text-align: left;
        }
        .auto-style7 {
            text-align: right;
        }
        .auto-style8 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
         <br />   
         <fieldset class="customerInfo">
                    <legend>Service Team Profile</legend>
    <table style="width: 100%;" align="center">
        
                   
        <tr>
            <td style="width: 10%">&nbsp;</td>
            <td class="auto-style6">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <table style="width:100%;" class="tex">
                            <tr>
                                <td style="width: 40%" class="auto-style7">Enter Current Password:</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword" CssClass="validatorGroup" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">Enter Current Password</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40%" class="auto-style7">Enter New Password:</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtNewPassword" CssClass="validatorGroup" ErrorMessage="CustomValidator" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate">Enter Password at least 8 characters</asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40%" class="auto-style7">Confirm New Password:</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" CssClass="validatorGroup" ErrorMessage="CompareValidator" ForeColor="#CC0000">Reenter Password</asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" style="width: 40%">
                                    <asp:Button ID="btnSave" runat="server" CssClass="btngroup" OnClick="btnSave_Click" Text="Save" />
                                </td>
                                <td class="auto-style8">
                                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnCancel_Click" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <br />
                    <asp:View ID="View2" runat="server">
                        <br />
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="serviceID" DataSourceID="SqlDataSource1" Height="28px" style="text-align: left" Width="422px">
                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:BoundField DataField="serviceName" HeaderText="Service Team Name" SortExpression="serviceName" />
                                <asp:BoundField DataField="serviceEmail" HeaderText="Service Team Email" SortExpression="serviceEmail" />
                            </Fields>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <HeaderTemplate>
                                <div class="auto-style5">
                                    &nbsp;
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="16pt" Text="Service Team Profile"></asp:Label>
                                </div>
                            </HeaderTemplate>
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        </asp:DetailsView>
                        <br>
                        <br></br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnChangePassword" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnChangePassword_Click" Text="Change Password" />
                        </br>
             
                    </asp:View>
                </asp:MultiView>
            </td>
            
        </tr>
       
           
    </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ServiceTeams] WHERE [serviceID] = @serviceID" InsertCommand="INSERT INTO [ServiceTeams] ([serviceName], [servicePassword], [serviceEmail]) VALUES (@serviceName, @servicePassword, @serviceEmail)" SelectCommand="SELECT * FROM [ServiceTeams] WHERE ([serviceID] = @serviceID)" UpdateCommand="UPDATE [ServiceTeams] SET [serviceName] = @serviceName, [servicePassword] = @servicePassword, [serviceEmail] = @serviceEmail WHERE [serviceID] = @serviceID">
                    <DeleteParameters>
                        <asp:Parameter Name="serviceID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="serviceName" Type="String" />
                        <asp:Parameter Name="servicePassword" Type="String" />
                        <asp:Parameter Name="serviceEmail" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="steamid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="serviceName" Type="String" />
                        <asp:Parameter Name="servicePassword" Type="String" />
                        <asp:Parameter Name="serviceEmail" Type="String" />
                        <asp:Parameter Name="serviceID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ServiceTeams] WHERE [serviceID] = @serviceID" InsertCommand="INSERT INTO [ServiceTeams] ([serviceName], [servicePassword], [serviceEmail]) VALUES (@serviceName, @servicePassword, @serviceEmail)" SelectCommand="SELECT * FROM [ServiceTeams] WHERE (([serviceEmail] = @serviceEmail) AND ([servicePassword] = @servicePassword))" UpdateCommand="UPDATE [ServiceTeams] SET  [servicePassword] = @servicePasswordl WHERE [serviceID] = @serviceID">
                        <DeleteParameters>
                            <asp:Parameter Name="serviceID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="serviceName" Type="String" />
                            <asp:Parameter Name="servicePassword" Type="String" />
                            <asp:Parameter Name="serviceEmail" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceEmail" SessionField="steamemail" Type="String" />
                            <asp:SessionParameter Name="servicePassword" SessionField="steampwd" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="txtNewPassword" Name="servicePasswordl" PropertyName="Text" />
                            <asp:SessionParameter Name="serviceID" SessionField="steamid" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
             </fieldset>
    <br />
</p>
</asp:Content>

