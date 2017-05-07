<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageServiceTeam.master" AutoEventWireup="true" CodeFile="ServiceTeamViewDetailPage.aspx.cs" Inherits="ServiceTeamViewDetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
        <legend>Detail Information</legend>
        <table style="width:100%;">
            <tr>
                <td style="width: 5%">&nbsp;</td>
                <td style="text-align: center">
      
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="88px" Width="723px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" style="text-align: left">
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="236px" Width="355px" ImageUrl='<%#getImage(Eval("packageImage")) %>' />
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
                            <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                            <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                            <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                            <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" SortExpression="deliveryAddress" />
                        </Fields>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="16pt" Text="Detail Information"></asp:Label>
                            <br />
                        </HeaderTemplate>
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    </asp:DetailsView>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID" DataSourceID="SqlDataSource3" Width="746px" AllowPaging="True" PageSize="6">
                        <Columns>
                            <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                            <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                            <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                            <asp:BoundField DataField="amount" HeaderText="Item Quantity" SortExpression="amount" />
                            <asp:BoundField DataField="unitPrice" HeaderText="Item UnitPrice" SortExpression="unitPrice" />
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
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style3">
            

            
                    <asp:Button ID="btnGoBack" runat="server" CssClass="btngroup" OnClick="btnGoBack_Click" Text="Go Back" />
            

            
                    <asp:Button ID="btnFinished" runat="server" OnClick="btnFinished_Click" OnClientClick="javascript:return confirm('Do you really want to \ndeliver that package? );" Text="Finished Delivery" CssClass="btngroup" />
                    </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
        </table>
          </fieldset>
        <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID], [ServiceTeam_serviceID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID, @ServiceTeam_serviceID)" SelectCommand="SELECT p.packageImage, o.orderID, o.orderDate, c.customerName, p.packageID, p.packageName, p.packageType, o.deliveryAddress FROM Customers AS c INNER JOIN Orders AS o ON c.customerID = o.Customer_customerID INNER JOIN Packages AS p ON o.Package_packageID = p.packageID WHERE (o.orderID = @orderID)" UpdateCommand="UPDATE [Orders] SET [orderDate] = @orderDate, [orderStatus] = @orderStatus, [deliveryAddress] = @deliveryAddress, [Package_packageID] = @Package_packageID, [Customer_customerID] = @Customer_customerID, [ServiceTeam_serviceID] = @ServiceTeam_serviceID WHERE [orderID] = @orderID">
                        <DeleteParameters>
                            <asp:Parameter Name="orderID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="orderID" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="orderDate" />
                            <asp:Parameter Name="orderStatus" Type="Int32" />
                            <asp:Parameter Name="deliveryAddress" Type="String" />
                            <asp:Parameter Name="Package_packageID" Type="Int32" />
                            <asp:Parameter Name="Customer_customerID" Type="Int32" />
                            <asp:Parameter Name="ServiceTeam_serviceID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="orderID" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter DbType="Date" Name="orderDate" />
                            <asp:Parameter Name="orderStatus" Type="Int32" />
                            <asp:Parameter Name="deliveryAddress" Type="String" />
                            <asp:Parameter Name="Package_packageID" Type="Int32" />
                            <asp:Parameter Name="Customer_customerID" Type="Int32" />
                            <asp:Parameter Name="ServiceTeam_serviceID" Type="Int32" />
                            <asp:Parameter Name="orderID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
            

            
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID], [ServiceTeam_serviceID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID, @ServiceTeam_serviceID)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE Orders SET orderStatus = 2 WHERE (orderID = @orderID)">
                        <DeleteParameters>
                            <asp:Parameter Name="orderID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="orderID" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="orderDate" />
                            <asp:Parameter Name="orderStatus" Type="Int32" />
                            <asp:Parameter Name="deliveryAddress" Type="String" />
                            <asp:Parameter Name="Package_packageID" Type="Int32" />
                            <asp:Parameter Name="Customer_customerID" Type="Int32" />
                            <asp:Parameter Name="ServiceTeam_serviceID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter DbType="Date" Name="orderDate" />
                            <asp:Parameter Name="orderStatus" Type="Int32" />
                            <asp:Parameter Name="deliveryAddress" Type="String" />
                            <asp:Parameter Name="Package_packageID" Type="Int32" />
                            <asp:Parameter Name="Customer_customerID" Type="Int32" />
                            <asp:Parameter Name="ServiceTeam_serviceID" Type="Int32" />
                            <asp:QueryStringParameter Name="orderID" QueryStringField="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Payments.paymentID, Items.itemImage, Items.itemName, Items.itemCategory, Payments.amount, Payments.unitPrice FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID INNER JOIN Items ON PackageItems.Item_itemID = Items.itemID AND Payments.itemID = Items.itemID WHERE (Orders.orderID = @orderID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="orderID" QueryStringField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </asp:Content>

