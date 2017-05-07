<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageServiceTeam.master" AutoEventWireup="true" CodeFile="ServiceTeamViewCreateDetail.aspx.cs" Inherits="ServiceTeamViewCreateDetail" %>

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
        <table style="width:100%;" align="center">
        <tr>
            <td class="auto-style3">

                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource2" Height="50px" Width="515px" style="margin-left: 0px">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="orderID" HeaderText="Order Number" SortExpression="orderID" />
                        <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
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
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                </asp:DetailsView>
                <br />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" PageSize="6" style="text-align: left" Width="949px">
                    <Columns>
                        <asp:TemplateField HeaderText="Item Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
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

            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Button ID="btnGoBack" runat="server" CssClass="btngroup" OnClick="btnGoBack_Click" Text="Go Back" />
                <asp:Button ID="btnDelivery" runat="server" OnClick="btnDelivery_Click" OnClientClick="javascript:return confirm('Do you really want to \ndeliver that package? );" Text="Finished Delivery" Height="37px" Width="192px" CssClass="btngroup" />
            </td>
        </tr>
        </table>
        </fieldset>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID], [ServiceTeam_serviceID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID, @ServiceTeam_serviceID)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE Orders SET orderStatus = 2 WHERE (orderID = @orderID)">
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
      
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT o.orderID, o.orderDate, c.customerName, p.packageID, p.packageName, p.packageType, o.deliveryAddress FROM Customers AS c INNER JOIN Orders AS o ON c.customerID = o.Customer_customerID INNER JOIN Packages AS p ON o.Package_packageID = p.packageID WHERE (o.orderID = @orderID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="orderID" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Payments.paymentID, Items.itemImage, Items.itemName, Items.itemCategory, Payments.amount, Payments.unitPrice FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID INNER JOIN Items ON PackageItems.Item_itemID = Items.itemID AND Payments.itemID = Items.itemID WHERE (Orders.orderID = @orderID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="orderID" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                            
</asp:Content>

