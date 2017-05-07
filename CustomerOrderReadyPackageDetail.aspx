<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="CustomerOrderReadyPackageDetail.aspx.cs" Inherits="CustomerOrderReadyPackageDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <fieldset class="customerInfo">
        <legend>Customer Order Details</legend>
         <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="806px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" style="text-align: left">
             <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
             <Fields>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" Height="266px" Width="425px" ImageUrl='<%#getImage(Eval("packageImage")) %>' />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="orderID" HeaderText="Order Number" SortExpression="orderID" />
                 <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate", "{0:D}") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" SortExpression="deliveryAddress" />
                 <asp:TemplateField HeaderText="Package Name" SortExpression="packageName">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("packageName") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("packageName") %>'></asp:TextBox>
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:LinkButton ID="lnkbtnPackageName" runat="server" OnClick="lnkbtnPackageName_Click" Text='<%# Bind("packageName") %>'></asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Customer Name" SortExpression="customerName">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("customerName") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("customerName") %>'></asp:TextBox>
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:LinkButton ID="lnkbtnCustomerName" runat="server" Text='<%# Bind("customerName") %>' OnClick="lnkbtnCustomerName_Click"></asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="serviceName" HeaderText="Service Team Name" SortExpression="serviceName" />
                 <asp:TemplateField HeaderText="Order Status">
                     <ItemTemplate>
                         <asp:Label ID="lblOrderStatus" runat="server" Text='<%#getOrderStatus(Eval("orderStatus")) %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Fields>
             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
         </asp:DetailsView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Orders.orderStatus, Orders.deliveryAddress, Orders.Package_packageID, Orders.Customer_customerID, Orders.ServiceTeam_serviceID, Packages.packageID, Packages.packageImage, Packages.packageName, Customers.customerID, Customers.customerName, ServiceTeams.serviceName FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID INNER JOIN ServiceTeams ON Orders.ServiceTeam_serviceID = ServiceTeams.serviceID WHERE (Orders.orderID = @orderID)">
             <SelectParameters>
                 <asp:QueryStringParameter Name="orderID" QueryStringField="orderid" />
             </SelectParameters>
         </asp:SqlDataSource>
         <br/>
         <asp:MultiView ID="MultiView1" runat="server">
             <asp:View ID="View1" runat="server">
                 <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="customerID" DataSourceID="SqlDataSource2" Height="50px" Width="636px" style="text-align: left">
                     <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                     <Fields>
                         <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                         <asp:BoundField DataField="customerNRC" HeaderText="Customer NRC" SortExpression="customerNRC" />
                         <asp:BoundField DataField="customerPhone" HeaderText="Customer Phone" SortExpression="customerPhone" />
                         <asp:BoundField DataField="customerAddress" HeaderText="Customer Address" SortExpression="customerAddress" />
                         <asp:BoundField DataField="customerEmail" HeaderText="Customer Email" SortExpression="customerEmail" />
                     </Fields>
                     <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                     <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                     <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                     <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                 </asp:DetailsView>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE ([customerID] = @customerID)">
                     <SelectParameters>
                         <asp:SessionParameter Name="customerID" SessionField="customerid" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:View>
             <asp:View ID="View2" runat="server">
                 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource3" OnDataBound="GridView1_DataBound" PageSize="6" ShowFooter="True">
                     <Columns>
                         <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                         <asp:TemplateField HeaderText="Item Image">
                             <ItemTemplate>
                                 <asp:Image ID="Image2" runat="server" Height="30px" Width="50px" ImageUrl='<%#getImage(Eval("itemImage")) %>' CssClass="listviewImage"/>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                         <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                         <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
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
                         <asp:TemplateField HeaderText="Item TotalPrice" SortExpression="totalPrice">
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
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Packages.packageID, Packages.packageName, Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory, Orders.orderID, Payments.amount, Payments.unitPrice, Payments.totalPrice FROM Items INNER JOIN Packages INNER JOIN Payments INNER JOIN Orders ON Payments.Order_orderID = Orders.orderID ON Packages.packageID = Orders.Package_packageID INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID ON Items.itemID = PackageItems.Item_itemID AND Items.itemID = Payments.itemID WHERE (Packages.packageID = @packageID) AND Orders.orderID=(@orderID)">
                     <SelectParameters>
                         <asp:SessionParameter Name="packageID" SessionField="packageid" />
                         <asp:QueryStringParameter Name="orderID" QueryStringField="orderid" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:View>
      </asp:MultiView>
         <br />
 <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBack_Click" />
   </fieldset>
   
</asp:Content>

