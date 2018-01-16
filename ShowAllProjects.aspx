<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowAllProjects.aspx.cs" Inherits="ShowAllProjects" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function btn_Click(a) {
            window.open("renderProject.html?gid=" + a);
        } 
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="header">
            <div class="container_16">
                <div class="grid_16">
                    <div class="slider_bg pngfix">
                        <ul id="slideshow" runat="server">
                        </ul>
                        <div id="wrapper">
                            <div id="fullsize">
                                <div id="imgprev" class="imgnav pngfix"></div>
                                <div id="imglink"></div>
                                <div id="imgnext" class="imgnav pngfix"></div>
                                <div id="image"></div>
                                <div id="information">
                                    <h3></h3>
                                    <p></p>
                                </div>
                            </div>
                            <div id="thumbnails">
                                <div id="slideleft"></div>
                                <div id="slidearea">
                                    <div id="slider"></div>
                                </div>
                                <div id="slideright"></div>
                            </div>

                        </div>
                    </div>
                </div>

                <script type="text/javascript">
                    $('body_slideshow').style.display = 'none';
                    $('wrapper').style.display = 'block';
                    var slideshow = new TINY.slideshow("slideshow");
                    window.onload = function () {
                        slideshow.auto = true;
                        slideshow.speed = 5;
                        slideshow.link = "linkhover";
                        slideshow.info = "information";
                        slideshow.thumbs = "slider";
                        slideshow.left = "slideleft";
                        slideshow.right = "slideright";
                        slideshow.scrollSpeed = 4;
                        slideshow.spacing = 5;
                        slideshow.active = "#aaa";
                        slideshow.init("body_slideshow", "image", "imgprev", "imgnext", "imglink");
                    }
                </script>
                </div>
        <div class="clear">&nbsp</div>
                 <div class="container_16">
                     <h4>רוצים למיין את הפרוייקטים?</h4>
                     <br />
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label1" runat="server" Text="חפשו לפי מחלקה: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>

                            <asp:DropDownList ID="FacultyDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FacultyDL_SelectedIndexChanged">
                                <asp:ListItem>&#1489;&#1495;&#1512;</asp:ListItem>
                                <asp:ListItem Value="IE">הנדסה תעשיה וניהול</asp:ListItem>
                                <asp:ListItem Value="BA">מנהל עסקים</asp:ListItem>
                            </asp:DropDownList>

                        </asp:TableCell>                   
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label2" runat="server" Text="חפשו לפי מילות מפתח: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="searchTB" runat="server" AutoPostBack="true" OnTextChanged="searchTB_TextChanged"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                     <br />
                     <br />
                     
                     <br />
                     <br />
                <asp:Panel ID="Panel1" runat="server" CssClass="baloon">
                    באפשרותך לבצע חיפוש לפי:
                    <br />
                    <ul>
                        <li>שם פרויקט</li>
                        <li>שם סטודנט</li>
                        <li>תגיות</li>
                        <li>שם לקוח</li>
                    </ul>

                </asp:Panel>

                <asp:BalloonPopupExtender ID="BalloonPopupExtender1" runat="server"
                    TargetControlID="searchTB"
                    BalloonPopupControlID="panel1"
                    Position="BottomLeft"
                    BalloonStyle="Cloud"
                    BalloonSize="Medium"
                    CustomCssUrl="CustomStyle/BalloonPopupOvalStyle.css"
                    CustomClassName="oval"
                    UseShadow="True"
                    ScrollBars="None"
                    DisplayOnMouseOver="True"
                    DisplayOnFocus="False"
                    DisplayOnClick="false">
                </asp:BalloonPopupExtender>
                 
            </div>
        </div>
    <div class="clear">&nbsp</div>
   
 

            <div class="footer">
                <div class="container_16">
                    <div class="footer_left">
                        <p>&copy; Copyright 2009 All Rights Reserved by <a href="http://www.ruppin.ac.il/">ruppin.ac.il</a></p>
                    </div>
                    <div class="footer_right">
                        <p>Designed and Developed by Nofar, Mor & Stav</p>
                    </div>
                </div>
            </div>
</asp:Content>

