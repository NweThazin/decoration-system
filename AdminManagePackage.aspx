<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminManagePackage.aspx.cs" Inherits="AdminManagePackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 25%;
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style4 {
            width: 25%;
            height: 30px;
        }
        .auto-style5 {
            width: 15%;
            text-align: right;
        }
        .auto-style6 {
            width: 21%;
            height: 30px;
            text-align: right;
        }
        .auto-style7 {
            width: 15%;
            height: 23px;
            text-align: right;
        }
        .auto-style8 {
            text-align: right;
        }
        .auto-style9 {
            text-align: right;
            height: 28px;
        }
        .auto-style10 {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <fieldset class="customerInfo">
        <legend class="tex">Package Information</legend>
        &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" class="tex" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem  Value="view">View Package Information</asp:ListItem>
            <asp:ListItem Selected="True" Value="add">Create New Package</asp:ListItem>
        </asp:RadioButtonList>
            <fieldset class="customerInfo">
        <legend class="tex">Create Package Information</legend>
                <table style="width: 100%;" class="tex">
                    <tr>
                        <td rowspan="5" style="width: 30%; text-align: center;">
                            <asp:Image ID="imgPackage" runat="server" Height="206px" ImageAlign="Middle" Width="275px" />
                        </td>
                        <td class="auto-style8" style="width: 20%" >Package Number:</td>
                        <td style="text-align: left;">
                            <asp:Label ID="lblPackageID" runat="server" OnPreRender="lblPackageID_PreRender"></asp:Label>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9" style="width: 20%" >Package Name:</td>
                        <td style="text-align: left;" class="auto-style10">
                            <asp:TextBox ID="txtPackageName" runat="server" ValidationGroup="packageValidation"></asp:TextBox>
                        </td>
                        <td style="text-align: left" class="auto-style10">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPackageName" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="packageValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8" style="width: 20%">Package Type:</td>
                        <td style="text-align: left;">
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="dropdownlist">
                                <asp:ListItem Selected="True">Grand</asp:ListItem>
                                <asp:ListItem>Standard</asp:ListItem>
                                <asp:ListItem>Sweet</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style8" style="width: 20%">Package Image:</td>
                        <td style="text-align: left;">
                            <asp:FileUpload ID="filePackage" runat="server" />
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="filePackage" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="UploadGroup">*</asp:RequiredFieldValidator>
                            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" ValidationGroup="UploadGroup" CssClass="btngroup" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" style="width: 20%">
                            &nbsp;</td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT Max([packageID]) FROM [Packages]" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID" OnInserting="SqlDataSource1_Inserting">
                                <DeleteParameters>
                                    <asp:Parameter Name="packageID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="lblPackageID" Name="packageID" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtPackageName" Name="packageName" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="ddlType" Name="packageType" PropertyName="SelectedValue" Type="String" />
                                    <asp:Parameter Name="packageStatus" Type="Int32" DefaultValue="0" />
                                    <asp:Parameter Name="packageCount" Type="Int32" DefaultValue="0" />
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
                        </td>
                        <td class="auto-style2" style="text-align: left">&nbsp;</td>
                    </tr>
                    </table>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table style="width:100%;" class="tex">
                            <tr>
                                <td style="width: 20%" rowspan="7">
                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory WHERE [itemID] = @itemID">
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
                                            <asp:Parameter DefaultValue="Ceiling" Name="itemCategory" Type="String" />
                                            <asp:ControlParameter ControlID="ddlCeiling" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
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
                                    <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory WHERE [itemID] = @itemID">
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
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Floor" Name="itemCategory" Type="String" />
                                            <asp:ControlParameter ControlID="ddlFloor" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 20%;" class="auto-style5">Ceiling:</td>
                                <td style="text-align: left;">
                                    <asp:Button ID="btnViewCeiling" runat="server" CssClass="btngroup" OnClick="btnViewCeiling_Click" Text="View Ceiling" CausesValidation="False" Width="186px" />
                                    <br />
                                </td>
                                <td rowspan="7" style="width: 20%">
                                    <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Lightning" Name="itemCategory" Type="String" />
                                            <asp:ControlParameter ControlID="ddlLightning" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Furniture" Name="itemCategory" Type="String" />
                                            <asp:ControlParameter ControlID="ddlFurniture" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Accessories" Name="itemCategory" Type="String" />
                                            <asp:ControlParameter ControlID="ddlAccessories" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;" class="auto-style5">Wall:</td>
                                <td style="text-align: left;">
                                    <asp:Button ID="btnViewWall" runat="server" CssClass="btngroup" OnClick="btnViewWall_Click" Text="View Wall" CausesValidation="False" Width="186px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;" class="auto-style5">Floor:</td>
                                <td style="text-align: left;">
                                    <asp:Button ID="btnViewFloor" runat="server" CssClass="btngroup" OnClick="btnViewFloor_Click" Text="View Floor" CausesValidation="False" Width="186px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;" class="auto-style6">Lightning:</td>
                                <td class="auto-style4" style="text-align: left">
                                    <asp:Button ID="btnViewLightning" runat="server" CssClass="btngroup" OnClick="btnViewLightning_Click" Text="View Lightning" CausesValidation="False" Width="186px" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;" class="auto-style5">Furnture:</td>
                                <td style="text-align: left;">
                                    <asp:Button ID="btnViewFurniture" runat="server" CssClass="btngroup" OnClick="btnViewFurniture_Click" Text="View Furniture" CausesValidation="False" Height="34px" Width="186px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;" class="auto-style5">Accessories:</td>
                                <td style="text-align: left;">
                                    <asp:Button ID="btnViewAccessories" runat="server" CssClass="btngroup" OnClick="btnViewAccessories_Click" Text="View Accessories" CausesValidation="False" Width="186px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;" class="auto-style5">&nbsp;</td>
                                <td style="text-align: left;">
                                    <asp:Button ID="btnCreatePackage" runat="server" CssClass="btngroup" OnClick="btnCreatePackage_Click" Text="Create Package" ValidationGroup="packageValidation" Width="186px" />
                                    <asp:Label ID="lblCreatePaclage" runat="server" CssClass="validatorGroup"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table style="width:100%;" class="tex">
                            <tr>
                                <td style="text-align: center">
                                    Search By Ceiling Sub Category:<asp:DropDownList ID="ddlCeiling" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource10" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlCeiling_SelectedIndexChanged" style="text-align: center" Width="143px" CssClass="dropdownlist" Height="42px"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Ceiling" Name="Category" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource2" GroupItemCount="4" style="margin-right: 64px">
                                        <AlternatingItemTemplate>
                                            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                <asp:Image ID="imgAltImage" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                <br />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" CausesValidation="False" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">View Detail</asp:LinkButton>

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
                                                 <asp:Image ID="imgItemImage" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                <br/>
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                  <asp:LinkButton ID="lnkbtnItemImage" runat="server" CausesValidation="False" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">View Detail</asp:LinkButton>
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
                                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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

                                    <asp:Button ID="btnGoBackCeiling" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackCeiling_Click" Text="Go Back" />

                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        Search By Wall Sub Category :<asp:DropDownList ID="ddlWall" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource12" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlWall_SelectedIndexChanged" CssClass="dropdownlist"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Wall" Name="Category" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView2" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource4" GroupItemCount="4">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                    <asp:Image ID="Image2" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                    <br />
                                    Item Price:
                                    <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                    <br />
                                    <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">View Detail</asp:LinkButton>

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
                                <td runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <asp:Image ID="Image3" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                    <br />
                                    Item Price:
                                    <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                    <br />
                                    <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">View Detail</asp:LinkButton>
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
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice)" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
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
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <table class="tex">
                            <tr>
                                <td>
                                    Search By Floor Sub Category:<asp:DropDownList ID="ddlFloor" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource14" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlFloor_SelectedIndexChanged" CssClass="btngroup"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Floor" Name="Category" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource5" DataKeyNames="itemID" GroupItemCount="4">
                                        <AlternatingItemTemplate>
                                            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                <asp:Image ID="Image4" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                <br />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" 
OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">
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
                                                <asp:Image ID="Image5" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                                <br />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" 
OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">
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
                                                    <td runat="server" >
                                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Floor" Name="itemCategory" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    &nbsp;<asp:Button ID="btnGoBackFloor" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackFloor_Click" Text="Go Back" />
&nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <table style="width:100%;" class="tex">
                            <tr>
                                <td>
                                    Search By Lightning Sub Category:<asp:DropDownList ID="ddlLightning" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource16" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlLightning_SelectedIndexChanged" CssClass="dropdownlist"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Lightning" Name="Category" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:ListView ID="ListView4" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource6" GroupItemCount="4">
                                        <AlternatingItemTemplate>
                                            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                <asp:Image ID="Image6" runat="server" Height="117px" ImageUrl='<%#getImage(Eval("itemImage")) %>' Width="228px" />
                                                <br />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">
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
                                            <td runat="server" style="background-color: #FFFBD6;color: #333333;">
                                                <asp:Image ID="Image7" runat="server" Height="117px" ImageUrl='<%#getImage(Eval("itemImage")) %>' Width="228px" />
                                                <br />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">
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
                                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice)" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
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
                                            <asp:Parameter DefaultValue="Lightning" Name="itemCategory" Type="String" />
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
                                    <asp:Button ID="btnGoBackLightning" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackLightning_Click" Text="Go Back" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <table style="width:100%;" class="tex">
                            <tr>
                                <td>
                                    Search By Furniture Sub Category:<asp:DropDownList ID="ddlFurniture" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource18" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlFurniture_SelectedIndexChanged" CssClass="dropdownlist">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Furniture" Name="Category" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
