<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerReadyPackageDetails.aspx.cs" Inherits="CustomerReadyPackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            height: 23px;
            width: 106px;
        }
        .auto-style2 {
            height: 23px;
            width: 116px;
        }
        .auto-style1 {
            height: 23px;
        }
        .auto-style6 {
            width: 106px;
        }
        .auto-style3 {
            width: 116px;
        }
        .auto-style8 {
            width: 80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table style="width:100%;" class="tex">
            <tr>
                <td class="auto-style8">
                        <fieldset class="coffeecustomerInfo">
                            <legend class="tex">Package Detail Page</legend>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="packageID" DataSourceID="SqlDataSource1" Height="50px" Width="620px" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" style="text-align: left" OnPreRender="DetailsView1_PreRender">
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="266px" Width="425px" ImageUrl='<%#getImage(Eval("packageImage")) %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                            <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnGoBack" runat="server" CssClass="btngroup" Text="Go Back" OnClick="btnGoBack_Click" width="120px"/>
                                    <asp:Button ID="btnAddToCart" runat="server" CssClass="btngroup" Text="Add To Cart" OnClick="btnAddToCart_Click" width="158px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    </asp:DetailsView>
                            <br/>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="SqlDataSource2" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowPaging="True" PageSize="6">
                                <Columns>
                                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                    <asp:TemplateField HeaderText="Item Image">
                                        <ItemTemplate>
                                            <asp:Image ID="Image2" runat="server" Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                    <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                    <asp:BoundField DataField="itemPrice" HeaderText="Item Price " SortExpression="itemPrice" />
                                    <asp:TemplateField HeaderText="Item Scale">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#getStatus(Eval("itemCategory")) %>'></asp:Label>
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory FROM Items INNER JOIN PackageItems ON Items.itemID = PackageItems.Item_itemID INNER JOIN Packages ON PackageItems.Package_packageID = Packages.packageID WHERE (Packages.packageID = @packageID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="packageID" QueryStringField="packageid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </fieldset>
                    </td>
            </tr>
            </table>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT * FROM [AddToCarts]" UpdateCommand="UPDATE [AddToCarts] SET [packageID] = @packageID, [itemID] = @itemID, [orderID] = @orderID, [paymentID] = @paymentID, [sessionID] = @sessionID, [Qty] = @Qty WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="packageID" SessionField="pid" Type="String" />
                <asp:SessionParameter Name="itemID" SessionField="iid" Type="String" />
                <asp:SessionParameter Name="orderID" SessionField="orderid" Type="String" />
                <asp:SessionParameter Name="paymentID" SessionField="payID" Type="String" />
                <asp:SessionParameter Name="sessionID" SessionField="sid" Type="String" />
                <asp:Parameter Name="Qty" Type="Int32" DefaultValue="1" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="packageID" Type="String" />
                <asp:Parameter Name="itemID" Type="String" />
                <asp:Parameter Name="orderID" Type="String" />
                <asp:Parameter Name="paymentID" Type="String" />
                <asp:Parameter Name="sessionID" Type="String" />
                <asp:Parameter Name="Qty" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID], [ServiceTeam_serviceID], [Payment_paymentID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID, @ServiceTeam_serviceID, @Payment_paymentID)" SelectCommand="SELECT Max([orderID])  FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [orderDate] = @orderDate, [orderStatus] = @orderStatus, [deliveryAddress] = @deliveryAddress, [Package_packageID] = @Package_packageID, [Customer_customerID] = @Customer_customerID, [ServiceTeam_serviceID] = @ServiceTeam_serviceID, [Payment_paymentID] = @Payment_paymentID WHERE [orderID] = @orderID">
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
                <asp:Parameter Name="Payment_paymentID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="orderDate" />
                <asp:Parameter Name="orderStatus" Type="Int32" />
                <asp:Parameter Name="deliveryAddress" Type="String" />
                <asp:Parameter Name="Package_packageID" Type="Int32" />
                <asp:Parameter Name="Customer_customerID" Type="Int32" />
                <asp:Parameter Name="ServiceTeam_serviceID" Type="Int32" />
                <asp:Parameter Name="Payment_paymentID" Type="Int32" />
                <asp:Parameter Name="orderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
 
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Payments] WHERE [paymentID] = @paymentID" InsertCommand="INSERT INTO [Payments] ([paymentID], [unitPrice], [amount], [totalPrice], [itemID]) VALUES (@paymentID, @unitPrice, @amount, @totalPrice, @itemID)" SelectCommand="SELECT MAX(paymentID) FROM [Payments]" UpdateCommand="UPDATE [Payments] SET [unitPrice] = @unitPrice, [amount] = @amount, [totalPrice] = @totalPrice, [itemID] = @itemID WHERE [paymentID] = @paymentID">
            <DeleteParameters>
                <asp:Parameter Name="paymentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="unitPrice" Type="Int32" />
                <asp:Parameter Name="amount" Type="Decimal" />
                <asp:Parameter Name="totalPrice" Type="Decimal" />
                <asp:Parameter Name="itemID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="unitPrice" Type="Int32" />
                <asp:Parameter Name="amount" Type="Decimal" />
                <asp:Parameter Name="totalPrice" Type="Decimal" />
                <asp:Parameter Name="itemID" Type="Int32" />
                <asp:Parameter Name="paymentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Packages] WHERE ([packageID] = @packageID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="packageID" QueryStringField="packageid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PackageTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PackageTable] ([packageID], [SessionID]) VALUES (@packageID, @SessionIDl)" SelectCommand="SELECT * FROM [PackageTable]" UpdateCommand="UPDATE [PackageTable] SET [packageID] = @packageID, [SessionID] = @SessionID, [GrandTotal] = @GrandTotal WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="packageID" SessionField="packageid" />
                            <asp:SessionParameter Name="SessionIDl" SessionField="sessionid" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="packageID" Type="Int32" />
                            <asp:Parameter Name="SessionID" Type="Int32" />
                            <asp:Parameter Name="GrandTotal" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
        </asp:SqlDataSource>
                    </asp:Content>

