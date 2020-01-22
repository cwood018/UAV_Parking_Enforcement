<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mainPage.aspx.cs" Inherits="Capstone_UI.mainPage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <div  style="text-align:center; align-content:center;" >
    <title>Welcome!</title>
    <h1>Welcome! Please see reports related to your team!</h1>    
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
  <div  style="text-align:center; align-content:center;" >
    <asp:Image ID="MAP"  runat="server" src="/Models/Resources/map.jpg"/>
      <br />
      <asp:Button ID="Button1" runat="server" Height="54px" OnClick="Button1_Click" Text="Click Me" Width="178px" />
      <br />
</div>
</asp:Content>

