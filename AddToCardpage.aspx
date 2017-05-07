<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="AddToCardpage.aspx.cs" Inherits="AddToCardpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <fieldset class="coffeecustomerInfo">
        <legend>Provided Package Order Information</legend>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="UpdateView" runat="server">
            <table style="width:100%;" class="tex">
                <tr>
                    <td style="width: 80%">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,Expr1,Expr2" DataSourceID="SqlDataSource1"  BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="768px" AllowPaging="True" PageSize="6">
                            <Columns>
                                <asp:TemplateField HeaderText="Item Name" SortExpression="itemName">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblIName" runat="server" Text='<%# Bind("itemName") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("itemName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Category" SortExpression="itemCategory">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblItemCategory" runat="server" Text='<%# Bind("itemCategory") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("itemCategory") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Quantity" SortExpression="Qty">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="qtyTextBox" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
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

                        <br />

                        <asp:Button ID="btnGoBack" runat="server" CssClass="btngroup" Text="Go Back" OnClick="btnGoBack_Click" />
                        <asp:Button ID="btnCalculate" runat="server" CssClass="btngroup" Text="Calculate" OnClick="btnCalculate_Click" />
               
                                          
                        <br />
               
                                          
                        &nbsp;<asp:Label ID="lblqtymsg" runat="server" Font-Italic="True" ForeColor="Red" CssClass="validatorGroup"></asp:Label>
               
                                          
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="OrderView" runat="server">
            <table style="width:100%;" class="tex">
                <tr>
                    <td style="width: 80%">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="SqlDataSource2" ShowFooter="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="768px" OnDataBound="GridView2_DataBound" AllowPaging="True" PageSize="6">
                            <Columns>
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
                                <asp:TemplateField HeaderText="Item Quantity" SortExpression="Qty">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        Grand Total
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item TotalPrice">
                                    <FooterTemplate>
                                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalPrice" runat="server" Text='<%#getTotal(Eval("itemPrice"),Eval("Qty")) %>'></asp:Label>
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
                    
                        <br />
                    
                        <asp:Button ID="btnBuy" runat="server" CssClass="btngroup" Text="Buy" OnClick="btnBuy_Click" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="btngroup" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
  
        </asp:View>
 
    </asp:MultiView>       </fieldset>
 
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] " InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT * FROM [AddToCarts]" UpdateCommand="UPDATE [AddToCarts] SET [packageID] = @packageID, [itemID] = @itemID, [orderID] = @orderID, [paymentID] = @paymentID, [sessionID] = @sessionID, [Qty] = @Qty WHERE [Id] = @Id">
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
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Items.itemID, Items.itemQuantity, Items.itemPrice, Packages.packageID FROM Items INNER JOIN PackageItems ON Items.itemID = PackageItems.Item_itemID INNER JOIN Packages ON PackageItems.Package_packageID = Packages.packageID WHERE (Packages.packageID = @pid)">
                            <SelectParameters>
                                <asp:SessionParameter Name="pid" SessionField="pid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT AddToCarts.Id, AddToCarts.packageID, AddToCarts.itemID, AddToCarts.orderID, AddToCarts.paymentID, AddToCarts.sessionID, AddToCarts.Qty, Items.itemID AS Expr1, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory, Packages.packageID AS Expr2, Packages.packageName, Packages.packageType, Packages.packageImage, Packages.packageStatus, Packages.packageCount FROM AddToCarts INNER JOIN Items ON AddToCarts.itemID = Items.itemID INNER JOIN Packages ON AddToCarts.packageID = Packages.packageID WHERE (AddToCarts.packageID = @packageID) AND (AddToCarts.sessionID = @sessionID)" UpdateCommand="UPDATE AddToCarts SET Qty = @Qty WHERE (Id = @Id)">
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
                                <asp:Parameter Name="Qty" />
                                <asp:Parameter Name="Id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT * FROM [AddToCarts] WHERE (([sessionID] = @sessionID) AND ([packageID] = @packageID))" UpdateCommand="UPDATE [AddToCarts] SET  [Qty] = @Qty   WHERE (([sessionID] = @sessionID) AND ([packageID] = @packageID))">
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
                                <asp:SessionParameter Name="sessionID" SessionField="sid" Type="String" />
                                <asp:SessionParameter Name="packageID" SessionField="pid" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="packageID" SessionField="pid" Type="String" />
                                <asp:SessionParameter Name="sessionID" SessionField="sid" Type="String" />
                                <asp:Parameter DefaultValue="1" Name="Qty" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
 
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AddToCarts.orderID, Packages.packageName, Items.itemID, Items.itemName, Items.itemPrice, AddToCarts.Qty, Items.itemImage, Items.itemCategory FROM Packages INNER JOIN AddToCarts ON Packages.packageID = AddToCarts.packageID INNER JOIN Items ON AddToCarts.itemID = Items.itemID WHERE (AddToCarts.sessionID = @sid) AND (Packages.packageID = @pid)">
                            <SelectParameters>
                                <asp:SessionParameter Name="sid" SessionField="sid" />
                                <asp:SessionParameter Name="pid" SessionField="pid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AddToCarts.orderID, Packages.packageName, Items.itemID, Items.itemName, Items.itemPrice, AddToCarts.Qty FROM Packages INNER JOIN AddToCarts ON Packages.packageID = AddToCarts.packageID INNER JOIN Items ON AddToCarts.itemID = Items.itemID WHERE (AddToCarts.sessionID = @sid) AND (Packages.packageID = @pid)">
                            <SelectParameters>
                                <asp:SessionParameter Name="sid" SessionField="sid" />
                                <asp:SessionParameter Name="pid" SessionField="pid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
</asp:Content>

