<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminManageViewPackage.aspx.cs" Inherits="AdminManageViewPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
            <legend>Item Detail Information to create package</legend>
        <br/>
            <table style="width:100%;" class="tex">
                <tr>
                    <td style="width: 5%">&nbsp;</td>
                    <td style="text-align: center">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" PageSize="6" Width="843px" ShowFooter="True" OnDataBound="GridView1_DataBound">
                            <Columns>
                                <asp:BoundField DataField="packageID" HeaderText="Package Number" SortExpression="packageID" />
                                <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="30px" Width="50px" ImageUrl='<%#getImage(Eval("itemImage")) %>' CssClass="listviewImage"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Name" SortExpression="itemName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("itemName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        Grand Total
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("itemName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Price" SortExpression="itemPrice">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("itemPrice") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("itemPrice") %>'></asp:Label>
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
                        <asp:Button ID="btnConfirm" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnConfirm_Click" OnClientClick="javascript:return confirm('Are u sure to create package?');" Text="Confirm" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btngroup" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                    <td style="width: 15%">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Packages.packageID, Packages.packageName, Items.itemID, Items.itemName, Items.itemPrice, Items.itemImage FROM Packages INNER JOIN PIVirtual ON Packages.packageID = PIVirtual.packageID INNER JOIN Items ON PIVirtual.itemID = Items.itemID WHERE (PIVirtual.sessionID = @sessionID) AND (Packages.packageID = @packageID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="sessionID" SessionField="sessionid" />
                                <asp:SessionParameter Name="packageID" SessionField="packageid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PackageItems] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PackageItems] ([Package_packageID], [Item_itemID]) VALUES (@Package_packageID, @Item_itemID)" SelectCommand="SELECT * FROM [PackageItems]" UpdateCommand="UPDATE [PackageItems] SET [Package_packageID] = @Package_packageID, [Item_itemID] = @Item_itemID WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="Package_packageID" SessionField="pid" Type="Int32" />
                                <asp:SessionParameter Name="Item_itemID" SessionField="iid" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Package_packageID" Type="Int32" />
                                <asp:Parameter Name="Item_itemID" Type="Int32" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PIVirtual] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PIVirtual] ([packageID], [itemID], [sessionID]) VALUES (@packageID, @itemID, @sessionID)" SelectCommand="SELECT * FROM [PIVirtual] WHERE ([sessionID] = @sessionID)" UpdateCommand="UPDATE [PIVirtual] SET [packageID] = @packageID, [itemID] = @itemID, [sessionID] = @sessionID WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="packageID" Type="Int32" />
                                <asp:Parameter Name="itemID" Type="Int32" />
                                <asp:Parameter Name="sessionID" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="sessionID" SessionField="sessionid" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="packageID" Type="Int32" />
                                <asp:Parameter Name="itemID" Type="Int32" />
                                <asp:Parameter Name="sessionID" Type="String" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages]" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
                            <DeleteParameters>
                                <asp:SessionParameter Name="packageID" SessionField="packageid" Type="Int32" />
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
                                <asp:Parameter Name="packageName" Type="String" />
                                <asp:Parameter Name="packageType" Type="String" />
                                <asp:Parameter Name="packageImage" Type="Object" />
                                <asp:Parameter Name="packageStatus" Type="Int32" />
                                <asp:Parameter Name="packageCount" Type="Int32" />
                                <asp:Parameter Name="packageID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </td>
                </tr>
                </table>
    </fieldset>
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />  
</asp:Content>

