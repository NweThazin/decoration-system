<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdminPackageDetail.aspx.cs" Inherits="AdminPackageDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <fieldset class="customerInfo">
        <legend>Package Information</legend>
        &nbsp;<asp:RadioButtonList ID="radbtnPackgeType" class="tex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="radbtnPackgeType_SelectedIndexChanged">
            <asp:ListItem  Selected="True"  Value="view">View Package Information</asp:ListItem>
            <asp:ListItem Value="add">Create New Package</asp:ListItem>
        </asp:RadioButtonList>
            <fieldset class="customerInfo">
        <legend>View Package Information</legend>

                <table style="width:100%;" class="tex">
                    <tr>
                        <td style="width: 5%">&nbsp;</td>
                        <td rowspan="3">
                            Search By Category:<asp:DropDownList ID="ddlByPackageCategory" CssClass="dropdownlist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlByPackageCategory_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="all">ALL</asp:ListItem>
                                <asp:ListItem>Grand</asp:ListItem>
                                <asp:ListItem>Sweet</asp:ListItem>
                                <asp:ListItem>Standard</asp:ListItem>
                                <asp:ListItem Value="UserType">UserType</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="packageID" DataSourceID="SqlDataSource1" Width="876px">
                                <Columns>
                                    <asp:BoundField DataField="packageID" HeaderText="Package Number" ReadOnly="True" SortExpression="packageID" />
                                    <asp:BoundField DataField="packageName" HeaderText="Package Name" SortExpression="packageName" />
                                    <asp:BoundField DataField="packageType" HeaderText="Package Type" SortExpression="packageType" />
                                    <asp:BoundField DataField="packageCount" HeaderText="Number of Orders" SortExpression="packageCount" />
                                    <asp:HyperLinkField DataNavigateUrlFields="packageID,packageStatus" DataNavigateUrlFormatString="AdminPackageDetailCustomer.aspx?pid={0}&amp;pstatus={1}" HeaderText="Viiew Detail" Text="Detail" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages] ORDER BY [packageID] DESC" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages] WHERE ([packageType] = @packageType) ORDER BY [packageID] DESC" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
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
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlByPackageCategory" Name="packageType" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="packageName" Type="String" />
                                    <asp:Parameter Name="packageType" Type="String" />
                                    <asp:Parameter Name="packageImage" Type="Object" />
                                    <asp:Parameter Name="packageStatus" Type="Int32" />
                                    <asp:Parameter Name="packageCount" Type="Int32" />
                                    <asp:Parameter Name="packageID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource></td>
                        <td style="width: 5%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 5%">&nbsp;</td>
                        <td style="width: 5%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 5%">&nbsp;</td>
                        <td style="width: 5%">&nbsp;</td>
                    </tr>
                </table>

        </fieldset>
              </fieldset>
</asp:Content>

