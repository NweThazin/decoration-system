<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminAddServiceTeam.aspx.cs" Inherits="AdminAddServiceTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <fieldset class="customerInfo">
            <legend>Add Service Team</legend>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatLayout="Flow">
                <asp:ListItem Value="1" Selected="True">View Service Team</asp:ListItem>
                <asp:ListItem Value="2">Add New Service Team</asp:ListItem>
            </asp:RadioButtonList>
            <fieldset class="customerInfo">

            <legend>View Service Team Information</legend>
                <table style="width:100%;height:100%">
                    <tr>
                        <td class="auto-style1" style="width:15%" rowspan="3">  </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1" style="width: 10%" rowspan="3"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="serviceID" DataSourceID="SqlDataSource1" Height="47px" style="text-align: center" Width="644px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                <Columns>
                                    <asp:BoundField DataField="serviceName" HeaderText="Service Team Name" SortExpression="serviceName" />
                                    <asp:BoundField DataField="serviceEmail" HeaderText="Service Team Email" SortExpression="serviceEmail" />
                                    <asp:CommandField ShowEditButton="True" />
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ServiceTeams] WHERE [serviceID] = @serviceID" InsertCommand="INSERT INTO [ServiceTeams] ([serviceName], [servicePassword], [serviceEmail]) VALUES (@serviceName, @servicePassword, @serviceEmail)" SelectCommand="SELECT * FROM [ServiceTeams]" UpdateCommand="UPDATE [ServiceTeams] SET [serviceName] = @serviceName, [serviceEmail] = @serviceEmail WHERE [serviceID] = @serviceID">
                                <DeleteParameters>
                                    <asp:Parameter Name="serviceID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="serviceName" Type="String" />
                                    <asp:Parameter Name="servicePassword" Type="String" />
                                    <asp:Parameter Name="serviceEmail" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="serviceName" />
                                    <asp:Parameter Name="serviceEmail" />
                                    <asp:Parameter Name="serviceID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                    </tr>
                </table>
</fieldset>
        </fieldset>

        <br />
    <br />
</asp:Content>

