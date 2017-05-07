<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="InvoicePage.aspx.cs" Inherits="InvoicePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <fieldset class="coffeecustomerInfo">
        <legend>Invoice Page</legend>
             <asp:Panel ID="pnlView" runat="server">
                 <table style="width:100%;">
                     <tr>
                         <td colspan="3">
                             <asp:Image ID="Image1" runat="server" Height="124px" ImageUrl="~/pdflogo.jpg" Width="246px" />
                             <br />
                             <br />
                             <asp:Label ID="lblTitle" runat="server">Modern Interior Coffee Shop Decoration Myanmar <br/>Phone Number:09785177966<br/>Invoice</asp:Label>
                             <br />
                             <br /> </td>
                     </tr>
                     <tr>
                         <td style="width: 33%">
                             <asp:Label ID="lblSN" runat="server" Text="Slip Number:"></asp:Label>
                             :<asp:Label ID="lblSlipNumber" runat="server"></asp:Label>
                         </td>
                         <td style="width: 15%">&nbsp;</td>
                         <td style="width: 33%">&nbsp;<asp:Label ID="lblD" runat="server"><br/>Date:</asp:Label>
                             <asp:Label ID="lblDate" runat="server"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:Label ID="lblPN" runat="server"><br/>Package Name:</asp:Label>
                             :<asp:Label ID="lblPackageName" runat="server"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="Label3" runat="server"></asp:Label>
                         </td>
                         <td>&nbsp;</td>
                     </tr>
                     <tr>
                         <td colspan="3">&nbsp;</td>
                     </tr>
                     <tr>
                         <td colspan="3">
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" ShowFooter="True" Width="650px" OnDataBound="GridView1_DataBound">
                                 <Columns>
                                     <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                     <asp:BoundField DataField="amount" HeaderText="Item Quantity" SortExpression="amount" />
                                     <asp:TemplateField HeaderText="Item UnitPrice" SortExpression="unitPrice">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unitPrice") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <FooterTemplate>
                                             Grand Total
                                         </FooterTemplate>
                                         <ItemTemplate>
                                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("unitPrice") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Item Total Price" SortExpression="totalPrice">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("totalPrice") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <FooterTemplate>
                                             <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                                         </FooterTemplate>
                                         <ItemTemplate>
                                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("totalPrice") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
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
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory, Payments.id, Payments.paymentID, Payments.unitPrice, Payments.amount, Payments.totalPrice, Payments.itemID AS Expr1, Payments.Order_orderID FROM Payments INNER JOIN Orders ON Payments.Order_orderID = Orders.orderID INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID INNER JOIN Items ON PackageItems.Item_itemID = Items.itemID AND Payments.itemID = Items.itemID WHERE (Payments.paymentID = @paymentID) AND (Packages.packageID = @packageID)">
                                 <SelectParameters>
                                     <asp:SessionParameter Name="paymentID" SessionField="paymentID" />
                                     <asp:SessionParameter Name="packageID" SessionField="packageid" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="3">&nbsp;</td>
                     </tr>
                     <tr>
                         <td colspan="3">&nbsp;<asp:Label ID="lblThankYou0" runat="server" Text="Thank You So Much "></asp:Label>
                             <asp:Label ID="lblUserName" runat="server"></asp:Label>
                             <br />
                             <asp:Label ID="lblSeeYou" runat="server" Text="See You Again!"></asp:Label>
                             <br />
                             </td>
                     </tr>
                 </table>
             </asp:Panel>
             <asp:Button ID="btnExportPDF" runat="server" Text="Export" CausesValidation="False" CssClass="btngroup" OnClick="btnExportPDF_Click" />
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [packageName] FROM [Packages] WHERE ([packageID] = @packageID)">
                 <SelectParameters>
                     <asp:SessionParameter Name="packageID" SessionField="packageid" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
             </fieldset>
</asp:Content>

