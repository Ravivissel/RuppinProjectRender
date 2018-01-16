<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="showProject.aspx.cs" Inherits="showProject" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%--<%@ Register src="controls/screenShot.ascx" tagname="screenShot" tagprefix="uc1" %>--%>



<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" media="all" href="css/960.css" />
    <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
    <!-- Start menu css and js files here -->
    <link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/hoverIntent.js"></script>
    <script type="text/javascript" src="js/superfish.js"></script>
    <script type="text/javascript">jQuery(function () { jQuery('ul.sf-menu').superfish(); });</script>

    <!-- End menu css and js files here -->
    <!-- Begin featured slider css & js files -->
    <link rel="stylesheet" type="text/css" media="all" href="css/featuredslider.css" />
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="sliderengine2/jquery.js"></script><script type="text/javascript" src="sliderengine2/jquery.hislider.js"></script>

    <!-- End featured slider css & js files -->
    <!--[if IE 6]>
<script type='text/javascript' src='js/dd_belated_png.js'></script>
<script>DD_belatedPNG.fix('.pngfix');</script>
<![endif]-->

    <div class="clear">&nbsp;</div>
    
     
        <br />
        <div class="container_16">
            <div class="grid_5">
      <div class="box-content">
                    <h2>&#1508;&#1512;&#1496;&#1497; &#1500;&#1511;&#1493;&#1495;:</h2>
                    <br />
                    <p>
                        <asp:Label ID="Label8" runat="server" ForeColor="#006600" Text="&#1513;&#1501;: "></asp:Label>
                        &nbsp <asp:Label ID="CustomerName" runat="server"></asp:Label>
                        <br />
                        
                        <asp:Label ID="Label11" runat="server" ForeColor="#006600" Text="&#1514;&#1497;&#1488;&#1493;&#1512; &#1511;&#1510;&#1512;: "></asp:Label>
                        &nbsp 
                        <asp:Label ID="CustomershortDescription" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label12" runat="server"  ForeColor="#006600" Text="&#1489;&#1506;&#1500;&#1497; &#1506;&#1504;&#1497;&#1497;&#1503;: "></asp:Label>
                        &nbsp <asp:Label ID="CustomerStakeHolders" runat="server"></asp:Label><br />

                        <asp:Label ID="Label10" runat="server"  ForeColor="#006600" Text="&#1502;&#1513;&#1514;&#1502;&#1513;&#1497; &#1492;&#1502;&#1506;&#1512;&#1499;&#1514;: "></asp:Label>
                        &nbsp <asp:Label ID="CustomerUsers" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="CustomerLogoImg" runat="server"></asp:Label>
                        <br />
                        <br />
                        
                        <br /> <br />
                        <br />
                        
                       
                    </p>
          <div class="grid_18">
          
               <p>
                                
                        <asp:Label ID="Label17" runat="server"  ForeColor="#006600" Text="&#1514;&#1502;&#1493;&#1504;&#1514; &#1500;&#1493;&#1490;&#1493; &#1492;&#1508;&#1512;&#1493;&#1497;&#1511;&#1496;: "></asp:Label>
                        <br />
                  
     <asp:Label ID="ProLogoImg" runat="server"></asp:Label>


                        <br /><br />  <br />   <br />   <br />   <br />  <br />   
                                <asp:LinkButton ID="ProLandPage" runat="server"></asp:LinkButton>
                          
                            </p>
              </div>
           </div>
            </div>
              
            </div>
            <div class="grid_11 sepline">
                <div class="box-content">
                    <h2>&#1511;&#1510;&#1514; &#1506;&#1500;&#1497;&#1504;&#1493;...</h2>
                    <br />
                    <p>
                        <asp:PlaceHolder ID="GroupZone" runat="server">
                            <asp:Label ID="Label13" runat="server" ForeColor="#006600" Text="&#1502;&#1505;&#1508;&#1512; &#1510;&#1493;&#1493;&#1514;: "></asp:Label>
                            <asp:Label ID="GroupNum" runat="server"></asp:Label><br />
                            <asp:Label ID="Label6" runat="server" ForeColor="#006600" Text="&#1508;&#1511;&#1493;&#1500;&#1496;&#1492;: "></asp:Label>
                            <asp:Label ID="Faculty" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="Label7" runat="server" ForeColor="#006600" Text="&#1513;&#1504;&#1492;: "></asp:Label>
                            <asp:Label ID="Year" runat="server"></asp:Label><br />
                         
                        </asp:PlaceHolder>
                    </p>
                    <br />

                    </div>
                </div>
            </div>
            <br />
            <div class="container_16">
  <div class="box-content">
      <div class="grid_17">
                <br /><br /><br /><br />
                    <h2>&#1506;&#1500; &#1492;&#1508;&#1512;&#1493;&#1497;&#1511;&#1496;:</h2>
                    <br />
                <p>
                        <asp:Label ID="Label2" runat="server" ForeColor="#006600" Text=" &#1513;&#1501; &#1508;&#1512;&#1493;&#1497;&#1511;&#1496;: "></asp:Label>
                        <asp:Label ID="ProjectName" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" ForeColor="#006600" Text="&#1505;&#1493;&#1490; &#1508;&#1512;&#1493;&#1497;&#1511;&#1496;: "></asp:Label>
                        <asp:Label ID="ProjectType" runat="server"></asp:Label><br />
                        <asp:Label ID="Label4" runat="server" ForeColor="#006600" Text="&#1514;&#1490;&#1497;&#1493;&#1514;: "></asp:Label>
                        <asp:Label ID="Tags" runat="server"></asp:Label><br />
                   </p> <br />
                    <asp:Table runat="server">
                        <asp:TableRow>
                                                
                            <asp:TableCell>
                            <p><t></t>
                                <asp:Label ID="Label18" runat="server" Font-Bold="true" ForeColor="#000099" Text="&#1505;&#1512;&#1496; &#1492;&#1508;&#1512;&#1493;&#1497;&#1511;&#1496;" ></asp:Label>
                                <br />
                                <asp:LinkButton ID="ProMovLink" runat="server"></asp:LinkButton></p> 
                            </asp:TableCell>
                       
                        </asp:TableRow>
                    </asp:Table>
                
                    </div>
                </div> 
    </div>
        <div class="container_16">
            <div class="box-content">
                <br /><br />
                    <ul class="list"><li>
                    <p><b>&#1514;&#1497;&#1488;&#1493;&#1512; &#1511;&#1510;&#1512; &#1513;&#1500; &#1492;&#1502;&#1506;&#1512;&#1499;&#1514;:</b>
                    <br /><br />
                    
                        <asp:Label ID="ProShortDes" runat="server"></asp:Label></p></li></ul>
                    <br />
                    <ul class="list">
                        <li>
                            <p><b>&#1502;&#1496;&#1512;&#1493;&#1514; &#1492;&#1508;&#1512;&#1493;&#1497;&#1511;&#1496;: </b></p>
                        </li>
                    </ul>
                    <br />
                    <asp:PlaceHolder ID="GoalsZone" runat="server"></asp:PlaceHolder>
                <br /> <br />
                    <ul class="list"><li>
                    <p>
                        <b>
                            <asp:Label ID="Label20" runat="server" Font-Bold="true" ForeColor="#000099" Text="&#1502;&#1504;&#1495;&#1497; &#1492;&#1508;&#1512;&#1493;&#1497;&#1511;&#1496;: "></asp:Label>
                        </b><br /><br />
                        <asp:Label ID="advisores" runat="server"></asp:Label>
                    </p></li></ul>

                    <br />
                    <ul class="list">
                        <li>
                            <p>
                                <b>
                                    <asp:Label ID="Label16" runat="server" Font-Bold="true" ForeColor="#000099" Text="&#1502;&#1493;&#1491;&#1493;&#1500;&#1497; &#1492;&#1502;&#1506;&#1512;&#1499;&#1514;: "></asp:Label>
                                    <br />
                                </b>
                            </p>
                        </li>
                         
                        
                        </ul>
                    <br />
                    <asp:PlaceHolder ID="ModulesZone" runat="server"></asp:PlaceHolder>
                <br /> <br />
                    <ul class="list">
                        <li>
                            <p><b>
                                &#1510;&#1497;&#1500;&#1493;&#1501; &#1502;&#1505;&#1499;&#1497; &#1492;&#1502;&#1506;&#1512;&#1499;&#1514;: </b></p>
                        </li>

                    </ul>
                        <asp:PlaceHolder ID="ScreenshotZone" runat="server"></asp:PlaceHolder>
        
     

                   <br /><br />
                       <ul class="list">
                        <li>
                            <p>
                                <b>
                                    <asp:Label ID="Label22" runat="server" Font-Bold="true" ForeColor="#000099" Text="&#1496;&#1499;&#1504;&#1493;&#1500;&#1493;&#1490;&#1497;&#1493;&#1514;: "></asp:Label>
                                    <br /><br />
                                </b>
                                <asp:Label ID="technologies" runat="server" Text="Label"></asp:Label>
                            </p>
                        </li>
                    </ul>
                    <br />
                    <ul class="list">
                        <li>
                            <p>
                                <b>
                                    <asp:Label ID="Label24" runat="server" Font-Bold="true" ForeColor="#000099" Text="&#1488;&#1514;&#1490;&#1512;&#1497;&#1501;:  "></asp:Label>
                                    <br /><br />
                                </b>
                                <asp:Label ID="chalenges" runat="server" Text="Label"></asp:Label>
                            </p>
                        </li>
                    </ul>
                <br />
                    <ul class="list">
                        <li>
                            <p>
                                <b>
                                    <asp:Label ID="Label23" runat="server" Font-Bold="true" ForeColor="#000099" Text="&#1492;&#1506;&#1512;&#1493;&#1514;: "></asp:Label>
                                    <br /><br />
                                </b>
                                <asp:Label ID="personalNotes" runat="server" Text="Label"></asp:Label>
                            </p>
                        </li>
                    </ul>
             

           
                </div>
 
  </div>

        <div class="clear">&nbsp</div>
  
        <div class="footer">
            <div class="container_16">
                <div class="footer_left">
                 <p> &copy; Copyright 2009 All Rights Reserved by <a href="http://www.ruppin.ac.il/">ruppin.ac.il</a></p> 
                </div>
                <div class="footer_right">
                    <p>Designed and Developed by Nofar, Mor & Stav</p>
                </div>
            </div>
        </div>
</asp:Content>

