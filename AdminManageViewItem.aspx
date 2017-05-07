<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminManageViewItem.aspx.cs" Inherits="AdminManageViewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
        <legend>Item Information</legend>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="tex" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" >
            <asp:ListItem  Selected="True" Value="view">View Item Information</asp:ListItem>
            <asp:ListItem  Value="add">Add New Item</asp:ListItem>
            <asp:ListItem Value="reorder">Reorder Lists</asp:ListItem>
        </asp:RadioButtonList>
            <fieldset class="customerInfo">
        <legend>View Item Information</legend>
               <p class="tex"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Search By Category:
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="dropdownlist">
                    <asp:ListItem Selected="True">All</asp:ListItem>
                    <asp:ListItem>Ceiling</asp:ListItem>
                    <asp:ListItem>Wall</asp:ListItem>
                    <asp:ListItem>Floor</asp:ListItem>
                    <asp:ListItem>Lightning</asp:ListItem>
                    <asp:ListItem>Furniture</asp:ListItem>
                    <asp:ListItem>Accessories</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp; Search By
                <asp:Label ID="lblCategory" runat="server"></asp:Label>
                :<asp:DropDownList ID="ddlSubCategory" CssClass="dropdownlist" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="SubCategory" DataValueField="SubCategory" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" Height="33px" Width="142px">
                </asp:DropDownList></p>
                <br />
                <table style="width:100%;" class="tex">
                    <tr>
                        <td style="width: 10%">&nbsp;</td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderWidth="1px" CellPadding="3" DataKeyNames="itemID" DataSourceID="SqlDataSource2" AllowPaging="True" BorderStyle="None" CellSpacing="2" Width="702px">
                                <Columns>
                                    <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                    <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                    <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                    <asp:HyperLinkField DataNavigateUrlFields="itemID" DataNavigateUrlFormatString="AdminItemDetail.aspx?itemid={0}" HeaderText="View Detail" Text="Detail" />
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" ForeColor="White" Font-Bold="True" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                        </td>
                        <td style="width: 15%">
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemSubCategory] = @itemSubCategory)) ORDER BY [itemID] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="itemCategory" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddlSubCategory" Name="itemSubCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemCategory] = @itemCategory) ORDER BY [itemID] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="itemCategory" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory)" SelectCommand="SELECT * FROM [Items] ORDER BY [itemID] DESC" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemCategory] = @itemCategory, [itemImage] = @itemImage, [itemQuantity] = @itemQuantity, [itemPrice] = @itemPrice, [itemSubCategory] = @itemSubCategory WHERE [itemID] = @itemID">
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
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SubCategory] FROM [ItemSubCategory] WHERE ([Category] = @Category)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="Category" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>

                </fieldset>
        <br/>
      
    </fieldset>
</asp:Content>

