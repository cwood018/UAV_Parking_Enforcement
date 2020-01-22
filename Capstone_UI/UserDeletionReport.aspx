<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserDeletionReport.aspx.cs" Inherits="Capstone_UI.UserDeletionReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>User Deletion Logs Report</title>
      <center style="width: 1020px"><asp:Label ID="ReportTitleLabel" runat="server" style="text-align: left; font-size: x-large;" Text="User Deletion Logs Report"></asp:Label></center>
        <br />
        <br />
        <br />
        <div style="width: 1044px">          
            <asp:Label ID="deletedLabel" runat="server" Text="Deleted User Name"></asp:Label>
            <asp:TextBox ID="deletedTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="deletorLasbel" runat="server" Text="Deletor User Name"></asp:Label>
            <asp:TextBox ID="deletorTextBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="userdeletionGridView" runat="server" Width="100%" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="deletion_id" PageSize="5" OnPageIndexChanging="userdeletionGridView_PageIndexChanging" >
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
            <asp:FormView ID="userdeletionFormView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="deletion_id" DataSourceID="SqlDataSource1" GridLines="Both" Width="100%">
                <EditItemTemplate>
                    deletion_id:
                    <asp:Label ID="deletion_idLabel1" runat="server" Text='<%# Eval("deletion_id") %>' />
                    <br />
                    deleted_user_id:
                    <asp:TextBox ID="deleted_user_idTextBox" runat="server" Text='<%# Bind("deleted_user_id") %>' />
                    <br />
                    deleted_username:
                    <asp:TextBox ID="deleted_usernameTextBox" runat="server" Text='<%# Bind("deleted_username") %>' />
                    <br />
                    deleted_first_name:
                    <asp:TextBox ID="deleted_first_nameTextBox" runat="server" Text='<%# Bind("deleted_first_name") %>' />
                    <br />
                    deleted_last_name:
                    <asp:TextBox ID="deleted_last_nameTextBox" runat="server" Text='<%# Bind("deleted_last_name") %>' />
                    <br />
                    deleted_permission_level:
                    <asp:CheckBox ID="deleted_permission_levelCheckBox" runat="server" Checked='<%# Bind("deleted_permission_level") %>' />
                    <br />
                    deletor_user_id:
                    <asp:TextBox ID="deletor_user_idTextBox" runat="server" Text='<%# Bind("deletor_user_id") %>' />
                    <br />
                    deletor_username:
                    <asp:TextBox ID="deletor_usernameTextBox" runat="server" Text='<%# Bind("deletor_username") %>' />
                    <br />
                    deletor_firstname:
                    <asp:TextBox ID="deletor_firstnameTextBox" runat="server" Text='<%# Bind("deletor_firstname") %>' />
                    <br />
                    deletor_lastname:
                    <asp:TextBox ID="deletor_lastnameTextBox" runat="server" Text='<%# Bind("deletor_lastname") %>' />
                    <br />
                    deletor_permissionlevel:
                    <asp:CheckBox ID="deletor_permissionlevelCheckBox" runat="server" Checked='<%# Bind("deletor_permissionlevel") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    deletion_id:
                    <asp:TextBox ID="deletion_idTextBox" runat="server" Text='<%# Bind("deletion_id") %>' />
                    <br />
                    deleted_user_id:
                    <asp:TextBox ID="deleted_user_idTextBox" runat="server" Text='<%# Bind("deleted_user_id") %>' />
                    <br />
                    deleted_username:
                    <asp:TextBox ID="deleted_usernameTextBox" runat="server" Text='<%# Bind("deleted_username") %>' />
                    <br />
                    deleted_first_name:
                    <asp:TextBox ID="deleted_first_nameTextBox" runat="server" Text='<%# Bind("deleted_first_name") %>' />
                    <br />
                    deleted_last_name:
                    <asp:TextBox ID="deleted_last_nameTextBox" runat="server" Text='<%# Bind("deleted_last_name") %>' />
                    <br />
                    deleted_permission_level:
                    <asp:CheckBox ID="deleted_permission_levelCheckBox" runat="server" Checked='<%# Bind("deleted_permission_level") %>' />
                    <br />
                    deletor_user_id:
                    <asp:TextBox ID="deletor_user_idTextBox" runat="server" Text='<%# Bind("deletor_user_id") %>' />
                    <br />
                    deletor_username:
                    <asp:TextBox ID="deletor_usernameTextBox" runat="server" Text='<%# Bind("deletor_username") %>' />
                    <br />
                    deletor_firstname:
                    <asp:TextBox ID="deletor_firstnameTextBox" runat="server" Text='<%# Bind("deletor_firstname") %>' />
                    <br />
                    deletor_lastname:
                    <asp:TextBox ID="deletor_lastnameTextBox" runat="server" Text='<%# Bind("deletor_lastname") %>' />
                    <br />
                    deletor_permissionlevel:
                    <asp:CheckBox ID="deletor_permissionlevelCheckBox" runat="server" Checked='<%# Bind("deletor_permissionlevel") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    deletion_id:
                    <asp:Label ID="deletion_idLabel" runat="server" Text='<%# Eval("deletion_id") %>' />
                    <br />
                    <br />
                    deleted_user_id:
                    <asp:Label ID="deleted_user_idLabel" runat="server" Text='<%# Bind("deleted_user_id") %>' />
                    <br />
                    deleted_username:
                    <asp:Label ID="deleted_usernameLabel" runat="server" Text='<%# Bind("deleted_username") %>' />
                    <br />
                    deleted_first_name:
                    <asp:Label ID="deleted_first_nameLabel" runat="server" Text='<%# Bind("deleted_first_name") %>' />
                    <br />
                    deleted_last_name:
                    <asp:Label ID="deleted_last_nameLabel" runat="server" Text='<%# Bind("deleted_last_name") %>' />
                    <br />
                    deleted_permission_level:
                    <asp:CheckBox ID="deleted_permission_levelCheckBox" runat="server" Checked='<%# Bind("deleted_permission_level") %>' Enabled="false" />
                    <br />
                    <br />
                    deletor_user_id:
                    <asp:Label ID="deletor_user_idLabel" runat="server" Text='<%# Bind("deletor_user_id") %>' />
                    <br />
                    deletor_username:
                    <asp:Label ID="deletor_usernameLabel" runat="server" Text='<%# Bind("deletor_username") %>' />
                    <br />
                    deletor_firstname:
                    <asp:Label ID="deletor_firstnameLabel" runat="server" Text='<%# Bind("deletor_firstname") %>' />
                    <br />
                    deletor_lastname:
                    <asp:Label ID="deletor_lastnameLabel" runat="server" Text='<%# Bind("deletor_lastname") %>' />
                    <br />
                    deletor_permissionlevel:
                    <asp:CheckBox ID="deletor_permissionlevelCheckBox" runat="server" Checked='<%# Bind("deletor_permissionlevel") %>' Enabled="false" />
                    <br />
                    <asp:Button ID="CloseFormBtn" runat="server" OnClick="CloseFormBtn_Click" Text="Close" />
                    <br />

                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_finalConnectionString %>" SelectCommand="SELECT * FROM [DeletionLogsView] WHERE ([deletion_id] = @deletion_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="userdeletionGridView" Name="deletion_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
