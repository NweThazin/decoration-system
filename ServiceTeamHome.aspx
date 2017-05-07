<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageServiceTeam.master" AutoEventWireup="true" CodeFile="ServiceTeamHome.aspx.cs" Inherits="ServiceTeamHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
        <legend>View Order Information</legend>
    <table style="width:100%;">
        <tr>
            <td style="width: 3%">&nbsp;</td>
            <td style="width: 60%">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">Provided Package Order</asp:ListItem>
                    <asp:ListItem Value="2">Create Package Order</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 3%">&nbsp;</td>
            
            <td style="width: 60%">
           <fieldset class="customerInfo">
                    <legend>
                        <asp:Label ID="lblTitle" runat="server"></asp:Label></legend>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" style="text-align: center" Width="848px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowPaging="True" PageSize="6">
                            <Columns>
                                <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                                <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                                <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" SortExpression="deliveryAddress" />
                                <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="ServiceTeamViewDetailPage.aspx?id={0}" HeaderText="View Detail" NavigateUrl="~/ServiceTeamViewDetailPage.aspx" Text="Detail" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT o.orderID, c.customerName, o.deliveryAddress FROM Orders AS o INNER JOIN Customers AS c ON o.Customer_customerID = c.customerID INNER JOIN Packages AS p ON o.Package_packageID = p.packageID WHERE (o.ServiceTeam_serviceID = @ServiceTeam_serviceID) AND (o.orderStatus = 1) AND (p.packageStatus = 0)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ServiceTeam_serviceID" SessionField="steamid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource2" style="text-align: center" Width="841px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowPaging="True" PageSize="6">
                            <Columns>
                                <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                                <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                                <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" SortExpression="deliveryAddress" />
                                <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="ServiceTeamViewCreateDetail.aspx?id={0}" HeaderText="View Detail" NavigateUrl="~/ServiceTeamViewCreateDetail.aspx" Text="Detail" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT o.orderID, c.customerName, o.deliveryAddress FROM Orders AS o INNER JOIN Customers AS c ON o.Customer_customerID = c.customerID INNER JOIN Packages AS p ON o.Package_packageID = p.packageID WHERE (o.ServiceTeam_serviceID = @ServiceTeam_serviceID) AND (o.orderStatus = 1) AND (p.packageStatus = 1)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ServiceTeam_serviceID" SessionField="steamid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:View>
                    <br />
                </asp:MultiView>  
               </fieldset>              
                <br />
                <br />
            </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="width: 3%;">&nbsp;</td>
        </tr>
    </table>
        </fieldset>
</asp:Content>

