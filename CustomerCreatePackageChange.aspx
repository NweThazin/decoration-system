<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerCreatePackageChange.aspx.cs" Inherits="CustomerCreatePackageChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <fieldset class="coffeecustomerInfo">
                            <legend>Customer Create Package</legend>
                            <asp:MultiView ID="MultiView1" runat="server">
                                <asp:View ID="View1" runat="server">

                                    <table style="width:100%;" class="tex">
                                        <tr>
                                            <td>Search Ceiling By SubCategory:<asp:DropDownList ID="ddlCeilingSubCategory" runat="server" AutoPostBack="True" CssClass="dropdownlist" DataSourceID="SqlDataSource1" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlCeilingSubCategory_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Ceiling" Name="Category" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                     
                                                <asp:ListView ID="ListView1" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource2" GroupItemCount="3">
                                                    <AlternatingItemTemplate>
                                                        <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                            <asp:Image ID="imgCeiling" runat="server" Height="117px" Width="228px" ImageUrl='<%# getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' /><br/>
                                                            <asp:LinkButton ID="lnkbtnChangePackage" CssClass="texdetail" runat="server" PostBackUrl='<%# "CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
                                                            <br />
                                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                            <br />
                                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                            <br />
                                                        </td>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <td runat="server" style="background-color: #FFFBD6;color: #333333;">
                                                            <asp:Image ID="imgCeiling2" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' /><br />
                                                               <asp:LinkButton ID="lnkbtnChangePackage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
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
                                                            itemSubCategory:
                                                            <asp:Label ID="itemSubCategoryLabel" runat="server" Text='<%# Eval("itemSubCategory") %>' />
                                                            <br />
                                                        </td>
                                                    </SelectedItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Ceiling" Name="itemCategory" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Ceiling" Name="itemCategory" Type="String" />
                                                        <asp:ControlParameter ControlID="ddlCeilingSubCategory" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                    </asp:View>
                                <asp:View ID="View2" runat="server">

                                    <table style="width:100%;" class="tex">
                                        <tr>
                                            <td>Search Wall By Sub Category:<asp:DropDownList ID="ddlWall" runat="server" AutoPostBack="True" CssClass="dropdownlist" DataSourceID="SqlDataSource7" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlWall_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Wall" Name="Category" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:ListView ID="ListView2" runat="server" DataKeyNames="itemID" DataSourceID="ForAllWall" GroupItemCount="3">
                                                    <AlternatingItemTemplate>
                                                        <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                            <asp:Image ID="Image2" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>'></asp:Label><br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
                                                            <br />
                                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                            <br />
                                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                            <br />
                                                        </td>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                            <asp:Image ID="Image3" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price: <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' /> <br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:Label ID="itemSubCategoryLabel" runat="server" Text='<%# Eval("itemSubCategory") %>' />
                                                      
                                                        </td>
                                                    </SelectedItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="ForAllWall" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Wall" Name="itemCategory" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Wall" Name="itemCategory" Type="String" />
                                                        <asp:ControlParameter ControlID="ddlWall" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </td>
                                        </tr>
                                    </table>

                                </asp:View>   
                                <asp:View ID="View3" runat="server">

                                    <table style="width:100%;" class="tex">
                                        <tr>
                                            <td>Search Floor By Sub Category:<asp:DropDownList ID="ddlFloor" runat="server" AutoPostBack="True" CssClass="dropdownlist" DataSourceID="SqlDataSource9" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlFloor_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Floor" Name="Category" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:ListView ID="ListView3" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource13" GroupItemCount="3">
                                                    <AlternatingItemTemplate>
                                                        <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                            <asp:Image ID="Image4" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:
                                                            <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' /> <br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
                                                            <br />
                                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                            <br />
                                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                            <br />
                                                        </td>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                            <asp:Image ID="Image5" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:
                                                            <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                            <br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:Label ID="itemSubCategoryLabel" runat="server" Text='<%# Eval("itemSubCategory") %>' />
                                                            <br />
                                                        </td>
                                                    </SelectedItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Floor" Name="itemCategory" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Floor" Name="itemCategory" Type="String" />
                                                        <asp:ControlParameter ControlID="ddlFloor" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>

                                </asp:View>
                                <asp:View ID="View4" runat="server">

                                    <table style="width:100%;" class="tex">
                                        <tr>
                                            <td>Search Lightning By Sub Category:<asp:DropDownList ID="ddlLightning" runat="server" AutoPostBack="True" CssClass="dropdownlist" DataSourceID="SqlDataSource10" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlLightning_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Lightning" Name="Category" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:ListView ID="ListView4" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource15" GroupItemCount="3">
                                                    <AlternatingItemTemplate>
                                                        <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                            <asp:Image ID="Image6" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                            <br />
                                                   <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
                                                            <br />
                                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                            <br />
                                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                            <br />
                                                        </td>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <td runat="server" style="background-color: #FFFBD6;color: #333333;">
                                                            <asp:Image ID="Image7" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' /><br />
                                                  <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:Label ID="itemSubCategoryLabel" runat="server" Text='<%# Eval("itemSubCategory") %>' />
                                                            <br />
                                                        </td>
                                                    </SelectedItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Lightning" Name="itemCategory" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Lightning" Name="itemCategory" Type="String" />
                                                        <asp:ControlParameter ControlID="ddlLightning" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>

                                </asp:View>
                                <asp:View ID="View5" runat="server">

                                    <table style="width:100%;" class="tex">
                                        <tr>
                                            <td>Search Furniture By Sub Category:<asp:DropDownList ID="ddlFurniture" runat="server" AutoPostBack="True" CssClass="dropdownlist" DataSourceID="SqlDataSource11" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlFurniture_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Furniture" Name="Category" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <br />
                                                <asp:ListView ID="ListView5" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource17" GroupItemCount="3">
                                                    <AlternatingItemTemplate>
                                                        <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                            <asp:Image ID="Image9" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:
                                                            <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                            <br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
                                                            <br />
                                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                            <br />
                                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                            <br />
                                                        </td>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                            <asp:Image ID="Image8" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' /><br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:Label ID="itemSubCategoryLabel" runat="server" Text='<%# Eval("itemSubCategory") %>' />
                                                            <br />
                                                        </td>
                                                    </SelectedItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Furniture" Name="itemCategory" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Furniture" Name="itemCategory" Type="String" />
                                                        <asp:ControlParameter ControlID="ddlFurniture" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>

                                </asp:View>
                                <asp:View ID="View6" runat="server">

                                    <table style="width:100%;" class="tex">
                                        <tr>
                                            <td>Search Accessories By Sub Category:<asp:DropDownList ID="ddlAccessories" runat="server" AutoPostBack="True" CssClass="dropdownlist" DataSourceID="SqlDataSource12" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlAccessories_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Accessories" Name="Category" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:ListView ID="ListView6" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource19" GroupItemCount="3">
                                                    <AlternatingItemTemplate>
                                                        <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                            <asp:Image ID="Image10" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' /><br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
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
                                                            itemSubCategory:
                                                            <asp:TextBox ID="itemSubCategoryTextBox" runat="server" Text='<%# Bind("itemSubCategory") %>' />
                                                            <br />
                                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                            <br />
                                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                            <br />
                                                        </td>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                            <asp:Image ID="Image11" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                            Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                            <br />
                                                            <asp:LinkButton ID="lnkbtnPackageImage" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerCreatePackageChange.aspx?itemcartid="+Eval("itemID") %>' CausesValidation="False" OnClick="lnkbtnChangePackage_Click">View Detail</asp:LinkButton>

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
                                                            itemSubCategory:
                                                            <asp:Label ID="itemSubCategoryLabel" runat="server" Text='<%# Eval("itemSubCategory") %>' />
                                                            <br />
                                                        </td>
                                                    </SelectedItemTemplate>
                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Accessories" Name="itemCategory" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Accessories" Name="itemCategory" Type="String" />
                                                        <asp:ControlParameter ControlID="ddlAccessories" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>

                                </asp:View>
                            </asp:MultiView>
              <asp:Panel ID="pnlItemDetail" runat="server">
                  <table style="width:100%;">
                      <tr>
                          <td style="width: 15%">&nbsp;</td>
                          <td rowspan="3">
                              <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="508px" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource3" style="text-align: left">
                                  <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                  <Fields>
                                      <asp:TemplateField>
                                          <ItemTemplate>
                                              <asp:Image ID="Image12" runat="server" Height="121px" Width="193px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                      <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                      <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                      <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
                                      <asp:TemplateField HeaderText="Item Scale">
                                          <ItemTemplate>
                                              <asp:Label ID="lblItemScale" runat="server" Text='<%#getStatus(Eval("itemCategory")) %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="itemDescription" HeaderText="Item Description" SortExpression="itemDescription" />
                                      <asp:TemplateField>
                                          <ItemTemplate>
                                              <asp:Button ID="btnChooseItem" runat="server" CssClass="btngroup" OnClick="btnChooseItem_Click" OnClientClick="javascript:return confirm('Are you sure to change this item?');" Text="Choose Item" />
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Fields>
                                  <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                  <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                  <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                              </asp:DetailsView>
                              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemID] = @itemID)">
                                  <SelectParameters>
                                      <asp:QueryStringParameter Name="itemID" QueryStringField="itemcartid" Type="Int32" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                              <br />
                              <asp:Button ID="btnGoBack" runat="server" CssClass="btngroup" OnClick="btnGoBack_Click" Text="Show Item Lists" />
                          </td>
                          <td style="width: 5%">&nbsp;</td>
                      </tr>
                      <tr>
                          <td style="width: 15%">&nbsp;</td>
                          <td style="width: 5%">&nbsp;</td>
                      </tr>
                      <tr>
                          <td style="width: 15%">&nbsp;</td>
                          <td style="width: 5%">&nbsp;</td>
                      </tr>
                  </table>


              </asp:Panel>
                            <br />
              <asp:Button ID="btnGoGoBack" runat="server" Text="Go Back" CssClass="btngroup" OnClick="btnGoGoBack_Click" />
              </fieldset>

          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [itemCategory] FROM [Items] WHERE ([itemID] = @itemID)">
              <SelectParameters>
                  <asp:QueryStringParameter Name="itemID" QueryStringField="itemchangeid" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>

          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [AddToCarts]" UpdateCommand="UPDATE AddToCarts SET itemID = @itemID, Qty = @Qty WHERE (Id = @Id)">
              <UpdateParameters>
                  <asp:QueryStringParameter Name="itemID" QueryStringField="itemcartid" />
                  <asp:Parameter DefaultValue="1" Name="Qty" />
                  <asp:SessionParameter DefaultValue="" Name="Id" SessionField="addcartID" />
              </UpdateParameters>
          </asp:SqlDataSource>
        
</asp:Content>

