<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerReadyPackage.aspx.cs" Inherits="CustomerReadyPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table style="width:100%;" class="tex">
            <tr>
                <td rowspan="3" style="width: 80%; text-align: center;">
                        <fieldset class="coffeecustomerInfo">
        <legend class="tex">Package Lists</legend>
                           <p> Choose Your Favourite Decoration Package Type : <asp:DropDownList ID="ddlPackage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPackage_SelectedIndexChanged" CssClass="dropdownlist">
                                <asp:ListItem Selected="True" Value="all">All</asp:ListItem>
                                <asp:ListItem>Grand</asp:ListItem>
                                <asp:ListItem>Sweet</asp:ListItem>
                                <asp:ListItem>Standard</asp:ListItem>
                            </asp:DropDownList></p>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="packageID" DataSourceID="SqlDataSource1" GroupItemCount="3" style="text-align: center">
                        <AlternatingItemTemplate>
                            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                <asp:Image ID="Image2" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("packageImage"))%>' CssClass="tran"/>
                                <br />
                                <asp:LinkButton ID="ViewDetailsLinkButton" CssClass="texdetail"  runat="server" PostBackUrl='<%#"CustomerReadyPackageDetails.aspx?packageid="+Eval("packageID") %>'>View Detail</asp:LinkButton>
                                <br /></td>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <td runat="server" style="background-color: #FFCC66;color: #000080;">packageID:
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
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
<td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">packageID:
                                <asp:TextBox ID="packageIDTextBox" runat="server" Text='<%# Bind("packageID") %>' />
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
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                <br /></td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="background-color: #FFFBD6; color: #333333;">
                                <asp:Image ID="Image3" runat="server" Height="117px" Width="228px"  ImageUrl='<%#getImage(Eval("packageImage"))%>'  CssClass="tran"/>

                                <br/>
                                <asp:LinkButton ID="ViewDetailsLinkButton1" CssClass="texdetail" runat="server" PostBackUrl='<%#"CustomerReadyPackageDetails.aspx?packageid="+Eval("packageID") %>'>View Detail</asp:LinkButton>
                                <br /></td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
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
                            <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">packageID:
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
                            </fieldset>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageName], [packageType], [packageImage], [packageStatus], [packageCount]) VALUES (@packageID, @packageName, @packageType, @packageImage, @packageStatus, @packageCount)" SelectCommand="SELECT * FROM [Packages] WHERE ([packageStatus] = @packageStatus)" UpdateCommand="UPDATE [Packages] SET [packageName] = @packageName, [packageType] = @packageType, [packageImage] = @packageImage, [packageStatus] = @packageStatus, [packageCount] = @packageCount WHERE [packageID] = @packageID">
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
                            <asp:Parameter DefaultValue="0" Name="packageStatus" Type="Int32" />
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
                                <asp:ControlParameter ControlID="ddlPackage" Name="packageType" PropertyName="SelectedValue" Type="String" />
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
                </td>
                <td style="width: 20%">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 20%"></td>
            </tr>
            <tr>
                <td style="width: 20%">&nbsp;</td>
            </tr>
        </table>
    
</asp:Content>

