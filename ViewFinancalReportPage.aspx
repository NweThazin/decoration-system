<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ViewFinancalReportPage.aspx.cs" Inherits="ViewFinancalReportPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
        }
        .auto-style6 {
        }
        .auto-style7 {
            text-align: left;
        }
        .auto-style9 {
            width: 141px;
            text-align: left;
        }
        .auto-style10 {
            width: 154px;
            text-align: left;
        }
        .auto-style11 {
            width: 144px;
            text-align: left;
        }
        .auto-style16 {
            width: 129px;
        }
        .auto-style17 {
            width: 139px;
        }
        .auto-style18 {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <fieldset class="customerInfo">
                <legend>View Financial Report</legend>
        <table style="width:100%;">
            <tr>
                <td style="text-align: center">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" RepeatLayout="Flow" style="text-align: center">
                        <asp:ListItem Selected="True">Daily</asp:ListItem>
                        <asp:ListItem>Monthly</asp:ListItem>
                        <asp:ListItem>Yearly</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                     
                        <asp:View ID="DailyView" runat="server">
                    <fieldset class="customerInfo">
                                 <legend>Daily View Report</legend>
                            <table style="width:100%;">
                                <tr>
                                    <td class="auto-style11">&nbsp;Year ::<asp:DropDownList ID="DropDownList_DailyViewYear" runat="server" OnSelectedIndexChanged="DropDownList_DailyViewYear_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style10">&nbsp;Month ::<asp:DropDownList ID="DropDownList_DailyViewMonth" runat="server" OnSelectedIndexChanged="DropDownList_DailyViewMonth_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="01">Jan</asp:ListItem>
                                        <asp:ListItem Value="02">Feb</asp:ListItem>
                                        <asp:ListItem Value="03">Mar</asp:ListItem>
                                        <asp:ListItem Value="04">Apr</asp:ListItem>
                                        <asp:ListItem Value="05">May</asp:ListItem>
                                        <asp:ListItem Value="06">Jun</asp:ListItem>
                                        <asp:ListItem Value="07">Jul</asp:ListItem>
                                        <asp:ListItem Value="08">Aug</asp:ListItem>
                                        <asp:ListItem Value="09">Sep</asp:ListItem>
                                        <asp:ListItem Value="10">Oct</asp:ListItem>
                                        <asp:ListItem Value="11">Nov</asp:ListItem>
                                        <asp:ListItem Value="12">Dec</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style9">&nbsp;Day ::<asp:DropDownList ID="DropDownList_DailyViewDay" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style7">
                                        <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" Text="Search" CssClass="btngroup" Height="38px" Width="90px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" colspan="4">
                                        <asp:GridView ID="GridView_DailyView" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="780px" AllowPaging="True">
                                            <Columns>
                                                <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                                                <asp:BoundField DataField="paymentID" HeaderText="Invoice Number" SortExpression="paymentID" />
                                                <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate", "{0:D}") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="ReportingDetails.aspx?oid={0}" HeaderText="View Details" Text="Details" />
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
                                        <br />
                                        <asp:Label ID="lblmessage" runat="server" style="text-align: left"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Orders.orderID, Payments.paymentID, Orders.orderDate FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID WHERE (Orders.orderDate = @concatday)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="concatday" SessionField="concatday" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Orders.orderID, Payments.paymentID, Orders.orderDate FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID WHERE (Orders.orderDate = @orderdate)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="orderdate" SessionField="todayDate" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [orderDate] FROM [Orders]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                          </fieldset>
                        </asp:View>
                     <asp:View ID="MonthlyView" runat="server">
                             <fieldset class="customerInfo">
                                 <legend>Monthly View Report</legend>
                            <table style="width:100%;">
                                <tr>
                                    <td class="auto-style17">Year::<asp:DropDownList ID="DropDownList_MonthlyViewYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_MonthlyViewYear_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style16">Month::<asp:DropDownList ID="DropDownList_MonthlyViewMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_MonthlyViewMonth_SelectedIndexChanged1">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="01">Jan</asp:ListItem>
                                        <asp:ListItem Value="02">Feb</asp:ListItem>
                                        <asp:ListItem Value="03">Mar</asp:ListItem>
                                        <asp:ListItem Value="04">Apr</asp:ListItem>
                                        <asp:ListItem Value="05">May</asp:ListItem>
                                        <asp:ListItem Value="06">Jun</asp:ListItem>
                                        <asp:ListItem Value="07">Jul</asp:ListItem>
                                        <asp:ListItem Value="08">Aug</asp:ListItem>
                                        <asp:ListItem Value="09">Sep</asp:ListItem>
                                        <asp:ListItem Value="10">Oct</asp:ListItem>
                                        <asp:ListItem Value="11">Nov</asp:ListItem>
                                        <asp:ListItem Value="12">Dec</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:Button ID="btnmonthlysearch2" runat="server" CssClass="btngroup" Height="32px" OnClick="btnmonthlysearch_Click" Text="Search" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style6" colspan="3">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource2" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="730px" AllowPaging="True">
                                            <Columns>
                                                <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                                                <asp:BoundField DataField="paymentID" HeaderText="Invoice Number" SortExpression="paymentID" />
                                                <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate", "{0:D}") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="ReportingDetails.aspx?oid={0}" HeaderText="View Details" ShowHeader="False" Text="Details" />
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
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Orders.orderID, Payments.paymentID, Orders.orderDate FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID WHERE (Orders.orderDate BETWEEN @concat AND @con1)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="concat" SessionField="fromMonth" />
                                                <asp:SessionParameter Name="con1" SessionField="toMonth" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Orders.orderID, Payments.paymentID, Orders.orderDate FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID WHERE (Orders.orderDate BETWEEN @frommonth AND @tomonth)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="frommonth" SessionField="fromMonth" />
                                                <asp:SessionParameter Name="tomonth" SessionField="toMonth" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:Label ID="lblmessage1" runat="server" style="text-align: left"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </table>
                                 </fieldset>
                        </asp:View>
                  
                        <asp:View ID="YearlyView" runat="server">
                           <fieldset class="customerInfo">
                                 <legend>Yearly View Report</legend>
                            <table style="width:100%;">
                                <tr>
                                    <td class="auto-style18">Year ::
                                        <asp:DropDownList ID="DropDownList_YearlyViewYear" runat="server" OnSelectedIndexChanged="DropDownList_YearlyViewYear_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    <td style="text-align: left">
                                        <asp:Button ID="btnyearsearch0" runat="server" OnClick="btnyearsearch_Click" Text="Search" CssClass="btngroup" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="737px" AllowPaging="True">
                                            <Columns>
                                                <asp:BoundField DataField="orderID" HeaderText="Order Number" ReadOnly="True" SortExpression="orderID" />
                                                <asp:BoundField DataField="paymentID" HeaderText="Invoice Number" SortExpression="paymentID" />
                                                <asp:TemplateField HeaderText="Order Date" SortExpression="orderDate"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderDate") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("orderDate", "{0:D}") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="ReportingDetails.aspx?oid={0}" HeaderText="View Details" Text="Details" />
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
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Orders.orderID, Payments.paymentID, Orders.orderDate FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID WHERE (Orders.orderDate BETWEEN @concat1 AND @con2)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="concat1" SessionField="fromYear" />
                                                <asp:SessionParameter Name="con2" SessionField="toYear" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Orders.orderID, Payments.paymentID, Orders.orderDate FROM Orders INNER JOIN Payments ON Orders.orderID = Payments.Order_orderID WHERE (Orders.orderDate BETWEEN @fromyear AND @toyear)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="fromyear" SessionField="fromYear" />
                                                <asp:SessionParameter Name="toyear" SessionField="toYear" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                  
                                        <asp:Label ID="lblmessage2" runat="server" style="text-align: left"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
                                  
                                    </td>
                                </tr>
                            </table>
                               </fieldset>
                        </asp:View>
                       
                    </asp:MultiView>
                     <br />
                        <br />
                        <br />
                </td>
            </tr>
            </table>
                </fieldset>
</asp:Content>

