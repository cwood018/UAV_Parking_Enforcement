<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserCreationLogReports.aspx.cs" Inherits="Capstone_UI.UserCreationLogReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<title>User Creation Logs Report</title>
      <center style="width: 1020px"><asp:Label ID="ReportTitleLabel" runat="server" style="text-align: left; font-size: x-large;" Text="User Creation Logs Report"></asp:Label></center>
        <br />
        <br />
        <br />
        <div style="width: 1044px">          
            <asp:Label ID="createdLabel" runat="server" Text="Created User Name"></asp:Label>
            <asp:TextBox ID="createdTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="creatorLasbel" runat="server" Text="Creator User Name"></asp:Label>
            <asp:TextBox ID="creatorTextBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="usercreationGridView" runat="server" Width="100%" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="creation_id,created_user_id,creator_user_id" PageSize="5" OnPageIndexChanging="userdeletionGridView_PageIndexChanging" >
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
        </div>
        <div>

            <asp:FormView ID="CreationLogsFormView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="creation_id" DataSourceID="SqlDataSource1" GridLines="Both" Width="100%">
                <EditItemTemplate>
                    creation_id:
                    <asp:Label ID="creation_idLabel1" runat="server" Text='<%# Eval("creation_id") %>' />
                    <br />
                    created_user_id:
                    <asp:TextBox ID="created_user_idTextBox" runat="server" Text='<%# Bind("created_user_id") %>' />
                    <br />
                    created_username:
                    <asp:TextBox ID="created_usernameTextBox" runat="server" Text='<%# Bind("created_username") %>' />
                    <br />
                    created_firstname:
                    <asp:TextBox ID="created_firstnameTextBox" runat="server" Text='<%# Bind("created_firstname") %>' />
                    <br />
                    created_lastname:
                    <asp:TextBox ID="created_lastnameTextBox" runat="server" Text='<%# Bind("created_lastname") %>' />
                    <br />
                    created_permissionlevel:
                    <asp:CheckBox ID="created_permissionlevelCheckBox" runat="server" Checked='<%# Bind("created_permissionlevel") %>' />
                    <br />
                    creator_user_id:
                    <asp:TextBox ID="creator_user_idTextBox" runat="server" Text='<%# Bind("creator_user_id") %>' />
                    <br />
                    creator_username:
                    <asp:TextBox ID="creator_usernameTextBox" runat="server" Text='<%# Bind("creator_username") %>' />
                    <br />
                    creator_firstname:
                    <asp:TextBox ID="creator_firstnameTextBox" runat="server" Text='<%# Bind("creator_firstname") %>' />
                    <br />
                    creator_lastname:
                    <asp:TextBox ID="creator_lastnameTextBox" runat="server" Text='<%# Bind("creator_lastname") %>' />
                    <br />
                    creator_permissionlevel:
                    <asp:CheckBox ID="creator_permissionlevelCheckBox" runat="server" Checked='<%# Bind("creator_permissionlevel") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    creation_id:
                    <asp:TextBox ID="creation_idTextBox" runat="server" Text='<%# Bind("creation_id") %>' />
                    <br />
                    created_user_id:
                    <asp:TextBox ID="created_user_idTextBox" runat="server" Text='<%# Bind("created_user_id") %>' />
                    <br />
                    created_username:
                    <asp:TextBox ID="created_usernameTextBox" runat="server" Text='<%# Bind("created_username") %>' />
                    <br />
                    created_firstname:
                    <asp:TextBox ID="created_firstnameTextBox" runat="server" Text='<%# Bind("created_firstname") %>' />
                    <br />
                    created_lastname:
                    <asp:TextBox ID="created_lastnameTextBox" runat="server" Text='<%# Bind("created_lastname") %>' />
                    <br />
                    created_permissionlevel:
                    <asp:CheckBox ID="created_permissionlevelCheckBox" runat="server" Checked='<%# Bind("created_permissionlevel") %>' />
                    <br />
                    creator_user_id:
                    <asp:TextBox ID="creator_user_idTextBox" runat="server" Text='<%# Bind("creator_user_id") %>' />
                    <br />
                    creator_username:
                    <asp:TextBox ID="creator_usernameTextBox" runat="server" Text='<%# Bind("creator_username") %>' />
                    <br />
                    creator_firstname:
                    <asp:TextBox ID="creator_firstnameTextBox" runat="server" Text='<%# Bind("creator_firstname") %>' />
                    <br />
                    creator_lastname:
                    <asp:TextBox ID="creator_lastnameTextBox" runat="server" Text='<%# Bind("creator_lastname") %>' />
                    <br />
                    creator_permissionlevel:
                    <asp:CheckBox ID="creator_permissionlevelCheckBox" runat="server" Checked='<%# Bind("creator_permissionlevel") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    creation_id:
                    <asp:Label ID="creation_idLabel" runat="server" Text='<%# Eval("creation_id") %>' />
                    <br />
                    <br />
                    created_user_id:
                    <asp:Label ID="created_user_idLabel" runat="server" Text='<%# Bind("created_user_id") %>'></asp:Label>
                    <br />
                    created_username:
                    <asp:Label ID="created_usernameLabel" runat="server" Text='<%# Bind("created_username") %>' />
                    <br />
                    created_firstname:
                    <asp:Label ID="created_firstnameLabel" runat="server" Text='<%# Bind("created_firstname") %>' />
                    <br />
                    created_lastname:
                    <asp:Label ID="created_lastnameLabel" runat="server" Text='<%# Bind("created_lastname") %>' />
                    <br />
                    created_permissionlevel:
                    <asp:CheckBox ID="created_permissionlevelCheckBox" runat="server" Checked='<%# Bind("created_permissionlevel") %>' Enabled="false" />
                    <br />
                    <br />
                    creator_user_id:
                    <asp:Label ID="creator_user_idLabel" runat="server" Text='<%# Bind("creator_user_id") %>' />
                    <br />
                    creator_username:
                    <asp:Label ID="creator_usernameLabel" runat="server" Text='<%# Bind("creator_username") %>' />
                    <br />
                    creator_firstname:
                    <asp:Label ID="creator_firstnameLabel" runat="server" Text='<%# Bind("creator_firstname") %>' />
                    <br />
                    creator_lastname:
                    <asp:Label ID="creator_lastnameLabel" runat="server" Text='<%# Bind("creator_lastname") %>' />
                    <br />
                    creator_permissionlevel:
                    <asp:CheckBox ID="creator_permissionlevelCheckBox" runat="server" Checked='<%# Bind("creator_permissionlevel") %>' Enabled="false" />
                    <br />
                    <asp:Button ID="CloseFormBtn" runat="server" OnClick="CloseFormBtn_Click" Text="Close" />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_finalConnectionString %>" SelectCommand="SELECT * FROM [CreationLogsView] WHERE ([creation_id] = @creation_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="usercreationGridView" Name="creation_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
