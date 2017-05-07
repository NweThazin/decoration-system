<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCustomer.master" AutoEventWireup="true" CodeFile="CustomerProfilePage.aspx.cs" Inherits="CustomerProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
            text-align: left;
        }
        .auto-style2 {
        height: 23px;
        width: 159px;
        text-align: right;
    }
        .auto-style3 {
            text-align: right;
    }
        .auto-style4 {
            width: 159px;
            height: 32px;
        text-align: right;
    }
        .auto-style5 {
            height: 32px;
            text-align: left;
        }
        .auto-style8 {
        text-align: right;
            width: 15%;
            height: 52px;
        }
    .auto-style9 {
        height: 23px;
        width: 15%;
        text-align: right;
    }
        .auto-style10 {
            text-align: left;
        }
        .auto-style11 {
            text-align: left;
            width: 15%;
            height: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width: 100%;">
    <tr>
        <td style="text-align: center">
              <fieldset class="coffeecustomerInfo">
        <legend class="tex">Customer Profile</legend>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" >
            <asp:View ID="CustomerInformationView" runat="server" >
                <table style="width:100%;" class="tex">
                    <tr>
                        <td style="width: 10%">&nbsp;</td>
                        <td>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="customerID" DataSourceID="SqlDataSource1" Height="123px" Width="393px">
                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:TemplateField HeaderText="Name" SortExpression="customerName">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("customerName") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("customerName") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("customerName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NRC" SortExpression="customerNRC">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblNRC" runat="server" Text='<%# Bind("customerNRC") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("customerNRC") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("customerNRC") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone" SortExpression="customerPhone">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("customerPhone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("customerPhone") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("customerPhone") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address" SortExpression="customerAddress">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("customerAddress") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("customerAddress") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("customerAddress") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="customerEmail">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("customerEmail") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("customerEmail") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("customerEmail") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" />
                                </Fields>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            </asp:DetailsView>
                            </td>
                        <td style="width: 10%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 10%">&nbsp;</td>
                        <td style="text-align: justify">
                            <br />
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btngroup" OnClick="btnUpdate_Click" Text="Change Password" />
                        </td>
                        <td style="width: 10%">&nbsp;</td>
                    </tr>
                </table>
  
            </asp:View>
   
            <asp:View ID="UpdateCustomerView" runat="server">
                <table style="width:100%;" class="tex">
                    <tr>
                        <td class="auto-style4" style="width: 10%;">&nbsp;</td>
                        <td class="auto-style4" style="width: 45%;">Enter Current Password:</td>
                        <td class="auto-style5" style="width: 45%;" colspan="2">
                            <asp:TextBox ID="txtOldPassword" runat="server" Height="22px" TextMode="Password" Width="160px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword" CssClass="validatorGroup" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Enter Current Password</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="width: 10%;">&nbsp;</td>
                        <td class="auto-style2" style="width: 45%;">Enter New Password:</td>
                        <td class="auto-style1" style="width: 45%;" colspan="2">
                            <asp:TextBox ID="txtNewPassword" runat="server" Height="22px" TextMode="Password" Width="160px"></asp:TextBox>
                            <br />
                            <asp:CustomValidator ID="CustomValidator" runat="server" ControlToValidate="txtNewPassword" CssClass="validatorGroup" ErrorMessage="CustomValidator" ForeColor="Red" OnServerValidate="CustomValidator_ServerValidate">Enter Password, at least eight characters!</asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9" style="width: 10%">&nbsp;</td>
                        <td class="auto-style9" style="width: 45%">Confirm New Password:</td>
                        <td class="auto-style1" style="width: 45%;" colspan="2">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" Height="22px" TextMode="Password" Width="160px"></asp:TextBox>
                            <br />
                            <asp:CompareValidator ID="CompareValidator" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" CssClass="validatorGroup" ErrorMessage="CompareValidator" ForeColor="#FF3300">Reenter Your Password !</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%;" class="auto-style8">
                            &nbsp;</td>
                        <td class="auto-style11" colspan="3" style="text-align: center; width: 45%;">
                            <br />
                            <asp:Button ID="btnSave" runat="server" CssClass="btngroup" OnClick="btnSave_Click" Text="Save" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btngroup" OnClick="btnCancel_Click" Text="Cancel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" style="width: 10%;">
                            &nbsp;</td>
                        <td class="auto-style10" colspan="2" style="width: 45%;">
                            <asp:Label ID="lblMessage" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style10" style="width: 45%">&nbsp;</td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
                  </fieldset>
        </td>
    </tr>
    </table>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerID] = @customerID" InsertCommand="INSERT INTO [Customers] ([customerName], [customerNRC], [customerPhone], [customerAddress], [customerEmail], [customerStatus], [customerPassword]) VALUES (@customerName, @customerNRC, @customerPhone, @customerAddress, @customerEmail, @customerStatus, @customerPassword)" SelectCommand="SELECT * FROM [Customers] WHERE (([customerEmail] = @customerEmail) AND ([customerPassword] = @customerPassword))" UpdateCommand="UPDATE [Customers] SET [customerPhone] = @customerPhone, [customerAddress] = @customerAddress,  [customerPassword] = @customerPassword WHERE customerEmail==Session[&quot;email&quot;] &amp;&amp; customerPassword==Session[&quot;pwd&quot;]">
                                <DeleteParameters>
                                    <asp:Parameter Name="customerID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="customerName" Type="String" />
                                    <asp:Parameter Name="customerNRC" Type="String" />
                                    <asp:Parameter Name="customerPhone" Type="Decimal" />
                                    <asp:Parameter Name="customerAddress" Type="String" />
                                    <asp:Parameter Name="customerEmail" Type="String" />
                                    <asp:Parameter Name="customerStatus" Type="Int32" />
                                    <asp:Parameter Name="customerPassword" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="customerEmail" SessionField="email" Type="String" />
                                    <asp:ControlParameter ControlID="txtOldPassword" Name="customerPassword" PropertyName="Text" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="txtPhoneno" Name="customerPhone" PropertyName="Text" Type="Decimal" />
                                    <asp:ControlParameter ControlID="txtAddress" Name="customerAddress" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtNewPassword" Name="customerPassword" PropertyName="Text" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerID] = @customerID" InsertCommand="INSERT INTO [Customers] ([customerName], [customerNRC], [customerPhone], [customerAddress], [customerEmail], [customerStatus], [customerPassword]) VALUES (@customerName, @customerNRC, @customerPhone, @customerAddress, @customerEmail, @customerStatus, @customerPassword)" SelectCommand="SELECT * FROM [Customers] WHERE ([customerEmail] = @customerEmail)" UpdateCommand="UPDATE [Customers] SET  [customerPassword] = @customerPassword WHERE ([customerEmail] = @customerEmail)">
                    <DeleteParameters>
                        <asp:Parameter Name="customerID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="customerName" Type="String" />
                        <asp:Parameter Name="customerNRC" Type="String" />
                        <asp:Parameter Name="customerPhone" Type="Decimal" />
                        <asp:Parameter Name="customerAddress" Type="String" />
                        <asp:Parameter Name="customerEmail" Type="String" />
                        <asp:Parameter Name="customerStatus" Type="Int32" />
                        <asp:Parameter Name="customerPassword" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="customerEmail" SessionField="email" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="customerEmail" SessionField="email" Type="String" />
                        <asp:ControlParameter ControlID="txtNewPassword" Name="customerPassword" PropertyName="Text" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerID] = @customerID" InsertCommand="INSERT INTO [Customers] ([customerName], [customerNRC], [customerPhone], [customerAddress], [customerEmail], [customerStatus], [customerPassword]) VALUES (@customerName, @customerNRC, @customerPhone, @customerAddress, @customerEmail, @customerStatus, @customerPassword)" SelectCommand="SELECT * FROM [Customers] WHERE (([customerEmail] = @customerEmail) AND ([customerPassword] = @customerPassword))" UpdateCommand="UPDATE Customers SET customerNRC = @customerNRC, customerPhone = @customerPhone, customerAddress = @customerAddress WHERE (customerID = @customerID)">
                    <DeleteParameters>
                        <asp:Parameter Name="customerID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="customerName" Type="String" />
                        <asp:Parameter Name="customerNRC" Type="String" />
                        <asp:Parameter Name="customerPhone" Type="Decimal" />
                        <asp:Parameter Name="customerAddress" Type="String" />
                        <asp:Parameter Name="customerEmail" Type="String" />
                        <asp:Parameter Name="customerStatus" Type="Int32" />
                        <asp:Parameter Name="customerPassword" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="customerEmail" SessionField="email" Type="String" />
                        <asp:SessionParameter Name="customerPassword" SessionField="pwd" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="customerNRC" />
                        <asp:Parameter Name="customerPhone" />
                        <asp:Parameter Name="customerAddress" />
                        <asp:Parameter Name="customerID" />
                    </UpdateParameters>
     </asp:SqlDataSource>

                </asp:Content>

