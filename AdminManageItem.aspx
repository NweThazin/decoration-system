<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminManageItem.aspx.cs" Inherits="AdminManageItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
        <legend>Item Information</legend>
        &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" CssClass="tex" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem  Value="view">View Item Information</asp:ListItem>
            <asp:ListItem Selected="True" Value="add">Add New Item</asp:ListItem>
            <asp:ListItem Value="reorder">Reorder Lists</asp:ListItem>
        </asp:RadioButtonList>
            <fieldset class="customerInfo">
        <legend>Add New Item</legend>
                <table style="width:100%;">
                    <tr>
                        <td rowspan="9" style="width: 30%; text-align: center;">
                            <asp:Image ID="imgItem" runat="server" Height="203px" ImageAlign="Middle" Width="261px" />
                        </td>
                        <td style="width: 20%; text-align: right;" class="tex">Item Number:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:Label ID="lblItemID" runat="server" OnPreRender="lblItemID_PreRender" class="tex"></asp:Label>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;" class="tex">Item Name:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:TextBox ID="txtItemName" runat="server" ValidationGroup="itemGroup" class="tex"></asp:TextBox>
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="requiredItemName" runat="server" ControlToValidate="txtItemName" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="itemGroup">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;" class="tex">Item Category:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:DropDownList ID="ddlItemCategory" runat="server" AutoPostBack="True" CssClass="dropdownlist">
                                <asp:ListItem>Ceiling</asp:ListItem>
                                <asp:ListItem>Floor</asp:ListItem>
                                <asp:ListItem>Wall</asp:ListItem>
                                <asp:ListItem>Lightning</asp:ListItem>
                                <asp:ListItem>Accessories</asp:ListItem>
                                <asp:ListItem>Furniture</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;" class="tex">Item Sub Category:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:DropDownList ID="ddlSubCategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="SubCategory" DataValueField="SubCategory" CssClass="dropdownlist" Height="29px" Width="124px" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;" class="tex">Item Image:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:FileUpload ID="fileItemImage" runat="server" />
                        </td>
                        <td style="text-align: left">
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" ValidationGroup="itemImageGroup" CssClass="btngroup" Height="31px" Width="98px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fileItemImage" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="itemImageGroup">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;" class="tex">Item Quantity:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:TextBox ID="txtItemQuantity" runat="server" ValidationGroup="itemGroup"></asp:TextBox>
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtItemQuantity" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="itemGroup">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regularQuantity" runat="server" ControlToValidate="txtItemQuantity" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]*" ValidationGroup="itemGroup" CssClass="validatorGroup">Must be Number</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;" class="tex">
                            Item Price:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:TextBox ID="txtItemPrice" runat="server" ValidationGroup="itemGroup"></asp:TextBox>
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtItemPrice" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="itemGroup">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtItemPrice" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]*" ValidationGroup="itemGroup" CssClass="validatorGroup">Must be Number </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;">
                            Item Description:</td>
                        <td style="text-align: left;" class="auto-style1">
                            <asp:TextBox ID="txtDescription" runat="server" Height="70px" style="margin-bottom: 10px" TextMode="MultiLine" Width="189px"></asp:TextBox>
                            <br />
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDescription" CssClass="validatorGroup" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right;">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory], [itemDescription]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory, @itemDescription)" SelectCommand="SELECT * FROM [Items]" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory, [itemDescription] = @itemDescription WHERE [itemID] = @itemID" OnInserting="SqlDataSource1_Inserting">
                                <DeleteParameters>
                                    <asp:Parameter Name="itemID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="lblItemID" Name="itemID" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtItemName" Name="itemName" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="ddlItemCategory" Name="itemCategory" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtItemQuantity" Name="itemQuantity" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtItemPrice" Name="itemPrice" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlSubCategory" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtDescription" Name="itemDescription" PropertyName="Text" Type="String" />
                                </InsertParameters>
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
                        </td>
                        <td style="text-align: left;" class="auto-style1">
                            <br />
                            <asp:Button ID="btnAddNewItem" runat="server" Text="Add New Item" OnClick="btnAddNewItem_Click" ValidationGroup="itemGroup" CssClass="btngroup" Height="34px" Width="154px" />
                        </td>
                        <td style="text-align: left">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlItemCategory" Name="Category" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                 
        </fieldset>
        <br/>
        </fieldset>
</asp:Content>

