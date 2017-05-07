<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminHomeReadyPackageDetail.aspx.cs" Inherits="AdminHomeReadyPackageDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 2%;
            height: 23px;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            width: 2%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
                <legend>Customer Provided Package Order Detail Information</legend>
    <table style="width:100%;">
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style2" rowspan="3">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID,packageID,customerID" DataSourceID="SqlDataSource1" Height="50px" Width="724px" style="text-align: left">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="266px" Width="425px" ImageUrl='<%#getImage(Eval("packageImage")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                        <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" SortExpression="deliveryAddress" />
                        <asp:BoundField DataField="packageID" HeaderText="Package Number" ReadOnly="True" SortExpression="packageID" />
                        <asp:TemplateField HeaderText="Package Name" SortExpression="packageName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("packageName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("packageName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnPackageName" runat="server" OnClick="lnkbtnPackageName_Click" Text='<%# Bind("packageName") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                        <asp:TemplateField HeaderText="Customer Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnCustomerName" runat="server" Text='<%# Bind("customerName") %>' OnClick="lnkbtnCustomerName_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                </asp:DetailsView>
                <div class="auto-style2">
&nbsp;Choose Service Team:<asp:DropDownList ID="ddlServiceTeamName" runat="server" AutoPostBack="True" CssClass="dropdownlist" DataSourceID="SqlDataSource2" DataTextField="serviceName" DataValueField="serviceID">
                    </asp:DropDownList>

                    &nbsp;<asp:Button ID="btnGiveServiceTeam" runat="server" CssClass="btngroup" Text="Give Service Team" OnClick="btnGiveServiceTeam_Click" />
                <br />
                </div>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="customerID" DataSourceID="SqlDataSource4" Height="50px" Width="587px" style="text-align: left">
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
                  
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE ([customerID] = @customerID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="customerID" SessionField="customerid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [serviceName], [serviceID] FROM [ServiceTeams]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID], [ServiceTeam_serviceID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID, @ServiceTeam_serviceID)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [orderStatus] = @orderStatus,[ServiceTeam_serviceID] =@ServiceTeam_serviceID WHERE [orderID] = @orderID">
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
                                <asp:Parameter DefaultValue="1" Name="orderStatus" />
                                <asp:ControlParameter ControlID="ddlServiceTeamName" DefaultValue="" Name="ServiceTeam_serviceID" PropertyName="SelectedValue" />
                                <asp:QueryStringParameter Name="orderID" QueryStringField="orderid" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource3" OnDataBound="GridView1_DataBound" PageSize="6" ShowFooter="True" DataKeyNames="orderID">
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Packages.packageName, Items.itemName, Items.itemCategory, Items.itemSubCategory, Orders.orderID, Payments.amount, Payments.unitPrice, Payments.totalPrice, Items.itemImage FROM Payments INNER JOIN Orders ON Payments.Order_orderID = Orders.orderID INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID INNER JOIN Items ON PackageItems.Item_itemID = Items.itemID AND Payments.itemID = Items.itemID WHERE (Orders.Package_packageID = @packageid) AND (Orders.orderID = @orderid)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="packageid" SessionField="packageid" />
                                <asp:SessionParameter Name="orderid" SessionField="orderid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Packages.packageImage, Orders.deliveryAddress, Packages.packageID, Packages.packageName, Packages.packageType, Customers.customerID, Customers.customerName FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID WHERE (Orders.orderID = @orderID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="orderID" QueryStringField="orderid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                 
                </asp:MultiView>
      
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
        </tr>
    </table>
                <br />
        <asp:Button ID="lnkbtnGoBack" runat="server" Text="Go Back" CssClass="btngroup" OnClick="lnkbtnGoBack_Click" />
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [serviceName] FROM [ServiceTeams] WHERE ([serviceID] = @serviceID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlServiceTeamName" Name="serviceID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT paymentID FROM Payments WHERE (Order_orderID = @Order_orderID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Order_orderID" QueryStringField="orderid" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </fieldset>
</asp:Content>

