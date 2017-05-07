﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="CustomerOrderLists.aspx.cs" Inherits="CustomerOrderLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
        <legend>Customer Order Lists</legend>

        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="tex" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="create">Create Package Order Lists</asp:ListItem>
            <asp:ListItem Value="ready">Provided Package Order Lists</asp:ListItem>
        </asp:RadioButtonList>
            
        <fieldset class="customerInfo">
        <legend>Create Packge Order Lists</legend>
                

            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="orderID,packageID,customerID" Width="849px">
                <Columns>
                    <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                    <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                    <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                    <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="CustomerOrderListsDetail.aspx?orderid={0}" HeaderText="View Detial" Text="Detail" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Orders.orderID, Orders.orderDate, Orders.deliveryAddress, Packages.packageID, Packages.packageName, Packages.packageType, Customers.customerID, Customers.customerName FROM Orders INNER JOIN Packages ON Orders.Package_packageID = Packages.packageID INNER JOIN Customers ON Orders.Customer_customerID = Customers.customerID WHERE (Packages.packageStatus = 1) AND (Orders.orderStatus = 1 OR Orders.orderStatus = 2) ORDER BY Orders.orderID DESC"></asp:SqlDataSource>
                

            </fieldset>
    </fieldset>
</asp:Content>

