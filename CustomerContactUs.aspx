<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerContactUs.aspx.cs" Inherits="CustomerContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 56%;
            text-align: left;
        }
        .auto-style3
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="coffeecustomerInfo">
        <legend>Contact Us</legend>  
        <br>
    <table style="width:97%; margin-left: 26px;">
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtName" runat="server" Width="222px" Height="25px" style="text-align: center"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorGroup">*</asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="223px" Height="25px" style="text-align: center"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorGroup">*</asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Phone Number:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtPhone" runat="server"  Width="223px" Height="25px" style="text-align: center"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorGroup">*</asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Message:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtMsg" runat="server" Height="115px" TextMode="MultiLine" Width="223px" style="text-align: left"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMsg" ErrorMessage="RequiredFieldValidator" ForeColor="Red" CssClass="validatorGroup">*</asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2" style="text-align: center">
                <br />
                <asp:Button ID="btnSend" runat="server" Font-Bold="True" OnClick="btnSend_Click" Text="Send" CssClass="btngroup" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnCancel_Click" Text="Cancel" />
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MessageBox] WHERE [Id] = @Id" InsertCommand="INSERT INTO [MessageBox] ([From], [To], [Name], [Message], [Date], [Phone], [Email], [Status]) VALUES (@From, @To, @Name, @Message, @Date, @Phone, @Email, @Status)" SelectCommand="SELECT MAX(Id) AS Expr1 FROM MessageBox" UpdateCommand="UPDATE [MessageBox] SET [From] = @From, [To] = @To, [Name] = @Name, [Message] = @Message, [Date] = @Date, [Phone] = @Phone, [Email] = @Email, [Status] = @Status WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="From" SessionField="userid" Type="String" />
                        <asp:Parameter DefaultValue="admin" Name="To" Type="String" />
                        <asp:ControlParameter ControlID="txtName" DefaultValue="" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtMsg" Name="Message" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1" DbType="Date" Name="Date" PropertyName="Value" />
                        <asp:ControlParameter ControlID="txtPhone" Name="Phone" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="0" Name="Status" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="From" Type="String" />
                        <asp:Parameter Name="To" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Message" Type="String" />
                        <asp:Parameter DbType="Date" Name="Date" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:HiddenField ID="HiddenField2" runat="server" />
            </td>
        </tr>
    </table>

    </fieldset>
</asp:Content>


