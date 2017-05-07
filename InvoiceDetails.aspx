<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="InvoiceDetails.aspx.cs" Inherits="InvoiceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <table style="width:100%;">
            <tr>
                <td>
                     <fieldset class="coffeecustomerInfo">
                  <legend>Invoice Information</legend>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id,Expr1" DataSourceID="SqlDataSource1" OnDataBound="GridView1_DataBound" ShowFooter="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="749px">
                        <Columns>
                            <asp:BoundField DataField="paymentID" HeaderText="Invoice Number" SortExpression="paymentID" />
                            <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                            <asp:BoundField DataField="itemCategory" HeaderText="Item Category" SortExpression="itemCategory" />
                            <asp:BoundField DataField="itemSubCategory" HeaderText="Item Sub Category" SortExpression="itemSubCategory" />
                            <asp:BoundField DataField="amount" HeaderText="Item Quantity" SortExpression="amount" />
                            <asp:TemplateField HeaderText="Item UnitPrice" SortExpression="unitPrice">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unitPrice") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    Grand Total
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("unitPrice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item TotalPrice" SortExpression="totalPrice">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("totalPrice") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("totalPrice") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Payments.id, Payments.paymentID, Payments.unitPrice, Payments.amount, Payments.totalPrice, Payments.itemID, Payments.Order_orderID, Items.itemID AS Expr1, Items.itemName, Items.itemCategory, Items.itemImage, Items.itemQuantity, Items.itemPrice, Items.itemSubCategory FROM Payments INNER JOIN Items ON Payments.itemID = Items.itemID WHERE (Payments.paymentID = @orderID)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="orderID" QueryStringField="invoiceoid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                         <br />
                         <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CssClass="btngroup" OnClick="btnGoBack_Click" />
                             
        </fieldset>
                </td>
            </tr>
            </table>
    
</asp:Content>

