<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminHomeOrderPackageDetail.aspx.cs" Inherits="AdminHomeOrderPackageDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <fieldset class="customerInfo">
        <legend>Customer Create Package Order Detail Information</legend>
    <table style="width: 100%; height:inherit">
        <tr>
            <td>
                <table style="width:100%;">
                            <tr>
                                <td class="auto-style1">
                                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID,packageID,customerID" DataSourceID="SqlDataSource1" Height="50px" Width="565px" style="text-align: left">
                                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <Fields>
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
                                            <asp:TemplateField HeaderText="Package Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnnkbtnPackageName" runat="server" Text='<%# Bind("packageName") %>' OnClick="lnnkbtnPackageName_Click"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnCustName" runat="server" OnClick="lnkbtnCustName_Click" Text='<%# Bind("customerName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    </asp:DetailsView>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    Choose Service Team:&nbsp;
                                    <asp:DropDownList ID="ddlServiceTeam" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="serviceName" DataValueField="serviceID" CssClass="dropdownlist" Height="42px" Width="149px">
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnGiveServiceTeam" runat="server" CssClass="btngroup" OnClick="btnGiveServiceTeam_Click" Text="Give Service Team" Height="41px" Width="189px" />
                                </td>
                            </tr>
                            </table>
              
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View2" runat="server">
                   
                        <table style="width:100%;">
                            <tr>
                                <td style="text-align: center">
                                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="customerID" DataSourceID="SqlDataSource2" Height="50px" Width="556px" style="text-align: left">
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
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td style="text-align: center">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource3" PageSize="6" Width="1012px" OnDataBound="GridView1_DataBound" ShowFooter="True">
                                        <Columns>
                                            <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                                            <asp:TemplateField HeaderText="Item Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" Height="30px" Width="50px" ImageUrl='<%#getImage(Eval("itemImage")) %>' CssClass="listviewImage"/>
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
                                </td>
                            </tr>
                        </table>
                    </asp:View>

                </asp:MultiView>
            </td>
        </tr>
        </table>

          <br />

          <asp:Button ID="btnGoBack" runat="server" CausesValidation="False" CssClass="btngroup" Text="Go Back" OnClick="btnGoBack_Click" />
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE ([customerID] = @customerID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="customerID" SessionField="customerid" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Orders.deliveryAddress, Packages.packageID, Packages.packageName, Packages.packageType, Customers.customerID, Customers.customerName FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID WHERE (Orders.orderID = @orderID)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="orderID" QueryStringField="orderid" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Packages.packageID, Packages.packageName, Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory, Orders.orderID, Payments.amount, Payments.unitPrice, Payments.totalPrice FROM Items INNER JOIN Packages INNER JOIN Payments INNER JOIN Orders ON Payments.Order_orderID = Orders.orderID ON Packages.packageID = Orders.Package_packageID INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID ON Items.itemID = PackageItems.Item_itemID AND Items.itemID = Payments.itemID WHERE (Packages.packageID = @packageID) AND (Orders.orderID = @orderID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="packageID" SessionField="packageid" />
                                            <asp:SessionParameter Name="orderID" SessionField="orderid" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ServiceTeams]"></asp:SqlDataSource>
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
                        <asp:ControlParameter ControlID="ddlServiceTeam" Name="ServiceTeam_serviceID" PropertyName="SelectedValue" DefaultValue="" />
                        <asp:QueryStringParameter DefaultValue="" Name="orderID" QueryStringField="orderid" />
                    </UpdateParameters>
                </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [serviceName] FROM [ServiceTeams] WHERE ([serviceID] = @serviceID)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="ddlServiceTeam" Name="serviceID" PropertyName="SelectedValue" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [paymentID] FROM [Payments] WHERE ([Order_orderID] = @Order_orderID)">
              <SelectParameters>
                  <asp:QueryStringParameter Name="Order_orderID" QueryStringField="orderid" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
          </fieldset>
</asp:Content>