&nbsp;<asp:ListView ID="ListView5" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource7" GroupItemCount="4">
                                        <AlternatingItemTemplate>
                                            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                <asp:Image ID="Image8" runat="server" Height="117px" ImageUrl='<%#getImage(Eval("itemImage")) %>' Width="228px" />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br/>
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">
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
                                                <asp:Image ID="Image9" runat="server" Height="117px" ImageUrl='<%#getImage(Eval("itemImage")) %>' Width="228px" />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br/>
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">
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
                                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice)" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
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
                                            <asp:Parameter DefaultValue="Furniture" Name="itemCategory" Type="String" />
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
                                    <asp:Button ID="btnGoBackFurniture" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackFurniture_Click" Text="Go Back" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <table style="width:100%;" class="tex">
                            <tr>
                                <td>
                                    Search By Accessories Sub Category:<asp:DropDownList ID="ddlAccessories" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource20" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlAccessories_SelectedIndexChanged" style="height: 22px" CssClass="dropdownlist"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Accessories" Name="Category" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:ListView ID="ListView6" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource8" GroupItemCount="4">
                                        <AlternatingItemTemplate>
                                            <td id="Td1" runat="server" style="background-color: #FAFAD2;color: #284775;">
                                                <asp:Image ID="image15" runat="server" Height="117px" ImageUrl='<%#getImage(Eval("itemImage")) %>' Width="228px" />
                                                <br />
                                                Item Price:<asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">View Detail</asp:LinkButton>
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
                                                <asp:Image ID="Image10" runat="server" Height="117px" ImageUrl='<%#getImage(Eval("itemImage")) %>' Width="228px" />
                                                <br />
                                                Item Price:
                                                <asp:Label ID="itemPriceLabel" runat="server" Text='<%# Eval("itemPrice") %>' />
                                                <br />
                                                <asp:LinkButton ID="lnkbtnItemImage" runat="server" OnClick="lnkbtnItemImage_Click" PostBackUrl='<%#"AdminManagePackage.aspx?itemid="+Eval("itemID") %>' CssClass="texdetail">View Detail</asp:LinkButton>
                                            </td>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table runat="server">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse:collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                            <tr id="groupPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr runat="server">
                                                    <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice)" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice WHERE [itemID] = @itemID">
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
                                            <asp:Parameter DefaultValue="Accessories" Name="itemCategory" Type="String" />
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
                                    <asp:Button ID="btnGoBackAccess" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackAccess_Click" Text="Go Back" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
           
                </asp:MultiView>
                <asp:Panel ID="pnlDetailView" runat="server">
                    <fieldset class="customerInfo">
                        <legend class="tex">Item Detail Information</legend>
                        <table style="width:100%;" class="tex">
                            <tr>
                                <td style="width: 25%">&nbsp;</td>
                                <td style="text-align: center">
                                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource3" Height="50px" Width="523px" style="text-align: left">
                                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <Fields>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" Height="174px" ImageUrl='<%#getImage(Eval("itemImage")) %>' Width="270px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                            <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                            <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                            <asp:BoundField DataField="itemQuantity" HeaderText="Item Quantity" SortExpression="itemQuantity" />
                                            <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
                                            <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnChooseItem" runat="server" CssClass="btngroup" OnClick="btnChooseItem_Click" Text="Choose Item" OnClientClick="javascript:return confirm('Do you want to choose this item?');" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    </asp:DetailsView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemID] = @itemID)" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory WHERE [itemID] = @itemID">
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
                                            <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" Type="Int32" />
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
                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PIVirtual] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PIVirtual] ([packageID], [itemID], [sessionID]) VALUES (@packageID, @itemID, @sessionID)" SelectCommand="SELECT * FROM [PIVirtual]" UpdateCommand="UPDATE [PIVirtual] SET [packageID] = @packageID, [itemID] = @itemID, [sessionID] = @sessionID WHERE [Id] = @Id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Id" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:SessionParameter Name="packageID" SessionField="packageid" Type="Int32" />
                                            <asp:SessionParameter Name="itemID" SessionField="itemid" Type="Int32" />
                                            <asp:SessionParameter Name="sessionID" SessionField="sessionid" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="packageID" Type="Int32" />
                                            <asp:Parameter Name="itemID" Type="Int32" />
                                            <asp:Parameter Name="sessionID" Type="String" />
                                            <asp:Parameter Name="Id" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                            
                                    <br />
                                    <asp:Button ID="btnGoBackPanel" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnGoBackPanel_Click" Text="Go Back" />
                            
                                </td>
                                <td style="width: 20%">&nbsp;</td>
                            </tr>
                        </table>
                        </fieldset>
                </asp:Panel>

                </fieldset>       
    </fieldset>
</asp:Content>

