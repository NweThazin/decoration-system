<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerHomePage.aspx.cs" Inherits="CustomerHomePage" %>

<%@ Register assembly="FlashControl" namespace="Bewise.Web.UI.WebControls" tagprefix="Bewise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style2 {
            height: 23px;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="coffeecustomerInfo">
        <legend>Customer Home Page</legend>
    <table style="width:100%;height:100%">
        <tr>
            <td style="width: 60%;" class="tex">
                Welcome
                <asp:Label ID="Label1" runat="server" ForeColor="Red" ></asp:Label>
&nbsp;! Welcome to our newly redesigned website!
          
                <p class="tex">Choose Your Favourite Decoration Package Type :<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="dropdownlist">
                    <asp:ListItem Selected="True" Value="all">ALL</asp:ListItem>
                    <asp:ListItem>Grand</asp:ListItem>
                    <asp:ListItem>Sweet</asp:ListItem>
                    <asp:ListItem>Standard</asp:ListItem>
                </asp:DropDownList>
                </p>    
            </td>
            <td rowspan="2">
                  
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Packages] WHERE ([packageStatus] = @packageStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="packageStatus" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Packages] WHERE (([packageStatus] = @packageStatus) AND ([packageType] = @packageType))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="packageStatus" Type="Int32" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="packageType" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages] WHERE ([packageType] = @packageType)" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
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
                        <asp:ControlParameter ControlID="DropDownList1" Name="packageType" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="packageName" Type="String" />
                        <asp:Parameter Name="packageType" Type="String" />
                        <asp:Parameter Name="packageImage" Type="Object" />
                        <asp:Parameter Name="packageStatus" Type="Int32" />
                        <asp:Parameter Name="packageCount" Type="Int32" />
                        <asp:Parameter Name="packageID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                    <br />
                    </td>
        </tr>
        <tr>
            <td style="width: 60%">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="packageID" DataSourceID="SqlDataSource2" GroupItemCount="3" style="margin-left: 0px; text-align: left;">
                    <AlternatingItemTemplate>
                        <td id="Td1" runat="server" class="listviewtable">
                            <asp:Image ID="Image1" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("packageImage"))%>' CssClass="tran" />
                            <br />
                           <asp:LinkButton ID="lnkbtnPackageImage" runat="server" OnClick="lnkbtnPackageImage_Click" PostBackUrl='<%#"CustomerReadyPackageDetails.aspx?packageid="+Eval("packageID") %>' CssClass="texdetail">
                            View Detail</asp:LinkButton>
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td id="Td2" runat="server" style="background-color: #FFCC66;color: #000080;">packageID:
                            <asp:Label ID="packageIDLabel1" runat="server" Text='<%# Eval("packageID") %>' />
                            <br />packageName:
                            <asp:TextBox ID="packageNameTextBox" runat="server" Text='<%# Bind("packageName") %>' />
                            <br />packageType:
                            <asp:TextBox ID="packageTypeTextBox" runat="server" Text='<%# Bind("packageType") %>' />
                            <br />packageImage:
                            <asp:TextBox ID="packageImageTextBox" runat="server" Text='<%# Bind("packageImage") %>' />
                            <br />packageStatus:
                            <asp:TextBox ID="packageStatusTextBox" runat="server" Text='<%# Bind("packageStatus") %>' />
                            <br />packageCount:
                            <asp:TextBox ID="packageCountTextBox" runat="server" Text='<%# Bind("packageCount") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br /></td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
<td id="Td3" runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td id="Td4" runat="server" style="">packageID:
                            <asp:TextBox ID="packageIDTextBox" runat="server" Text='<%# Bind("packageID") %>' />
                            <br />packageName:
                            <asp:TextBox ID="packageNameTextBox0" runat="server" Text='<%# Bind("packageName") %>' />
                            <br />packageType:
                            <asp:TextBox ID="packageTypeTextBox0" runat="server" Text='<%# Bind("packageType") %>' />
                            <br />packageImage:
                            <asp:TextBox ID="packageImageTextBox0" runat="server" Text='<%# Bind("packageImage") %>' />
                            <br />packageStatus:
                            <asp:TextBox ID="packageStatusTextBox0" runat="server" Text='<%# Bind("packageStatus") %>' />
                            <br />packageCount:
                            <asp:TextBox ID="packageCountTextBox0" runat="server" Text='<%# Bind("packageCount") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <br />
                            <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Clear" />
                            <br /></td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td id="Td5" runat="server" class="listviewtable">
                            <asp:Image ID="Image2" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("packageImage"))%>' CssClass="tran" />
                            <br />
                            <asp:LinkButton ID="lnkbtnPackageImage0"  runat="server" PostBackUrl='<%#"CustomerReadyPackageDetails.aspx?packageid="+Eval("packageID") %>' CssClass="texdetail">
                            View Detail</asp:LinkButton>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table2" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td6" runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="Td7" runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td id="Td8" runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">packageID:
                            <asp:Label ID="packageIDLabel" runat="server" Text='<%# Eval("packageID") %>' />
                            <br />packageName:
                            <asp:Label ID="packageNameLabel" runat="server" Text='<%# Eval("packageName") %>' />
                            <br />packageType:
                            <asp:Label ID="packageTypeLabel" runat="server" Text='<%# Eval("packageType") %>' />
                            <br />packageImage:
                            <asp:Label ID="packageImageLabel" runat="server" Text='<%# Eval("packageImage") %>' />
                            <br />packageStatus:
                            <asp:Label ID="packageStatusLabel" runat="server" Text='<%# Eval("packageStatus") %>' />
                            <br />packageCount:
                            <asp:Label ID="packageCountLabel" runat="server" Text='<%# Eval("packageCount") %>' />
                            <br /></td>
                    </SelectedItemTemplate>
                </asp:ListView>
                </td>
        </tr>
        </table>
        </fieldset>
</asp:Content>

