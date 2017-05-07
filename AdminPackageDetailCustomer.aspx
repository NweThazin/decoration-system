<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminPackageDetailCustomer.aspx.cs" Inherits="AdminPackageDetailCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;" class="tex">
        <tr>
            <td style="width: 3%">&nbsp;</td>
            <td rowspan="3">
                    <asp:MultiView ID="MultiView1" runat="server">
                         <asp:View ID="View1" runat="server">
                             <fieldset class="customerInfo">
                                <legend>Provided Package Detail Information</legend>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="packageID" DataSourceID="SqlDataSource1" Height="94px" Width="729px" style="text-align: left">
                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="266px" Width="425px" ImageUrl='<%#getImage(Eval("packageImage")) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="packageID" HeaderText="Package Number" ReadOnly="True" SortExpression="packageID" />
                                    <asp:TemplateField HeaderText="Package Name" SortExpression="packageName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("packageName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("packageName") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkbtnPackageName" runat="server" OnClick="lnkbtnPackageName_Click1" Text='<%# Bind("packageName") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                                    <asp:BoundField DataField="packageCount" HeaderText="Number of Orders" SortExpression="packageCount" />
                                </Fields>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Packages] WHERE (([packageID] = @packageID) AND ([packageStatus] = @packageStatus))">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="packageID" QueryStringField="pid" Type="Int32" />
                                    <asp:QueryStringParameter Name="packageStatus" QueryStringField="pstatus" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                      </fieldset>
                        </asp:View>
                       
                        <asp:View ID="View2" runat="server">
                            <fieldset class="customerInfo">
                                <legend>Customer Create Package Detail Information</legend>
                  
                            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="packageID" DataSourceID="SqlDataSource2" Height="50px" style="text-align: left" Width="565px">
                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:BoundField DataField="packageID" HeaderText="Package Number" ReadOnly="True" SortExpression="packageID" />
                                    <asp:TemplateField HeaderText="Package Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkbtnPackageName" runat="server" OnClick="lnkbtnPackageName_Click" Text='<%# Bind("packageName") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                                    <asp:BoundField DataField="packageCount" HeaderText="Number of Orders" SortExpression="packageCount" />
                                </Fields>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageStatus, @packageCount)" SelectCommand="SELECT [packageID], [packageName], [packageType], [packageStatus], [packageCount] FROM [Packages] WHERE (([packageID] = @packageID) AND ([packageStatus] = @packageStatus))" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
                                <DeleteParameters>
                                    <asp:Parameter Name="packageID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="packageID" Type="Int32" />
                                    <asp:Parameter Name="packageName" Type="String" />
                                    <asp:Parameter Name="packageType" Type="String" />
                                    <asp:Parameter Name="packageStatus" Type="Int32" />
                                    <asp:Parameter Name="packageCount" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="packageID" QueryStringField="pid" Type="Int32" />
                                    <asp:QueryStringParameter Name="packageStatus" QueryStringField="pstatus" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="packageName" Type="String" />
                                    <asp:Parameter Name="packageType" Type="String" />
                                    <asp:Parameter Name="packageStatus" Type="Int32" />
                                    <asp:Parameter Name="packageCount" Type="Int32" />
                                    <asp:Parameter Name="packageID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                                </fieldset>
                        </asp:View>
          
                     <asp:View ID="View3" runat="server">
                              <fieldset class="customerInfo">
                                <legend>Create Package Items Detail Information</legend>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="SqlDataSource3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowPaging="True" PageSize="6" Width="989px">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" Height="30px" Width="50px" ImageUrl='<%#getImage(Eval("itemImage")) %>' CssClass="listviewImage"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                <asp:BoundField DataField="itemQuantity" HeaderText="Item Quantity" SortExpression="itemQuantity" />
                                <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory FROM Items INNER JOIN PackageItems ON Items.itemID = PackageItems.Item_itemID WHERE (PackageItems.Package_packageID = @packageID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="packageID" SessionField="packageid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                                  </fieldset>
                         <asp:Button ID="btnV3V2" runat="server" Text="Show Package Info" CssClass="btngroup" OnClick="btnV3V2_Click" />
                 </asp:View>
                        <asp:View ID="View4" runat="server">
                              <fieldset class="customerInfo">
                                <legend>Provided Package Item Detail Information</legend>
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource4" PageSize="6" Width="992px">
                                <Columns>
                                    <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                    <asp:TemplateField HeaderText="Item Image">
                                        <ItemTemplate>
                                            <asp:Image ID="Image3" runat="server" Height="30px" Width="50px" ImageUrl='<%#getImage(Eval("itemImage")) %>' CssClass="listviewImage"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                    <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                    <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                    <asp:BoundField DataField="itemQuantity" HeaderText="Item Quantity" SortExpression="itemQuantity" />
                                    <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
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
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Items.itemID, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory FROM Items INNER JOIN PackageItems ON Items.itemID = PackageItems.Item_itemID WHERE (PackageItems.Package_packageID = @packageID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="packageID" SessionField="ppid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                  </fieldset>
                            <asp:Button ID="btnV4V1" runat="server" Text="Show Package Info" CssClass="btngroup" OnClick="btnV4V1_Click" />
                        </asp:View>
                                  </asp:MultiView>
                    <asp:Button ID="btnBack" runat="server" CssClass="btngroup" OnClick="btnBack_Click" Text="Go Back" />
                <br/>

            </td>
            <td style="width: 3%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 3%">&nbsp;</td>
            <td style="width: 3%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 3%">&nbsp;</td>
            <td style="width: 3%">&nbsp;</td>
        </tr>
    </table>

</asp:Content>

