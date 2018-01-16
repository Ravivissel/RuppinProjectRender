<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CutomerStudentDetails.ascx.cs" Inherits="CutomerStudentDetails" %>
<%@ Register src="RequiredTextField.ascx" tagname="RequiredTextField" tagprefix="uc1" %>

<p>
&nbsp;<asp:Label ID="NameCS" runat="server" Text="Label"></asp:Label>
    &nbsp;<asp:TextBox ID="NameCSSTX" runat="server" Columns="50" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NameCSSTX" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<br />
<asp:Label ID="logoImg" runat="server" Text="Label"></asp:Label>
<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
&nbsp;&nbsp;
<asp:FileUpload ID="ImgFileUpload" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ImgFileUpload" ErrorMessage="Must upload image" ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label ID="Descrp" runat="server" Text="Description:"></asp:Label>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="Description" runat="server" Columns="70" Height="100px" TextMode="MultiLine"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="Description" ErrorMessage="This field is required" 
    ForeColor="#FF3300"></asp:RequiredFieldValidator>




