<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AdvertisementVideo.aspx.cs" Inherits="AdvertisementVideo" %>

<%@ Register assembly="FlashControl" namespace="Bewise.Web.UI.WebControls" tagprefix="Bewise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <fieldset class="customerInfo">
                <legend>Add New Video</legend>
         <table style="width: 100%;">
             <tr>
                 <td rowspan="4" style="width: 5%">&nbsp;</td>
                 <td style="height: 10%">
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btngroup" />
                 </td>
                 <td rowspan="4" style="width: 5%">&nbsp;</td>
             </tr>
             <tr>
                 <td>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload Video" CssClass="btngroup" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete  Video " CssClass="btngroup" />
        <asp:Label ID="lblmessage" runat="server" CssClass="tex" ForeColor="Red"></asp:Label>
                 </td>
             </tr>
             <tr>
                 <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" Width="601px" OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="VideoName" HeaderText="Name" SortExpression="VideoName" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure want to delete video?')" Text="Delete"></asp:LinkButton>
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
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="VideoName" DataValueField="VideoUrl" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="dropdownlist">
        </asp:DropDownList>
        </td></tr><tr><td class="auto-style1">
        <Bewise:FlashControl ID="FlashControl1" runat="server" />
         </td></tr></table>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [VTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [VTable] ([VideoName], [VideoUrl], [Status]) VALUES (@VideoName, @VideoUrl, @Status)" SelectCommand="SELECT * FROM [VTable]" UpdateCommand="UPDATE [VTable] SET [VideoName] = @VideoName, [VideoUrl] = @VideoUrl, [Status] = @Status WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VideoName" Type="String" />
                <asp:Parameter Name="VideoUrl" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="VideoName" Type="String" />
                <asp:Parameter Name="VideoUrl" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [VideoTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [VideoTable] ([VideoName], [VideoUrl], [Status]) VALUES (@VideoName, @VideoUrl, @Status)" SelectCommand="SELECT * FROM [VideoTable]" UpdateCommand="UPDATE [VideoTable] SET [VideoName] = @VideoName, [VideoUrl] = @VideoUrl, [Status] = @Status WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VideoName" Type="String" />
                <asp:Parameter Name="VideoUrl" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="VideoName" Type="String" />
                <asp:Parameter Name="VideoUrl" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
     
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [VTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [VTable] ([VideoName], [VideoUrl], [Status]) VALUES (@VideoName, @VideoUrl, @Status)" SelectCommand="SELECT * FROM [VTable] WHERE ([Status] = @status)" UpdateCommand="UPDATE [VTable] SET  [Status] = @Status WHERE ([Status] = @status)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VideoName" Type="String" />
                <asp:Parameter Name="VideoUrl" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="status" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DefaultValue="1" Name="status" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [VTable]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, VideoName, VideoUrl, Status FROM VTable WHERE (VideoName &lt;&gt; @vname)" DeleteCommand="DELETE FROM [VTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [VTable] ([VideoName], [VideoUrl], [Status]) VALUES (@VideoName, @VideoUrl, @Status)" UpdateCommand="UPDATE [VTable] SET [Status] = @Status WHERE (VideoName &lt;&gt; @vname)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VideoName" Type="String" />
                <asp:Parameter Name="VideoUrl" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="vname" SessionField="vname" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="Status" SessionField="status" />
                <asp:SessionParameter Name="vname" SessionField="vname" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [VTable] WHERE ([VideoName] = @VideoName)" DeleteCommand="DELETE FROM [VTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [VTable] ([VideoName], [VideoUrl], [Status]) VALUES (@VideoName, @VideoUrl, @Status)" UpdateCommand="UPDATE [VTable] SET  [Status] = @Status WHERE ([VideoName] = @VideoName)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VideoName" Type="String" />
                <asp:Parameter Name="VideoUrl" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="VideoName" SessionField="vname" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DefaultValue="1" Name="Status" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="VideoName" SessionField="vname" />
            </UpdateParameters>
        </asp:SqlDataSource>
   </fieldset>
</asp:Content>

