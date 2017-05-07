<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageHome.master" AutoEventWireup="true" CodeFile="CustomerMainHomePage.aspx.cs" Inherits="CustomerMainHomePage" %>

<%@ Register assembly="FlashControl" namespace="Bewise.Web.UI.WebControls" tagprefix="Bewise" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .tran {}
        .tran {}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table style="width:100%;height:100%">
        <tr>
            <td style="text-align: justify; width: 60%;" class="tex">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Modern Interior Coffee Shop Decoration Myanmar is a full service event design production and floral design company. From floor to ceiling, wall to wall, any space can be transformed to 
                produce any theme imaginable. Our dynamic team will help ensure all aspects of the event are well taken care of.<br />
                Here are provided packages shown by top ten lists.</td>
            <td style="width: 2%;">&nbsp;</td>
            <td style="text-align: justify; width: 25%;" rowspan="2">
                    <table style="width:100%;text-align:center;" >
                    <tr>
                        <td class="videotable" style="width: 35%">
                                    <Bewise:FlashControl ID="FlashControl1" runat="server" Height="200px" Loop="True" MovieUrl="~/Video/Slideshow1(1).swf" Width="100%" BgColor="#996633" CssClass="tran"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="videotable" style="width: 35%">
                                    <Bewise:FlashControl ID="FlashControl2" runat="server" Height="200px" Width="100%" BgColor="#996633" CssClass="tran" />
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Status], [VideoUrl] FROM [VTable] WHERE ([Status] = @Status)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Status" SessionField="vv" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                </td>
                    </tr>
                    </table>
           <br/><br/>
                    </td>
        </tr>
        <tr>
            <td style="width: 60%">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" DataKeyNames="packageID" style="text-align: justify">
                        <AlternatingItemTemplate>
                            <td runat="server" class="listviewtable" style="background-color: #FAFAD2;color: #284775;">
                             <asp:Image ID="Image2" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("packageImage"))%>' CssClass="tran" /><br />
                             <asp:LinkButton ID="lnkbtnPackageImage"  runat="server" PostBackUrl='<%#"CustomerReadyPackageDetails.aspx?packageid="+Eval("packageID") %>' Font-Size="Medium">
                                View Detail</asp:LinkButton>
                            </td>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <td runat="server" style="background-color: #FFCC66;color: #000080;">packageID:
                                <asp:Label ID="packageIDLabel1" runat="server" Text='<%# Eval("packageID") %>' />
                                <br />
                                packageImage:
                                <asp:TextBox ID="packageImageTextBox" runat="server" Text='<%# Bind("packageImage") %>' />
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
                        <EmptyItemTemplate><td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">packageID:
                                <asp:TextBox ID="packageIDTextBox" runat="server" Text='<%# Bind("packageID") %>' />
                                <br />
                                packageImage:
                                <asp:TextBox ID="packageImageTextBox" runat="server" Text='<%# Bind("packageImage") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                <br /></td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="background-color: #FFFBD6; color: #333333;" class="listviewtable">
                            <asp:Image ID="Image1" runat="server" Height="117px" Width="228px" ImageUrl='<%#getImage(Eval("packageImage"))%>' CssClass="tran" /><br />
                             <asp:LinkButton ID="lnkbtnPackageImage" runat="server" PostBackUrl='<%#"CustomerReadyPackageDetails.aspx?packageid="+Eval("packageID") %>'>
                                View Detail</asp:LinkButton>
                            </td>
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
                                <tr runat="server" >
                                    <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;" >
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="6" >
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
                                <br />packageImage:
                                <asp:Label ID="packageImageLabel" runat="server" Text='<%# Eval("packageImage") %>' />
                                <br />
                            </td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Packages] WHERE [packageID] = @packageID" InsertCommand="INSERT INTO [Packages] ([packageID], [packageImage]) VALUES (@packageID, @packageImage)" SelectCommand="SELECT packageID, packageImage FROM Packages WHERE (packageStatus = @packageStatus) ORDER BY packageCount DESC" UpdateCommand="UPDATE [Packages] SET [packageImage] = @packageImage WHERE [packageID] = @packageID">
                        <DeleteParameters>
                            <asp:Parameter Name="packageID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="packageID" Type="Int32" />
                            <asp:Parameter Name="packageImage" Type="Object" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="packageStatus" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="packageImage" Type="Object" />
                            <asp:Parameter Name="packageID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
           
                    </td>
            <td style="width: 2%">
                    &nbsp;</td>
        </tr>
        </table>
    <br /><br/><br/>
</asp:Content>

