<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="PackagesInCart.aspx.cs" Inherits="PackagesInCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <fieldset class="coffeecustomerInfo">
        <legend>Packages in Cart</legend>
    <table style="width:100%;">
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="packageID" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="758px" AllowPaging="True" PageSize="3">
                <Columns>
                    <asp:TemplateField HeaderText="Package Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="73px" Width="124px" CssClass="listviewImage" ImageUrl='<%#getImage(Eval("packageImage")) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                    <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                    <asp:HyperLinkField DataNavigateUrlFields="packageID,sessionID" DataNavigateUrlFormatString="PackagesInCartDetail.aspx?packageid={0}&amp;sessionid={1}" HeaderText="View Detail" Text="Detail" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Packages.packageID, Packages.packageName, Packages.packageType, Packages.packageImage, Packages.packageStatus, Packages.packageCount, PackageTable.SessionID FROM Packages INNER JOIN PackageTable ON Packages.packageID = PackageTable.packageID WHERE (PackageTable.SessionID = @sessionid)">
                <SelectParameters>
                    <asp:SessionParameter Name="sessionid" SessionField="sessionid" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    </table>
            </fieldset>
    <asp:Panel ID="pnlCreate" runat="server">
          <fieldset class="coffeecustomerInfo">
        <legend>Create Packages in Cart</legend>
              Dear Customer.. You have create packages to order..
              <br />
              If you are sure to order your own creation package,please click this button to order..<br />
              <br />
              <asp:Button ID="btnOrder" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnOrder_Click" Text="Order" />
              </fieldset>
    </asp:Panel>
</asp:Content>

