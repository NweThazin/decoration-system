<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerRequestOrderLists.aspx.cs" Inherits="CustomerRequestOrderLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <table style="width:100%;">
            <tr>
                <td> <fieldset class="coffeecustomerInfo">
        <legend>Order Lists</legend>
                 <table style="width: 100%;">
                     <tr>
                         <td>
                             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID,packageID" DataSourceID="SqlDataSource1" PageSize="5" Width="741px">
                                 <Columns>
                                     <asp:TemplateField HeaderText="Invoice Number">
                                         <ItemTemplate>
                                             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("paymentID", "InvoiceDetails.aspx?invoiceoid={0}") %>' Text='<%# Bind("paymentID") %>'></asp:HyperLink>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate","{0:D}") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:HyperLinkField DataNavigateUrlFields="packageID,packageStatus" DataNavigateUrlFormatString="PackageDetails.aspx?poid={0}&amp;pstatus={1}" HeaderText="View Detail" Text="Details" />
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
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Orders.orderID, Orders.orderDate, Payments.paymentID, Packages.packageStatus, Packages.packageName, Packages.packageID FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID WHERE (Orders.Customer_customerID = @cusotmerID)">
                                 <SelectParameters>
                                     <asp:SessionParameter Name="cusotmerID" SessionField="userid" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                         </td>
                     </tr>
                 </table>
                 </fieldset>&nbsp;</td>
            </tr>
            </table>

    
</asp:Content>

