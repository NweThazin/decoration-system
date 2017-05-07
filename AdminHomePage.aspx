<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminHomePage.aspx.cs" Inherits="AdminHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;height:650px">
        <tr>
            <td style="height: 50%; text-align: center;">
                <fieldset class="customerInfo">
                <legend>Provided Package Order Information</legend>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID,packageID,customerID" DataSourceID="SqlDataSource2" PageSize="5" Width="935px">
                        <Columns>
                            <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                            <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate", "{0:D}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                            <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                            <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="AdminHomeReadyPackageDetail.aspx?orderid={0}" HeaderText="View Detail" Text="Detail" />
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
                    </fieldset>
            </td>
            <td style="width: 5%;">&nbsp;</td>
        </tr>
        <tr>
            <td style="height:50%">
                <fieldset class="customerInfo">
                <legend>Create Package Order Information</legend>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID,packageID,customerID" DataSourceID="SqlDataSource1" PageSize="5" Width="940px">
                    <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                        <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate", "{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                        <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                        <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="AdminHomeOrderPackageDetail.aspx?orderid={0}" HeaderText="View Detail" Text="Detail" />
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
        
           </fieldset>
                     </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
    </table>
    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Orders.deliveryAddress, Packages.packageID, Packages.packageName, Packages.packageType, Customers.customerID, Customers.customerName FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID WHERE (Packages.packageStatus = 0) AND (Orders.orderStatus = 0)"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Orders.deliveryAddress, Packages.packageID, Packages.packageName, Packages.packageType, Customers.customerID, Customers.customerName FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID WHERE (Packages.packageStatus = 1) AND (Orders.orderStatus = 0)"></asp:SqlDataSource>
        
           </asp:Content>

