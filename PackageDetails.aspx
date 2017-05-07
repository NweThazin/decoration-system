<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="PackageDetails.aspx.cs" Inherits="PackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td>
                    <fieldset class="coffeecustomerInfo">
                        <legend>Package Information</legend>
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="packageID" DataSourceID="SqlDataSource1" Height="50px" Width="551px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <Fields>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" Height="230px" Width="361px" ImageUrl='<%#getImage(Eval("packageImage")) %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                                        <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                                        <asp:TemplateField HeaderText="Package Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%#getStatus(Eval("packageStatus")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages] WHERE ([packageID] = @packageID)" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
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
                                        <asp:QueryStringParameter Name="packageID" QueryStringField="poid" Type="Int32" />
                                    </SelectParameters>
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
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="packageID" DataSourceID="SqlDataSource3" Height="50px" Width="403px">
                                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <Fields>
                                        <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                                        <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                                        <asp:TemplateField HeaderText="Package Status" SortExpression="packageStatus">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("packageStatus") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("packageStatus") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%#getStatus(Eval("packageStatus")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Packages] WHERE ([packageID] = @packageID)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="packageID" QueryStringField="poid" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </asp:View>
                        </asp:MultiView>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="packageID,Id,itemID" PageSize="6" Width="703px">
                                <Columns>
                                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                    <asp:TemplateField HeaderText="Item Image">
                                        <ItemTemplate>
                                            <asp:Image ID="Image3" runat="server"  Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                    <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Packages.packageID, Packages.packageName, Packages.packageType, Packages.packageImage, Packages.packageStatus, Packages.packageCount, PackageItems.Id, PackageItems.Package_packageID, PackageItems.Item_itemID, Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory FROM Packages INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID INNER JOIN Items ON PackageItems.Item_itemID = Items.itemID WHERE (Packages.packageID = @pacakgeid)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="pacakgeid" QueryStringField="poid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="packageID,Id,itemID" DataSourceID="SqlDataSource4" AllowPaging="True" PageSize="6" Width="700px">
                                <Columns>
                                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                    <asp:TemplateField HeaderText="Item Image">
                                        <ItemTemplate>
                                            <asp:Image ID="Image2" runat="server" Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                    <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
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
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Packages.packageID, Packages.packageName, Packages.packageType, Packages.packageImage, Packages.packageStatus, Packages.packageCount, PackageItems.Id, PackageItems.Package_packageID, PackageItems.Item_itemID, Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory FROM Packages INNER JOIN PackageItems ON Packages.packageID = PackageItems.Package_packageID INNER JOIN Items ON PackageItems.Item_itemID = Items.itemID WHERE (Packages.packageID = @pacakgeid)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="pacakgeid" QueryStringField="poid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                        <br />
                        <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CssClass="btngroup" OnClick="btnGoBack_Click" />
                        </fieldset>
                    </td>
            </tr>
            </table>
</asp:Content>

