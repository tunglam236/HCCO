<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header.ascx.cs" Inherits="Admin_control_header" %>
<header class="main-header">
   
    <nav class="navbar navbar-static-top" style="z-index: auto !important;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/home"><i class="fa fa-home"></i> CMS</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <asp:Literal ID="ulMenu" runat="server"></asp:Literal>
           
        </div>
    </nav>
    
  </header>
