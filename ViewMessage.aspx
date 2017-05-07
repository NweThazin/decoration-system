<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ViewMessage.aspx.cs" Inherits="ViewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset class="coffeecustomerInfo">
        <legend>View Message</legend>  
         <table style="width:100%;" align="center">
        <tr>
            <td style="text-align: center">
          
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="230px" style="text-align: center" Width="451px">
                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:TemplateField HeaderText="From" SortExpression="Name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To" SortExpression="To">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("To") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("To") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("To") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnEmail" runat="server" OnClick="lnkbtnEmail_Click" Text='<%# Eval("Email") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Message" SortExpression="Message">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <FooterTemplate>
                                &nbsp;
                                <asp:Button ID="btnGoBack" runat="server" CssClass="btngroup" OnClick="btnGoBack_Click" Text="Go Back" />
                            </FooterTemplate>
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <HeaderTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Customer Message"></asp:Label>
                            </HeaderTemplate>
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        </asp:DetailsView>
                   
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="customerID" DataSourceID="SqlDataSource1" Height="50px" Width="457px" style="margin-left: 0px">
                            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:BoundField DataField="customerName" HeaderText="Name" SortExpression="customerName" />
                                <asp:BoundField DataField="customerNRC" HeaderText="NRC" SortExpression="customerNRC" />
                                <asp:BoundField DataField="customerPhone" HeaderText="Phone" SortExpression="customerPhone" />
                                <asp:BoundField DataField="customerAddress" HeaderText="Address" SortExpression="customerAddress" />
                                <asp:BoundField DataField="customerEmail" HeaderText="Email" SortExpression="customerEmail" />
                            </Fields>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <FooterTemplate>
                                <asp:Button ID="btnCustomerGoBack" runat="server" CssClass="btngroup" OnClick="btnCustomerGoBack_Click" Text="Go Back" />
                            </FooterTemplate>
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <HeaderTemplate>
                                <asp:Label ID="Label2" runat="server" Text="Customer Information"></asp:Label>
                            </HeaderTemplate>
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerID] = @customerID" InsertCommand="INSERT INTO [Customers] ([customerName], [customerNRC], [customerPhone], [customerAddress], [customerEmail], [customerStatus], [customerPassword]) VALUES (@customerName, @customerNRC, @customerPhone, @customerAddress, @customerEmail, @customerStatus, @customerPassword)" SelectCommand="SELECT * FROM [Customers] WHERE ([customerID] = @customerID)" UpdateCommand="UPDATE [Customers] SET [customerName] = @customerName, [customerNRC] = @customerNRC, [customerPhone] = @customerPhone, [customerAddress] = @customerAddress, [customerEmail] = @customerEmail, [customerStatus] = @customerStatus, [customerPassword] = @customerPassword WHERE [customerID] = @customerID">
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
                                <asp:QueryStringParameter Name="customerID" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="customerName" Type="String" />
                                <asp:Parameter Name="customerNRC" Type="String" />
                                <asp:Parameter Name="customerPhone" Type="Decimal" />
                                <asp:Parameter Name="customerAddress" Type="String" />
                                <asp:Parameter Name="customerEmail" Type="String" />
                                <asp:Parameter Name="customerStatus" Type="Int32" />
                                <asp:Parameter Name="customerPassword" Type="String" />
                                <asp:Parameter Name="customerID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MessageBox] WHERE [Id] = @Id" InsertCommand="INSERT INTO [MessageBox] ([From], [To], [Name], [Message], [Date], [Phone], [Email], [Status]) VALUES (@From, @To, @Name, @Message, @Date, @Phone, @Email, @Status)" SelectCommand="SELECT Id, [From], [To], Name, Message, Date, Phone, Email, Status FROM MessageBox WHERE  (Id = @id)" UpdateCommand="UPDATE MessageBox SET Status = 1 WHERE (Id = @id)">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="From" Type="String" />
                                <asp:Parameter Name="To" Type="String" />
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Message" Type="String" />
                                <asp:Parameter DbType="Date" Name="Date" />
                                <asp:Parameter Name="Phone" Type="Int32" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Status" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id" QueryStringField="mid" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:QueryStringParameter Name="id" QueryStringField="mid" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
       </fieldset>
</asp:Content>

