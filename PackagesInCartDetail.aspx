<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="PackagesInCartDetail.aspx.cs" Inherits="PackagesInCartDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <fieldset class="coffeecustomerInfo">
        <legend>Packages in Cart Detail Information</legend>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="SqlDataSource2" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" PageSize="6" ShowFooter="True" Width="790px" OnDataBound="GridView2_DataBound">
        <Columns>
            <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
            <asp:TemplateField HeaderText="Item Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
            <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
            <asp:BoundField DataField="Qty" HeaderText="Item Quantity" SortExpression="Qty" />
            <asp:TemplateField HeaderText="Item Price" SortExpression="itemPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("itemPrice") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    Grand Total
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("itemPrice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Price">
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AddToCarts.orderID, Packages.packageName, Items.itemID, Items.itemName, Items.itemPrice, AddToCarts.Qty, Items.itemCategory, Items.itemSubCategory, Items.itemImage FROM Packages INNER JOIN AddToCarts ON Packages.packageID = AddToCarts.packageID INNER JOIN Items ON AddToCarts.itemID = Items.itemID WHERE (AddToCarts.sessionID = @sid) AND (Packages.packageID = @pid)" DeleteCommand="DELETE FROM AddToCarts WHERE (packageID = @pid) AND (sessionID = @sid)">
        <DeleteParameters>
            <asp:QueryStringParameter Name="pid" QueryStringField="packageid" />
            <asp:QueryStringParameter Name="sid" QueryStringField="sessionid" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="sid" QueryStringField="sessionid" />
            <asp:QueryStringParameter Name="pid" QueryStringField="packageid" />
        </SelectParameters>
    </asp:SqlDataSource>
                <br />
                <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CssClass="btngroup" OnClick="btnGoBack_Click" />
                <asp:Button ID="btnDelete" runat="server" CssClass="btngroup" OnClick="btnDelete_Click" Text="Delete" />
                <asp:Button ID="btnOrder" runat="server" CssClass="btngroup" OnClick="btnOrder_Click" Text="Order" />
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PackageTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PackageTable] ([packageID], [SessionID], [GrandTotal]) VALUES (@packageID, @SessionID, @GrandTotal)" SelectCommand="SELECT * FROM [PackageTable] WHERE (([packageID] = @packageID) AND ([SessionID] = @SessionID))" UpdateCommand="UPDATE [PackageTable] SET [packageID] = @packageID, [SessionID] = @SessionID, [GrandTotal] = @GrandTotal WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:SessionParameter Name="Id" SessionField="ptid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="packageID" Type="Int32" />
                        <asp:Parameter Name="SessionID" Type="String" />
                        <asp:Parameter Name="GrandTotal" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="packageID" QueryStringField="packageid" Type="Int32" />
                        <asp:QueryStringParameter Name="SessionID" QueryStringField="sessionid" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="packageID" Type="Int32" />
                        <asp:Parameter Name="SessionID" Type="String" />
                        <asp:Parameter Name="GrandTotal" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </fieldset>
</asp:Content>

