<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminReorderLists.aspx.cs" Inherits="AdminReorderLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <fieldset class="customerInfo">
        <legend>Item Information</legend>
            
            <asp:RadioButtonList ID="radbtnItemInformation" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" CssClass="tex" OnSelectedIndexChanged="radbtnItemInformation_SelectedIndexChanged">
            <asp:ListItem  Value="view">View Item Information</asp:ListItem>
            <asp:ListItem  Value="add">Add New Item</asp:ListItem>
                <asp:ListItem Value="reorder" Selected="True">Reorder Lists</asp:ListItem>
        </asp:RadioButtonList><br />
            <fieldset class="customerInfo">
        <legend>Reorder Item Lists</legend>
                View By Category:<asp:DropDownList ID="ddlViewByCategory" runat="server" AutoPostBack="True" CssClass="dropdownlist" OnSelectedIndexChanged="ddlViewByCategory_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Ceiling</asp:ListItem>
                    <asp:ListItem>Wall</asp:ListItem>
                    <asp:ListItem>Floor</asp:ListItem>
                    <asp:ListItem>Lightning</asp:ListItem>
                    <asp:ListItem>Furniture</asp:ListItem>
                    <asp:ListItem>Accessories</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource1" PageSize="5" Width="1011px">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="30px" Width="50px" ImageUrl='<%#getImage(Eval("itemImage")) %>' CssClass="listviewImage"/>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemQuantity] &lt;= @itemQuantity) AND ([itemCategory] = @itemCategory))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="100" Name="itemQuantity" Type="Int32" />
                                <asp:Parameter DefaultValue="Ceiling" Name="itemCategory" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource2" PageSize="5" Width="1003px">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" Height="30px" Width="50px" CssClass="listviewImage"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemQuantity] &lt;= @itemQuantity) AND ([itemCategory] = @itemCategory))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="100" Name="itemQuantity" Type="Int32" />
                                <asp:Parameter DefaultValue="Wall" Name="itemCategory" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource3" PageSize="5" Width="1002px">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image3" runat="server" Height="30px" Width="50px" CssClass="listviewImage"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemQuantity] &lt;= @itemQuantity))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Floor" Name="itemCategory" Type="String" />
                                <asp:Parameter DefaultValue="100" Name="itemQuantity" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource4" PageSize="5" Width="1002px">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image4" runat="server" Height="30px" Width="50px" CssClass="listviewImage"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
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
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemQuantity] &lt;= @itemQuantity))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Lightning" Name="itemCategory" Type="String" />
                                <asp:Parameter DefaultValue="30" Name="itemQuantity" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource5" PageSize="5" Width="1001px">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image5" runat="server" Height="30px" Width="50px" CssClass="listviewImage"   ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
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
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemQuantity] &lt;= @itemQuantity))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Furniture" Name="itemCategory" Type="String" />
                                <asp:Parameter DefaultValue="30" Name="itemQuantity" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource6" PageSize="5" Width="1001px">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                <asp:TemplateField HeaderText="Item Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image6" runat="server" Height="30px" Width="50px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
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
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE (([itemCategory] = @itemCategory) AND ([itemQuantity] &lt;= @itemQuantity))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Accessories" Name="itemCategory" Type="String" />
                                <asp:Parameter DefaultValue="30" Name="itemQuantity" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>
                </fieldset>
</fieldset>
</asp:Content>

