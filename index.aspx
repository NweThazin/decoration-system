<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register assembly="FlashControl" namespace="Bewise.Web.UI.WebControls" tagprefix="Bewise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/forindexpage.css" rel="stylesheet" />
    <link href="css/teamOneDesign.css" rel="stylesheet" />
    <link href="css/MyTestButton.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .videoindex {}
        .buttonwafer {}
        .auto-style1 {
        }
        .auto-style2 {
            width: 154px;
        }
        .auto-style6 {
            width: 253px;
        }
        .auto-style7 {
            width: 442px;
        }
        </style>
</head>
<body class="backindex">
    
    <form id="form1" runat="server">
    
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Blue_butterfly_2.gif" CssClass="bird1"/>
         
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Blue_butterfly_2.gif" CssClass="bird2"/>
         <asp:Image ID="Image6" runat="server" ImageUrl="~/images/Blue_butterfly_2.gif" CssClass="bird3"/> 
        <asp:Image ID="Image7" runat="server" ImageUrl="~/images/bu.gif" CssClass="bird4"/> 
         

   
        <table style="width:100%;">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="5">
                    <div class="pulloutimage1"><asp:Image ID="Image8" runat="server"  CssClass="original" ImageUrl="~/images/Standatrd5.jpg"  Height="200px" Width="400px" />
                    <asp:Image ID="Image9" runat="server" CssClass="ondemand" ImageUrl="~/images/TitleBar.jpg"  Height="150px" Width="700px"/>
                        </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <table class="videoborder"><td style="border: thick solid #800000"><Bewise:FlashControl ID="FlashControl1" runat="server" Height="200px" Loop="True" MovieUrl="~/Video/Slideshow1(2).swf" Width="300px" AlternativeImage="~/images/wpid-Wallpaper-Pattern-0.jpg" BgColor="#333333" /></td></table>
                </td>
                <td class="auto-style2">
                   
                </td>
                <td class="auto-style6"> 
                   </td>
                <td> 
                     
                
                
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Image ID="Image3" runat="server" class="swing" CssClass="swing" Height="152px" ImageUrl="~/images/Standard44.jpg" Width="248px" />
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    
                    
                    <table><td style="border: thick solid #800000"><Bewise:FlashControl ID="FlashControl3" runat="server" Height="200px" Loop="True" MovieUrl="~/Video/2.swf" Width="300px" BgColor="#333333" /></td></table>
                    
                    
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Status], [VideoUrl] FROM [VTable] WHERE ([Status] = @Status)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Status" SessionField="vv" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                    
                    
                   </td>
                <td class="auto-style2">



                    <%-- <div class="pulloutimage1">
                         
                         
                         
                         <asp:Image ID="Image10" runat="server" CssClass="original" Height="280px" Width="450px" ImageUrl="~/images/44444sweet.jpg"/>
                    <asp:Image ID="Image11" runat="server" CssClass="ondemand" Height="280px" Width="450px" ImageUrl="~/images/Sweet.jpg"/>
                       </div> 
                    --%>


                </td>
                <td class="auto-style6">
                  <asp:Image ID="Image5" runat="server" class="swing" CssClass="swing" Height="152px" ImageUrl="~/images/ManiinHomePage.jpg" Width="248px" />
                </td>
                <td>



         <%--        <p id="socialicons">--%>
    <%--          <a href="CustomerHomePage.aspx">
            <asp:Image ID="Image4" runat="server" Height="66px" ImageUrl="~/images/Home.jpg" Width="68px" />--%>
                     <asp:ImageButton ID="imgbtnShow" runat="server" Width="75px" Height="80px" ImageUrl="~/images/3.jpg" OnClick="imgbtnShow_Click" CssClass="socialicons"/>
                 <%--    </a>--%>
    
<%--        </p>--%>

                    </td>
                <td>&nbsp;</td>
            </tr>
            </table>
         <asp:Image ID="Image4" runat="server" ImageUrl="~/images/Blue_butterfly_2.gif" CssClass="bird1"/>
         
        <asp:Image ID="Image10" runat="server" ImageUrl="~/images/Blue_butterfly_2.gif" CssClass="bird2"/>
         <asp:Image ID="Image11" runat="server" ImageUrl="~/images/Blue_butterfly_2.gif" CssClass="bird3"/> 
        <asp:Image ID="Image12" runat="server" ImageUrl="~/images/bu.gif" CssClass="bird4"/> 

   
 </form>
</body>
</html>

    