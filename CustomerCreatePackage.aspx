<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerCreatePackage.aspx.cs" Inherits="CustomerCreatePackag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style5 {
        height: 23px;
    }
    .auto-style6 {
        width: 15%;
    }
    .auto-style7 {
        height: 23px;
        width: 15%;
    }
        .auto-style8 {
            width: 230px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="coffeecustomerInfo">
        <legend class="tex">Customer Create Page</legend>
        <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID,Id" DataSourceID="SqlDataSource12" PageSize="6" Width="755px">
            <Columns>
                <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                <asp:TemplateField HeaderText="Item Image">
                    <ItemTemplate>
                        <asp:Image ID="Image14" runat="server"  Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
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
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AddToCarts.orderID, Items.itemID, Items.itemImage, Items.itemName, Items.itemPrice, Items.itemCategory, Items.itemSubCategory, AddToCarts.Qty, AddToCarts.Id FROM AddToCarts INNER JOIN Items ON AddToCarts.itemID = Items.itemID WHERE (AddToCarts.sessionID = @sessionID) AND (AddToCarts.packageID = @packageID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="sessionID" SessionField="sessionid" />
                <asp:SessionParameter DefaultValue="" Name="packageID" SessionField="packageid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource26" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] WHERE [packageID]=(@pid) AND sessionID=(@sid)" InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT * FROM [AddToCarts]" UpdateCommand="UPDATE [AddToCarts] SET [packageID] = @packageID, [itemID] = @itemID, [orderID] = @orderID, [paymentID] = @paymentID, [sessionID] = @sessionID, [Qty] = @Qty WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:SessionParameter Name="pid" SessionField="packageid" />
                <asp:SessionParameter Name="sid" SessionField="sessionid" />
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
        <br/>
        <asp:MultiView ID="createPackageView" runat="server">
            <asp:View ID="View1" runat="server">
            <table style="width:100%;" class="tex">
                    <tr>
                        <td class="auto-style6" style="text-align: right; width: 25%;">Ceiling:</td>
                        <td style="width: 40%; text-align: left;">
                            <asp:Button ID="btnViewCeiling" runat="server" CssClass="btngroup" Text="View Ceiling" OnClick="btnViewCeiling_Click1" CausesValidation="False" Height="29px" Width="188px" />
                            <br />
                        </td>
                        <td style="width: 20%" rowspan="7">
                            <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Ceiling" Name="itemCategory" Type="String" />
                                    <asp:ControlParameter ControlID="ddlCeiling" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource25" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory WHERE [itemID] = @itemID">
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
                                    <asp:Parameter DefaultValue="Wall" Name="itemCategory" Type="String" />
                                    <asp:ControlParameter ControlID="ddlWall" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemName" Type="String" />
                                    <asp:Parameter Name="itemCategory" Type="String" />
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemQuantity" Type="Int32" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                    <asp:Parameter Name="itemSubCategory" Type="String" />
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                     
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" style="text-align: right; width: 25%;">Wall:</td>
                        <td class="auto-style5" style="width: 40%; text-align: left;">
                            <asp:Button ID="btnViewWall" runat="server" CssClass="btngroup" Height="29px" Width="188px" Text="View Wall" CausesValidation="False" OnClick="btnViewWall_Click" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" style="text-align: right; width: 25%;">Floor:</td>
                        <td style="width: 40%; text-align: left;">
                            <asp:Button ID="btnViewFloor" runat="server" Height="29px" Width="188px" Text="View Floor" CssClass="btngroup" CausesValidation="False" OnClick="btnViewFloor_Click" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" style="text-align: right; width: 25%;">Lightning:</td>
                        <td style="width: 40%; text-align: left;">
                            <asp:Button ID="btnViewLightning" runat="server" Height="29px" Width="188px" Text="View Lightning" CssClass="btngroup" CausesValidation="False" OnClick="btnViewLightning_Click" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" style="text-align: right; width: 25%;">Furniture:</td>
                        <td style="width: 40%; text-align: left;">
                            <asp:Button ID="btnViewFurniture" runat="server" Text="View Furniture" Height="29px" Width="188px" CssClass="btngroup" CausesValidation="False" OnClick="btnViewFurniture_Click" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" style="text-align: right; width: 25%;">Accessories:</td>
                        <td style="width: 40%; text-align: left;">
                            <asp:Button ID="btnViewAccessories" runat="server" Height="29px" Width="188px" Text="View Accessories" CssClass="btngroup" CausesValidation="False" OnClick="btnViewAccessories_Click" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" style="text-align: right; width: 25%;">&nbsp;</td>
                        <td style="width: 40%; text-align: left;">
                            <asp:Button ID="btnCreatePackage" runat="server" Text="Create Package" CssClass="btngroup" ValidationGroup="custCreatePackage" OnClick="btnCreatePackage_Click" Height="29px" Width="188px" OnClientClick="javascript:return confirm('Are you sure to create new package to order?');" />
                            <br />
                            <asp:Label ID="lblCreatePackage" runat="server" CssClass="validatorGroup"></asp:Label>
                        </td>
                    </tr>
                </table>

            </asp:View>
            <asp:View ID="CeilingView" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td style="text-align: center">
                            Search Ceiling By Sub Category:<asp:DropDownList ID="ddlCeiling" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource13" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlCeiling_SelectedIndexChanged" CssClass="dropdownlist"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Ceiling" Name="Category" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource1" GroupItemCount="3">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:Image ID="Image1" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                        <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>' CausesValidation="False">
                                        View Detail</asp:LinkButton>
                                    </td>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:TextBox ID="itemCategoryTextBox" runat="server" Text='<%# Bind("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:TextBox ID="itemQuantityTextBox" runat="server" Text='<%# Bind("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                    </td>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <InsertItemTemplate>
                                    <td runat="server" style="">itemID:
                                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:TextBox ID="itemCategoryTextBox" runat="server" Text='<%# Bind("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:TextBox ID="itemQuantityTextBox" runat="server" Text='<%# Bind("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                    </td>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                        <asp:Image ID="Image2" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>' CausesValidation="False">
                                        View Detail</asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr id="groupPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:Label ID="itemNameLabel" runat="server" Text='<%# Eval("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:Label ID="itemCategoryLabel" runat="server" Text='<%# Eval("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:Label ID="itemImageLabel" runat="server" Text='<%# Eval("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:Label ID="itemQuantityLabel" runat="server" Text='<%# Eval("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                    </td>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice)" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
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
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Ceiling" Name="itemCategory" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemName" Type="String" />
                                    <asp:Parameter Name="itemCategory" Type="String" />
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemQuantity" Type="Int32" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Button ID="btnGoBackCeiling" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackCeiling_Click" Text="Go Back" />
                        </td>
                    </tr>
                </table>

            </asp:View>
            <asp:View ID="WallView" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td >
                            Search Wall By Sub Category:<asp:DropDownList ID="ddlWall" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource15" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlWall_SelectedIndexChanged" CssClass="dropdownlist"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Wall" Name="Category" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView2" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource2" GroupItemCount="3">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:Image ID="Image3" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>' /><br/>
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>'></asp:Label>
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>' CausesValidation="False">
                                        View Detail</asp:LinkButton>
                                    </td>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:TextBox ID="itemCategoryTextBox" runat="server" Text='<%# Bind("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:TextBox ID="itemQuantityTextBox" runat="server" Text='<%# Bind("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                    </td>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" class="tex" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <InsertItemTemplate>
                                    <td runat="server" style="">itemID:
                                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:TextBox ID="itemCategoryTextBox" runat="server" Text='<%# Bind("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:TextBox ID="itemQuantityTextBox" runat="server" Text='<%# Bind("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                    </td>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                        <asp:Image ID="Image4" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" class="tex">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr id="groupPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:Label ID="itemNameLabel" runat="server" Text='<%# Eval("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:Label ID="itemCategoryLabel" runat="server" Text='<%# Eval("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:Label ID="itemImageLabel" runat="server" Text='<%# Eval("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:Label ID="itemQuantityLabel" runat="server" Text='<%# Eval("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                    </td>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice)" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
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
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Wall" Name="itemCategory" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemName" Type="String" />
                                    <asp:Parameter Name="itemCategory" Type="String" />
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemQuantity" Type="Int32" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Button ID="btnGoBackWall" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackWall_Click" Text="Go Back" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="FloorView" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td>
                            Search Floor By Sub Category:<asp:DropDownList ID="ddlFloor" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource17" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlFloor_SelectedIndexChanged" CssClass="dropdownlist"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Floor" Name="Category" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView3" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource3" GroupItemCount="3">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:Image ID="Image5" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                    </td>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <InsertItemTemplate>
                                    <td runat="server" style="">itemID:
                                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                    </td>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                        <asp:Image ID="Image6" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        itemPrice:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr id="groupPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:Label ID="itemImageLabel" runat="server" Text='<%# Eval("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                    </td>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemImage], [itemPrice]) VALUES (@itemID, @itemImage, @itemPrice)" SelectCommand="SELECT [itemID], [itemImage], [itemPrice] FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemImage] = @itemImage, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
                                <DeleteParameters>
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Floor" Name="itemCategory" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory WHERE [itemID] = @itemID">
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
                                    <asp:Parameter DefaultValue="Floor" Name="itemCategory" Type="String" />
                                    <asp:ControlParameter ControlID="ddlFloor" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemName" Type="String" />
                                    <asp:Parameter Name="itemCategory" Type="String" />
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemQuantity" Type="Int32" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                    <asp:Parameter Name="itemSubCategory" Type="String" />
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Button ID="btnGoBackFloor" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackFloor_Click" Text="Go Back" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="LightningView" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td>
                            Search Lightning By Sub Category:<asp:DropDownList ID="ddlLight" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource19" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlLight_SelectedIndexChanged" CssClass="dropdownlist"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Lightning" Name="Category" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView4" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource4" GroupItemCount="3">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:Image ID="Image7" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                    </td>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <InsertItemTemplate>
                                    <td runat="server" style="">itemID:
                                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                    </td>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                        <asp:Image ID="Image8" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr id="groupPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:Label ID="itemImageLabel" runat="server" Text='<%# Eval("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                    </td>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [itemID], [itemImage], [itemPrice] FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Lightning" Name="itemCategory" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Lightning" Name="itemCategory" Type="String" />
                                    <asp:ControlParameter ControlID="ddlLight" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Button ID="btnGoBackLigtning" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackLigtning_Click" Text="Go Back" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="FurnitureView" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td>
                            Search Furniture By Sub Category:<asp:DropDownList ID="ddlFurniture" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource21" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlFurniture_SelectedIndexChanged" CssClass="dropdownlist"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Furniture" Name="Category" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView5" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource5" GroupItemCount="3">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:Image ID="Image9" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                    </td>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <InsertItemTemplate>
                                    <td runat="server" style="">itemID:
                                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                    </td>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                        <asp:Image ID="Image10" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" class="tex">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr id="groupPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemImage:
                                        <asp:Label ID="itemImageLabel" runat="server" Text='<%# Eval("itemImage") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                    </td>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemImage], [itemPrice]) VALUES (@itemID, @itemImage, @itemPrice)" SelectCommand="SELECT [itemID], [itemImage], [itemPrice] FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemImage] = @itemImage, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
                                <DeleteParameters>
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Furniture" Name="itemCategory" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Furniture" Name="itemCategory" Type="String" />
                                    <asp:ControlParameter ControlID="ddlFurniture" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Button ID="btnGoBackFurniture" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackFurniture_Click" Text="Go Back" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="AccessoriesView" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td>
                            Search Accessories By Sub Category:<asp:DropDownList ID="ddlAccessories" CssClass="dropdownlist" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource23" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlAccessories_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Accessories" Name="Category" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView6" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource6" GroupItemCount="3">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:Image ID="Image11" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:TextBox ID="itemCategoryTextBox" runat="server" Text='<%# Bind("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:TextBox ID="itemQuantityTextBox" runat="server" Text='<%# Bind("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                    </td>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <InsertItemTemplate>
                                    <td runat="server" style="">itemID:
                                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:TextBox ID="itemCategoryTextBox" runat="server" Text='<%# Bind("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:TextBox ID="itemQuantityTextBox" runat="server" Text='<%# Bind("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <br />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                    </td>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                        <asp:Image ID="Image12" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage"))%>'/>
                                        <br />
                                        Item Price:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                         <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail"  runat="server" CausesValidation="False" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerCreatePackage.aspx?itemid="+Eval("itemID") %>'>
                                        View Detail</asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr id="groupPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">itemID:
                                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                                        <br />
                                        itemName:
                                        <asp:Label ID="itemNameLabel" runat="server" Text='<%# Eval("itemName") %>' />
                                        <br />
                                        itemCategory:
                                        <asp:Label ID="itemCategoryLabel" runat="server" Text='<%# Eval("itemCategory") %>' />
                                        <br />
                                        itemImage:
                                        <asp:Label ID="itemImageLabel" runat="server" Text='<%# Eval("itemImage") %>' />
                                        <br />
                                        itemQuantity:
                                        <asp:Label ID="itemQuantityLabel" runat="server" Text='<%# Eval("itemQuantity") %>' />
                                        <br />
                                        itemPrice:
                                        <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                        <br />
                                    </td>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Accessories" Name="itemCategory" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource24" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Accessories" Name="itemCategory" Type="String" />
                                    <asp:ControlParameter ControlID="ddlAccessories" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Button ID="btnGoBackAccessories" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackAccessories_Click" Text="Go Back" />
                        </td>
                    </tr>
                </table>
            </asp:View>

        </asp:MultiView>
            <asp:Panel ID="pnlCreatePackage" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td style="width: 20%">&nbsp;</td>
                        <td rowspan="3" class="auto-style8">
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource7" Height="50px" Width="501px" style="text-align: left">
                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image15" runat="server" Height="120px" Width="229px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                    <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                    <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                    <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
                                    <asp:TemplateField HeaderText="Item Scale">
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemScale" runat="server" Text='<%#getScale(Eval("itemCategory")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemDescription" HeaderText="Item Description" SortExpression="itemDescription" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnChooseItem" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnChooseItem_Click" Text="Choose Item" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory], [itemDescription]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory, @itemDescription)" SelectCommand="SELECT * FROM [Items] WHERE ([itemID] = @itemID)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory, [itemDescription] = @itemDescription WHERE [itemID] = @itemID">
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
                                    <asp:Parameter Name="itemDescription" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemName" Type="String" />
                                    <asp:Parameter Name="itemCategory" Type="String" />
                                    <asp:Parameter Name="itemImage" Type="Object" />
                                    <asp:Parameter Name="itemQuantity" Type="Int32" />
                                    <asp:Parameter Name="itemPrice" Type="Int32" />
                                    <asp:Parameter Name="itemSubCategory" Type="String" />
                                    <asp:Parameter Name="itemDescription" Type="String" />
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AddToCarts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AddToCarts] ([packageID], [itemID], [orderID], [paymentID], [sessionID], [Qty]) VALUES (@packageID, @itemID, @orderID, @paymentID, @sessionID, @Qty)" SelectCommand="SELECT * FROM [AddToCarts]" UpdateCommand="UPDATE [AddToCarts] SET [packageID] = @packageID, [itemID] = @itemID, [orderID] = @orderID, [paymentID] = @paymentID, [sessionID] = @sessionID, [Qty] = @Qty WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:SessionParameter Name="packageID" SessionField="packageid" Type="String" />
                                    <asp:SessionParameter DefaultValue="" Name="itemID" SessionField="itemid" Type="String" />
                                    <asp:SessionParameter Name="orderID" SessionField="orderid" Type="String" />
                                    <asp:SessionParameter Name="paymentID" SessionField="paymentid" Type="String" />
                                    <asp:SessionParameter Name="sessionID" SessionField="sessionid" Type="String" />
                                    <asp:Parameter DefaultValue="1" Name="Qty" Type="Int32" />
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
             
                        </td>
                        <td style="width: 10%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%">&nbsp;</td>
                        <td style="width: 10%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%">&nbsp;</td>
                        <td style="width: 10%">&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnGoBackPanel" runat="server" Text="Go Back" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackPanel_Click" />
            </asp:Panel>
        
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Orders] ([orderID], [orderDate], [orderStatus], [deliveryAddress], [Package_packageID], [Customer_customerID], [ServiceTeam_serviceID], [Payment_paymentID]) VALUES (@orderID, @orderDate, @orderStatus, @deliveryAddress, @Package_packageID, @Customer_customerID, @ServiceTeam_serviceID, @Payment_paymentID)" SelectCommand="SELECT Max([orderID]) FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [orderDate] = @orderDate, [orderStatus] = @orderStatus, [deliveryAddress] = @deliveryAddress, [Package_packageID] = @Package_packageID, [Customer_customerID] = @Customer_customerID, [ServiceTeam_serviceID] = @ServiceTeam_serviceID, [Payment_paymentID] = @Payment_paymentID WHERE [orderID] = @orderID">
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
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT Max([packageID]) FROM [Packages]" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
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
                                <asp:Parameter Name="packageName" Type="String" />
                                <asp:Parameter Name="packageType" Type="String" />
                                <asp:Parameter Name="packageImage" Type="Object" />
                                <asp:Parameter Name="packageStatus" Type="Int32" />
                                <asp:Parameter Name="packageCount" Type="Int32" />
                                <asp:Parameter Name="packageID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MAX(paymentID) AS Expr1 FROM Payments">
                        </asp:SqlDataSource>
        
        </fieldset>
    </asp:Content>

