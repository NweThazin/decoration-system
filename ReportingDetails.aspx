<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ReportingDetails.aspx.cs" Inherits="ReportingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <fieldset class="customerInfo">
                <legend>Financial Report Detail</legend>
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID" DataSourceID="SqlDataSource1" Height="50px" Width="458px" style="text-align: left">
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="paymentID" HeaderText="Invoice Number" SortExpression="paymentID" />
                            <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
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
                            <asp:TemplateField HeaderText="Order Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblOrderStatus" runat="server" Text='<%#getOrderStatus(Eval("orderStatus")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" SortExpression="deliveryAddress" />
                            <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                            <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                        </Fields>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Orders.orderStatus, Orders.deliveryAddress, Payments.paymentID, Packages.packageName, Customers.customerName FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID WHERE (Orders.orderID = @orderID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="orderID" QueryStringField="oid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        
                    <br />
        
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" PageSize="6" Width="1075px" OnDataBound="GridView1_DataBound1" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="itemID" HeaderText="Item Number" SortExpression="itemID" />
                            <asp:TemplateField HeaderText="Item Image">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                            <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Orders.orderStatus, Orders.deliveryAddress, Payments.paymentID, Payments.itemID, Payments.amount, Payments.unitPrice, Payments.totalPrice, Packages.packageName, Customers.customerID, Customers.customerName, Items.itemName, Items.itemImage, Items.itemCategory FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID INNER JOIN Items ON Payments.itemID = Items.itemID WHERE (Orders.orderID = @orderID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="orderID" QueryStringField="oid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <br />
                    <asp:Button ID="btnGoBack" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBack_Click" Text="Go Back" />
                </td>
            </tr>
        </table>
              </fieldset>
</asp:Content>

