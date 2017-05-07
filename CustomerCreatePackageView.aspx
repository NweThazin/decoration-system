<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerCreatePackageView.aspx.cs" Inherits="CustomerCreatePackageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style2 {
            height: 30px;
        }
        .auto-style1 {
            width: 20%;
            height: 30px;
        }
        .auto-style3 {
            height: 23px;
            text-align: left;
        }
        .auto-style4 {
            height: 23px;
            text-align: right;
        }
        .auto-style6 {
            text-align: right;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
         <asp:MultiView ID="MultiView1" runat="server">
             <asp:View ID="View1" runat="server">
                     <fieldset class="coffeecustomerInfo">
                            <legend>Customer Create Page Detail View</legend>
                         <table class="tex" style="width:100%; position: inherit;">
                             <tr>
                                 <td colspan="2">
                                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID,Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center" OnDataBound="GridView1_DataBound" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True" Width="742px" AllowPaging="True" PageSize="6" style="text-align: left">
                                         <Columns>
                                             <asp:TemplateField HeaderText="Item Name" SortExpression="itemName"><EditItemTemplate><asp:Label ID="lblItemName" runat="server" Text='<%# Bind("itemName") %>'></asp:Label></EditItemTemplate><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("itemName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                             <asp:TemplateField HeaderText="Item UnitPrice" SortExpression="itemPrice"><EditItemTemplate><asp:Label ID="lblItemUnitPrice" runat="server" Text='<%# Bind("itemPrice") %>'></asp:Label></EditItemTemplate><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Bind("itemPrice") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                             <asp:TemplateField HeaderText="Item Quantity" SortExpression="Qty"><EditItemTemplate><asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox></EditItemTemplate><FooterTemplate>Grand Total</FooterTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("Qty") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                             <asp:TemplateField HeaderText="Total Price"><EditItemTemplate><asp:Label ID="lblTotalPriceItemEdit" runat="server" Text='<%#getTotal(Eval("Qty"),Eval("itemPrice")) %>'></asp:Label></EditItemTemplate><FooterTemplate><asp:Label ID="lblGrandTotal" runat="server"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="lblTotalPriceItem" runat="server" Text='<%#getTotal(Eval("Qty"),Eval("itemPrice")) %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                             <asp:HyperLinkField HeaderText="Change" DataNavigateUrlFields="itemID,Id" DataNavigateUrlFormatString="CustomerCreatePackageChange.aspx?itemchangeid={0}&amp;cartid={1}" Text="Change Items" />
                                             <asp:CommandField ShowEditButton="True" />
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
                                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AddToCarts.orderID, Items.itemID, Items.itemImage, Items.itemName, Items.itemPrice, AddToCarts.Qty, AddToCarts.Id FROM AddToCarts INNER JOIN Items ON AddToCarts.itemID = Items.itemID WHERE (AddToCarts.sessionID = @sessionID) AND (AddToCarts.packageID = @packageID)" UpdateCommand="UPDATE AddToCarts SET Qty = @Qty WHERE (itemID = @itemID)">
                                         <SelectParameters>
                                             <asp:SessionParameter Name="sessionID" SessionField="sessionid" />
                                             <asp:SessionParameter Name="packageID" SessionField="packageid" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:SessionParameter Name="Qty" SessionField="itemqty" />
                                             <asp:SessionParameter Name="itemID" SessionField="itemid" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                 </td>
                             </tr>
                             <tr>
                                 <td class="auto-style2" colspan="2">
                                     <br />
                                     <asp:Button ID="btnBuy" runat="server" CssClass="btngroup" Height="29px" OnClick="btnBuy_Click" OnClientClick="javascript:return confirm('Are u sure to create the package?');" Text="Buy" Width="90px" />
                                     <asp:Button ID="btnCancel" runat="server" CssClass="btngroup" Height="29px" OnClick="btnCancel_Click" OnClientClick="javascript:return confirm('Are u sure to delete orders?')" Text="Delete" Width="90px" />
                                     <br />
                                     &nbsp;<asp:Label ID="lblPackageOrder" runat="server" CssClass="validatorGroup" ForeColor="Red"></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td class="auto-style2" style="text-align: center">
                                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [orderDate] = @orderDate, [orderStatus] = @orderStatus, [deliveryAddress] = @deliveryAddress, [Package_packageID] = @Package_packageID, [Customer_customerID] = @Customer_customerID, [ServiceTeam_serviceID] = @ServiceTeam_serviceID WHERE [orderID] = @orderID">
                                         <DeleteParameters>
                                             <asp:Parameter Name="orderID" Type="Int32" />
                                         </DeleteParameters>
                                         <InsertParameters>
                                             <asp:SessionParameter Name="orderID" SessionField="orderid" />
                                             <asp:SessionParameter Name="orderDate" SessionField="orderdate" />
                                             <asp:Parameter DefaultValue="0" Name="orderStatus" />
                                             <asp:SessionParameter Name="deliveryAddress" SessionField="deliveryaddress" />
                                             <asp:SessionParameter Name="Package_packageID" SessionField="packageid" />
                                             <asp:SessionParameter DefaultValue="" Name="Customer_customerID" SessionField="userid" />
                                         </InsertParameters>
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
                                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Payments] WHERE [id] = @id" InsertCommand="INSERT INTO [Payments] ([paymentID], [unitPrice], [amount], [totalPrice], [itemID], [Order_orderID]) VALUES (@paymentID, @unitPrice, @amount, @totalPrice, @itemID, @Order_orderID)" SelectCommand="SELECT * FROM [Payments]" UpdateCommand="UPDATE [Payments] SET [paymentID] = @paymentID, [unitPrice] = @unitPrice, [amount] = @amount, [totalPrice] = @totalPrice, [itemID] = @itemID, [Order_orderID] = @Order_orderID WHERE [id] = @id">
                                         <DeleteParameters>
                                             <asp:Parameter Name="id" Type="Int32" />
                                         </DeleteParameters>
                                         <InsertParameters>
                                             <asp:SessionParameter Name="paymentID" SessionField="paymentid" Type="Int32" />
                                             <asp:SessionParameter Name="unitPrice" SessionField="punitprice" Type="Int32" />
                                             <asp:SessionParameter Name="amount" SessionField="pamount" Type="Decimal" />
                                             <asp:SessionParameter Name="totalPrice" SessionField="ptotalprice" Type="Decimal" />
                                             <asp:SessionParameter Name="itemID" SessionField="itemid" Type="Int32" />
                                             <asp:SessionParameter Name="Order_orderID" SessionField="orderid" Type="Int32" />
                                         </InsertParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="paymentID" Type="Int32" />
                                             <asp:Parameter Name="unitPrice" Type="Int32" />
                                             <asp:Parameter Name="amount" Type="Decimal" />
                                             <asp:Parameter Name="totalPrice" Type="Decimal" />
                                             <asp:Parameter Name="itemID" Type="Int32" />
                                             <asp:Parameter Name="Order_orderID" Type="Int32" />
                                             <asp:Parameter Name="id" Type="Int32" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PackageItems] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PackageItems] ([Package_packageID], [Item_itemID]) VALUES (@Package_packageID, @Item_itemID)" SelectCommand="SELECT * FROM [PackageItems]" UpdateCommand="UPDATE [PackageItems] SET [Package_packageID] = @Package_packageID, [Item_itemID] = @Item_itemID WHERE [Id] = @Id">
                                         <DeleteParameters>
                                             <asp:Parameter Name="Id" Type="Int32" />
                                         </DeleteParameters>
                                         <InsertParameters>
                                             <asp:SessionParameter Name="Package_packageID" SessionField="packageid" Type="Int32" />
                                             <asp:SessionParameter Name="Item_itemID" SessionField="itemid" Type="Int32" />
                                         </InsertParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="Package_packageID" Type="Int32" />
                                             <asp:Parameter Name="Item_itemID" Type="Int32" />
                                             <asp:Parameter Name="Id" Type="Int32" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" SelectCommand="SELECT * FROM [Items] WHERE ([itemID] = @itemID)" UpdateCommand="UPDATE Items SET itemQuantity = itemQuantity - @itemquantity WHERE (itemID = @itemid)">
                                         <DeleteParameters>
                                             <asp:Parameter Name="itemID" Type="Int32" />
                                         </DeleteParameters>
                                         <InsertParameters>
                                             <asp:Parameter Name="itemID" Type="Int32" />
                                             <asp:Parameter Name="itemName" Type="String" />
                                             <asp:Parameter Name="itemCategory" Type="String" />
                                             <asp:Parameter Name="itemImage" Type="Object" />
                                             <asp:Parameter Name="itemQuantity" Type="Int32" />
                                             <asp:Parameter Name="itemPrice" Type="Int32" />
                                             <asp:Parameter Name="itemSubCategory" Type="String" />
                                         </InsertParameters>
                                         <SelectParameters>
                                             <asp:SessionParameter Name="itemID" SessionField="itemid" Type="Int32" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:SessionParameter Name="itemquantity" SessionField="itemquantity" />
                                             <asp:SessionParameter Name="itemid" SessionField="itemID" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemName] = @itemName)">
                                         <SelectParameters>
                                             <asp:SessionParameter Name="itemName" SessionField="iName" Type="String" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                 </td>
                                 <td class="auto-style1">&nbsp;</td>
                             </tr>
                         </table>
                 </fieldset>
             </asp:View>
             <asp:View ID="View2" runat="server">
                 <fieldset class="coffeecustomerInfo">
                     <legend>Order Payment Form</legend>

                     <table class="tex" style="width:100%;height:100%">
                         <tr>
                             <td class="auto-style6">Delivery Address::</td>
                             <td style="text-align: left">
                                 <asp:TextBox ID="txtDeliveryAddress" runat="server" Height="56px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDeliveryAddress" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style6">Bank Name::</td>
                             <td style="text-align: left">
                                 <asp:RadioButtonList ID="radbtnCardType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                     <asp:ListItem Selected="True" Value="AYA">Ayerwaddy Bank</asp:ListItem>
                                     <asp:ListItem>KBZ</asp:ListItem>
                                 </asp:RadioButtonList>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style6">Bank Account Number::</td>
                             <td class="auto-style3">
                                 <asp:TextBox ID="txtCardNumber" runat="server" Width="200px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="money">*</asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCardNumber" CssClass="validatorGroup" EnableTheming="True" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" ValidationGroup="money">####-####-####-####</asp:RegularExpressionValidator>
                             </td>
                         </tr>
                         <tr>
                             <td colspan="2">
                                 <br />
                                 <asp:Button ID="btnMoneyConfirm" runat="server" CssClass="btngroup" Height="29px" OnClick="btnMoneyConfirm_Click" Text="Confirm" ValidationGroup="money" Width="90px" />
                                 <asp:Button ID="btnMoneyCancel" runat="server" CssClass="btngroup" Height="29px" OnClick="btnMoneyCancel_Click" Text="Cancel" Width="90px" CausesValidation="False" />
                                 <br />
                                 <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="validatorGroup"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style4" colspan="2">
                                 <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages]" UpdateCommand="UPDATE Packages SET packageCount=packageCount+1 WHERE packageID=(@packageid)">
                                     <DeleteParameters>
                                         <asp:Parameter Name="packageID" Type="Int32" />
                                     </DeleteParameters>
                                     <InsertParameters>
                                         <asp:Parameter Name="packageID" Type="Int32" />
                                         <asp:Parameter Name="packageName" Type="String" />
                                         <asp:Parameter Name="packageType" Type="String" />
                                         <asp:Parameter Name="packageImage" Type="Object" />
                                         <asp:Parameter Name="packageStatus" Type="Int32" />
                                         <asp:Parameter Name="packageCount" Type="Int32" />
                                     </InsertParameters>
                                     <UpdateParameters>
                                         <asp:SessionParameter Name="packageid" SessionField="packageid" />
                                     </UpdateParameters>
                                 </asp:SqlDataSource>
                                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Banks] WHERE [bankID] = @bankID" InsertCommand="INSERT INTO [Banks] ([cardNumber], [amount], [bankName]) VALUES (@cardNumber, @amount, @bankName)" SelectCommand="SELECT * FROM [Banks] WHERE (([bankName] = @bankName) AND ([cardNumber] = @cardNumber) AND ([amount] &gt; @amount))" UpdateCommand="UPDATE Banks SET amount = amount - @amount WHERE (cardNumber = @cardNum)">
                                     <DeleteParameters>
                                         <asp:Parameter Name="bankID" Type="Int32" />
                                     </DeleteParameters>
                                     <InsertParameters>
                                         <asp:Parameter Name="cardNumber" Type="String" />
                                         <asp:Parameter Name="amount" Type="Decimal" />
                                         <asp:Parameter Name="bankName" Type="String" />
                                     </InsertParameters>
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="radbtnCardType" Name="bankName" PropertyName="SelectedValue" Type="String" />
                                         <asp:ControlParameter ControlID="txtCardNumber" Name="cardNumber" PropertyName="Text" Type="String" />
                                         <asp:SessionParameter Name="amount" SessionField="grandtotal" Type="Decimal" />
                                     </SelectParameters>
                                     <UpdateParameters>
                                         <asp:SessionParameter Name="amount" SessionField="grandtotal" />
                                         <asp:ControlParameter ControlID="txtCardNumber" Name="cardNum" PropertyName="Text" />
                                     </UpdateParameters>
                                 </asp:SqlDataSource>
                                 <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MAX(orderID) AS Expr1 FROM Orders"></asp:SqlDataSource>
                             </td>
                         </tr>
                     </table>

                 </fieldset></asp:View>
         </asp:MultiView>
    
         <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType,@packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages]" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
             <DeleteParameters>
                 <asp:Parameter Name="packageID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:SessionParameter Name="packageID" SessionField="packageid" />
                 <asp:SessionParameter Name="packageName" SessionField="packagename" />
                 <asp:Parameter DefaultValue="UserType" Name="packageType" />
                 <asp:Parameter DefaultValue="1" Name="packageStatus" />
                 <asp:Parameter DefaultValue="0" Name="packageCount" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="packageName" Type="String" />
                 <asp:Parameter Name="packageType" Type="String" />
                 <asp:Parameter Name="packageImage" Type="Object" />
                 <asp:Parameter Name="packageStatus" Type="Int32" />
                 <asp:Parameter Name="packageCount" Type="Int32" />
                 <asp:Parameter Name="packageID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
    
         <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM AddToCarts WHERE (sessionID = @sid) AND (packageID = @pid)" SelectCommand="SELECT * FROM [AddToCarts] WHERE (([packageID] = @packageID) AND ([sessionID] = @sessionID))">
             <DeleteParameters>
                 <asp:SessionParameter Name="sid" SessionField="sessionid" />
                 <asp:SessionParameter Name="pid" SessionField="packageid" />
             </DeleteParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="packageID" SessionField="packageid" Type="String" />
                 <asp:SessionParameter Name="sessionID" SessionField="sessionid" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
    
         <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Max([paymentID]) FROM [Payments]"></asp:SqlDataSource>
    
</asp:Content>

