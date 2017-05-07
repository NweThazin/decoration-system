<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminItemDetail.aspx.cs" Inherits="AdminItemDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <fieldset class="customerInfo">
                <legend class="tex">Item Detail Information</legend>
                    
                <table style="width:100%;">
                    <tr>
                        <td style="width: 25%">&nbsp;</td>
                        <td>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="itemID" DataSourceID="SqlDataSource1" Height="50px" Width="555px" style="text-align: left">
                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:TemplateField HeaderText="Item Image">
                                        <EditItemTemplate>
                                            <asp:Image ID="Image2" runat="server"  Height="126px" Width="232px"  ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                            <br />
                                            <asp:FileUpload ID="fileImage" runat="server" />
                                            &nbsp;
                                            <asp:Button ID="btnUpload" runat="server" CssClass="btngroup" Text="Upload" OnClick="btnUpload_Click1" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="126px" Width="232px" ImageUrl='<%#getImage(Eval("itemImage")) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="itemID" HeaderText="Item Number" ReadOnly="True" SortExpression="itemID" />
                                    <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                                    <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                                    <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                                    <asp:BoundField DataField="itemQuantity" HeaderText="Item Quantity" SortExpression="itemQuantity" />
                                    <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
                                    <asp:BoundField DataField="itemDescription" HeaderText="Item Description" SortExpression="itemDescription" />
                                    <asp:CommandField ShowEditButton="True" />
                                </Fields>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT itemID, itemName, itemCategory, itemImage, itemQuantity, itemPrice, itemSubCategory, itemDescription FROM Items WHERE (itemID = @itemID)" DeleteCommand="DELETE FROM [Items] WHERE [itemID] = @itemID" InsertCommand="INSERT INTO [Items] ([itemID], [itemName], [itemCategory], [itemImage], [itemQuantity], [itemPrice], [itemSubCategory], [itemDescription]) VALUES (@itemID, @itemName, @itemCategory, @itemImage, @itemQuantity, @itemPrice, @itemSubCategory, @itemDescription)" UpdateCommand="UPDATE Items SET itemName = @itemName, itemCategory = @itemCategory, itemImage = @itemImage, itemQuantity = @itemQuantity, itemPrice = @itemPrice, itemSubCategory = @itemSubCategory, itemDescription = @itemDescription WHERE (itemID = @itemID)" OnUpdated="SqlDataSource1_Updated1" OnUpdating="SqlDataSource1_Updating">
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
                                    <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="itemName" />
                                    <asp:Parameter Name="itemCategory" />
                                    <asp:Parameter Name="itemQuantity" />
                                    <asp:Parameter Name="itemPrice" />
                                    <asp:Parameter Name="itemSubCategory" />
                                    <asp:Parameter Name="itemDescription" />
                                    <asp:Parameter Name="itemID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnBack" runat="server" style="text-align: center" Text="Go Back" CssClass="btngroup" OnClick="btnBack_Click" />
                        </td>
                        <td style="width: 25%">&nbsp;</td>
                    </tr>
                    </table>
              </fieldset>
</asp:Content>

