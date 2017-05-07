<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminViewMaxMinOrderPage.aspx.cs" Inherits="AdminViewMaxMinOrderPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 11%;
        }
        .auto-style2 {
            width: 691px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="customerInfo">
        <legend>View Order List</legend>
        <table style="width:100%;">
        <tr>
            <td class="auto-style1" style="width: 2%">&nbsp;</td>
            <td class="auto-style2">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Selected="True">Maximun Selling Package</asp:ListItem>
                    <asp:ListItem Value="2">Minimun Selling Package</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="width: 2%">&nbsp;</td>
            <td class="auto-style2" >
                <fieldset class="customerInfo">
                    <legend style="text-align: left">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </legend>
 
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="MaxSelling" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="packageID" DataSourceID="SqlDataSource1" Width="941px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:TemplateField HeaderText="Package Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image3" runat="server" Height="111px" Width="209px"  ImageUrl='<%#getImage(Eval("packageImage")) %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="packageID" HeaderText="Package Number" ReadOnly="True" SortExpression="packageID" />
                                <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                                <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                                <asp:BoundField DataField="packageCount" HeaderText="Number of Orders" SortExpression="packageCount" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT TOP (10) packageID, packageName, packageType, packageImage, packageStatus, packageCount FROM Packages WHERE (packageStatus = 0) ORDER BY packageCount DESC" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
                            <DeleteParameters>
                                <asp:Parameter Name="packageID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="packageID" Type="Int32" />
                                <asp:Parameter Name="packageName" Type="String" />
                                <asp:Parameter Name="packageType" Type="String" />
                                <asp:Parameter Name="packageImage" Type="Object" />
                                <asp:Parameter Name="packageStatus" Type="Int32" />
                                <asp:Parameter Name="packageCount" Type="Int32" />
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
                    </asp:View>
                    <asp:View ID="MinSelling" runat="server">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="packageID" DataSourceID="SqlDataSource2" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AllowPaging="True" PageSize="5" style="margin-right: 0px" Width="942px">
                            <Columns>
                                <asp:TemplateField HeaderText="Package Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image4" runat="server"  Height="111px" Width="209px"  ImageUrl='<%#getImage(Eval("packageImage")) %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="packageID" HeaderText="Package Number" ReadOnly="True" SortExpression="packageID" />
                                <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                                <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                                <asp:BoundField DataField="packageCount" HeaderText="Number of Orders" SortExpression="packageCount" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (10) packageID, packageName, packageType, packageImage, packageStatus, packageCount FROM Packages WHERE (packageStatus = 0) ORDER BY packageCount"></asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>

                </fieldset>                
    
            </td>
        </tr>
        </table>
    </fieldset>
    </asp:Content>

