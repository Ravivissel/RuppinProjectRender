<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RequiredTextField.ascx.cs" Inherits="RequiredTextField" %>
<%@ Register src="TextField.ascx" tagname="TextField" tagprefix="uc1" %>

<asp:Label ID="Key" runat="server" Text="Label"></asp:Label>
<asp:TextBox ID="Value" runat="server"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="Value" ErrorMessage="This field is required" 
    ForeColor="#FF3300"></asp:RequiredFieldValidator>


