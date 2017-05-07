<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminCustomerInformationLists.aspx.cs" Inherits="AdminCustomerInformationLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <fieldset class="customerInfo">
                <legend>Customer Lists</legend>

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="customerID" DataSourceID="SqlDataSource1" PageSize="7" Width="1048px">
                        <Columns>
                            <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                            <asp:BoundField DataField="customerNRC" HeaderText="Customer NRC" SortExpression="customerNRC" />
                            <asp:BoundField DataField="customerPhone" HeaderText="Customer Phone " SortExpression="customerPhone" />
                            <asp:BoundField DataField="customerAddress" HeaderText="Customer Address" SortExpression="customerAddress" />
                            <asp:BoundField DataField="customerEmail" HeaderText="Customer Email" SortExpression="customerEmail" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>

                    </fieldset>
            </td>
        </tr>
        </table>
</asp:Content>

