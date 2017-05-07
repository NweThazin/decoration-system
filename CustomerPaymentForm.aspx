<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerPaymentForm.aspx.cs" Inherits="CustomerPaymentForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <fieldset class="coffeecustomerInfo">
        <legend>Order Payment Form</legend>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Delivery Address::</td>
                <td style="text-align: left">
                    <asp:TextBox ID="dAddressTextBox" runat="server" Height="49px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dAddressTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Bank Name::</td>
                <td style="text-align: left">
                    <asp:RadioButtonList ID="radbtnBankName" runat="server" RepeatDirection="Horizontal" CssClass="tex" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="AYA">Ayerwaddy Bank</asp:ListItem>
                        <asp:ListItem>KBZ</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Bank Account Number::</td>
                <td style="text-align: left">
                    <asp:TextBox ID="AccNoTextBox" runat="server" Height="22px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AccNoTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AccNoTextBox" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\d{4}-\d{4}-\d{4}-\d{4}" CssClass="validatorGroup">####-####-####-####</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Confirm" CssClass="btngroup" Height="33px" Width="86px" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btngroup" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" />
                    <br />
                    <asp:Label ID="lblmessage" runat="server" CssClass="validatorGroup" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages] WHERE ([packageID] = @packageID)" UpdateCommand="UPDATE [Packages] SET  [packageCount] = ([packageCount] +1) WHERE [packageID] = @packageID">
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
                        <SelectParameters>
                            <asp:SessionParameter Name="packageID" SessionField="pid" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="packageName" Type="String" />
                            <asp:Parameter Name="packageType" Type="String" />
                            <asp:Parameter Name="packageImage" Type="Object" />
                            <asp:Parameter Name="packageStatus" Type="Int32" />
                            <asp:Parameter Name="packageCount" Type="Int32" />
                            <asp:SessionParameter Name="packageID" SessionField="pid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT * FROM [AddToCarts] WHERE (([packageID] = @packageID) AND ([sessionID] = @sessionID))" UpdateCommand="UPDATE [AddToCarts] SET [packageID] = @packageID, [itemID] = @itemID, [orderID] = @orderID, [paymentID] = @paymentID, [sessionID] = @sessionID, [Qty] = @Qty WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="packageID" Type="String" />
                            <asp:Parameter Name="itemID" Type="String" />
                            <asp:Parameter Name="orderID" Type="String" />
                            <asp:Parameter Name="paymentID" Type="String" />
                            <asp:Parameter Name="sessionID" Type="String" />
                            <asp:Parameter Name="Qty" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="packageID" SessionField="pid" Type="String" />
                            <asp:SessionParameter Name="sessionID" SessionField="sid" Type="String" />
                        </SelectParameters>
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
            
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Items.itemID, Items.itemQuantity, Items.itemPrice, Packages.packageID FROM Items INNER JOIN PackageItems ON Items.itemID = PackageItems.Item_itemID INNER JOIN Packages ON PackageItems.Package_packageID = Packages.packageID WHERE (Packages.packageID = @pid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="pid" SessionField="pid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" SelectCommand="SELECT * FROM [Items] WHERE ([itemID] = @itemID)" UpdateCommand="UPDATE [Items] SET [itemQuantity] = @itemQuantity WHERE [itemID] = @itemID">
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
                            <asp:SessionParameter Name="itemID" SessionField="IID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="itemID" SessionField="IID" Type="Int32" />
                            <asp:SessionParameter Name="itemQuantity" SessionField="qty" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Max([orderID]) FROM [Orders]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Max([paymentID]) FROM [Payments]"></asp:SqlDataSource>
                </td>
                <td style="text-align: left">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Banks] WHERE (([bankName] = @bankName) AND ([cardNumber] = @cardNumber) AND ([amount] &gt; @amount))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="radbtnBankName" Name="bankName" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AccNoTextBox" Name="cardNumber" PropertyName="Text" Type="String" />
                            <asp:SessionParameter Name="amount" SessionField="GrandTotal" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [orderDate] = @orderDate, [orderStatus] = @orderStatus, [deliveryAddress] = @deliveryAddress, [Package_packageID] = @Package_packageID, [Customer_customerID] = @Customer_customerID, [ServiceTeam_serviceID] = @ServiceTeam_serviceID WHERE [orderID] = @orderID">
                            <DeleteParameters>
                                <asp:Parameter Name="orderID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="orderID" SessionField="orderid" Type="Int32" />
                                <asp:SessionParameter DbType="Date" Name="orderDate" SessionField="orderdate" />
                                <asp:Parameter DefaultValue="0" Name="orderStatus" Type="Int32" />
                                <asp:ControlParameter ControlID="dAddressTextBox" DefaultValue="" Name="deliveryAddress" PropertyName="Text" Type="String" />
                                <asp:SessionParameter Name="Package_packageID" SessionField="pid" Type="Int32" />
                                <asp:SessionParameter Name="Customer_customerID" SessionField="cid" Type="Int32" />
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
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerID] = @customerID" SelectCommand="SELECT [customerID] FROM [Customers] WHERE ([customerEmail] = @customerEmail)">
                        <DeleteParameters>
                            <asp:Parameter Name="customerID" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="customerEmail" SessionField="email" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] WHERE packageID=(@packageid) AND sessionID=(@sessionid)" InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT * FROM [AddToCarts]" UpdateCommand="UPDATE [AddToCarts] SET [packageID] = @packageID, [itemID] = @itemID, [orderID] = @orderID, [paymentID] = @paymentID, [sessionID] = @sessionID, [Qty] = @Qty WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:SessionParameter Name="packageid" SessionField="pid" />
                            <asp:SessionParameter Name="sessionid" SessionField="sid" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="packageID" Type="String" />
                            <asp:Parameter Name="itemID" Type="String" />
                            <asp:Parameter Name="orderID" Type="String" />
                            <asp:Parameter Name="paymentID" Type="String" />
                            <asp:Parameter Name="sessionID" Type="String" />
                            <asp:Parameter Name="Qty" Type="Int32" />
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
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Payments] WHERE [id] = @id" InsertCommand="INSERT INTO [Payments] ([paymentID], [unitPrice], [amount], [totalPrice], [itemID], [Order_orderID]) VALUES (@paymentID, @unitPrice, @amount, @totalPrice, @itemID, @Order_orderID)" SelectCommand="SELECT * FROM [Payments]" UpdateCommand="UPDATE [Payments] SET [paymentID] = @paymentID, [unitPrice] = @unitPrice, [amount] = @amount, [totalPrice] = @totalPrice, [itemID] = @itemID, [Order_orderID] = @Order_orderID WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="paymentID" Type="Int32" />
                            <asp:Parameter Name="unitPrice" Type="Int32" />
                            <asp:Parameter Name="amount" Type="Decimal" />
                            <asp:Parameter Name="totalPrice" Type="Decimal" />
                            <asp:Parameter Name="itemID" Type="Int32" />
                            <asp:Parameter Name="Order_orderID" Type="Int32" />
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
                    <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PackageTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PackageTable] ([packageID], [SessionID], [GrandTotal]) VALUES (@packageID, @SessionID, @GrandTotal)" SelectCommand="SELECT * FROM [PackageTable]" UpdateCommand="UPDATE [PackageTable] SET [packageID] = @packageID, [SessionID] = @SessionID, [GrandTotal] = @GrandTotal WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:SessionParameter Name="Id" SessionField="ptid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="packageID" Type="Int32" />
                            <asp:Parameter Name="SessionID" Type="String" />
                            <asp:Parameter Name="GrandTotal" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="packageID" Type="Int32" />
                            <asp:Parameter Name="SessionID" Type="String" />
                            <asp:Parameter Name="GrandTotal" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Banks] WHERE [bankID] = @bankID" InsertCommand="INSERT INTO [Banks] ([cardNumber], [amount], [bankName]) VALUES (@cardNumber, @amount, @bankName)" SelectCommand="SELECT * FROM [Banks] WHERE (([bankName] = @bankName) AND ([cardNumber] = @cardNumber))" UpdateCommand="UPDATE Banks SET amount = amount - @amount WHERE (cardNumber = @cardNumber) AND (bankName = @bankName)">
                        <DeleteParameters>
                            <asp:Parameter Name="bankID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="cardNumber" Type="String" />
                            <asp:Parameter Name="amount" Type="Decimal" />
                            <asp:Parameter Name="bankName" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="radbtnBankName" Name="bankName" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AccNoTextBox" Name="cardNumber" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="amount" SessionField="GrandTotal" />
                            <asp:ControlParameter ControlID="AccNoTextBox" Name="cardNumber" PropertyName="Text" />
                            <asp:ControlParameter ControlID="radbtnBankName" Name="bankName" PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
             </fieldset>
</asp:Content>

