<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SystemAccessReport.aspx.cs" Inherits="Capstone_UI.SystemAccessReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <title>System Access Report</title>
      <center><asp:Label ID="ReportTitleLabel" runat="server" style="text-align: left; font-size: x-large;" Text="System Access Report"></asp:Label></center>
        <br />
        <br />
        <br />
        <div style="width: 1044px">          
            <asp:Label ID="usernameLabel" runat="server" Text="User Name"></asp:Label>
            <asp:TextBox ID="usernameTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="starttimeLasbel" runat="server" Text="Start Time"></asp:Label>
            <asp:TextBox ID="starttimeTextBox" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="endtimeLabel" runat="server" Text="End Time"></asp:Label>
            <asp:TextBox ID="endtimeTextBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="sysaccessGridView" runat="server" Width="100%" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="user_id" PageSize="5" OnPageIndexChanging="sysaccessGridView_PageIndexChanging" >
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

            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="user_id" DataSourceID="SqlDataSource1" GridLines="Both" Width="100%">
                <EditItemTemplate>
                    user_id:
                    <asp:Label ID="user_idLabel1" runat="server" Text='<%# Eval("user_id") %>' />
                    <br />
                    username:
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    <br />
                    first_name:
                    <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>' />
                    <br />
                    last_name:
                    <asp:TextBox ID="last_nameTextBox" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    permission_level:
                    <asp:CheckBox ID="permission_levelCheckBox" runat="server" Checked='<%# Bind("permission_level") %>' />
                    <br />
                    access_datetime:
                    <asp:TextBox ID="access_datetimeTextBox" runat="server" Text='<%# Bind("access_datetime") %>' />
                    <br />
                    access_status:
                    <asp:TextBox ID="access_statusTextBox" runat="server" Text='<%# Bind("access_status") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    user_id:
                    <asp:TextBox ID="user_idTextBox" runat="server" Text='<%# Bind("user_id") %>' />
                    <br />
                    username:
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    <br />
                    first_name:
                    <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>' />
                    <br />
                    last_name:
                    <asp:TextBox ID="last_nameTextBox" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    permission_level:
                    <asp:CheckBox ID="permission_levelCheckBox" runat="server" Checked='<%# Bind("permission_level") %>' />
                    <br />
                    access_datetime:
                    <asp:TextBox ID="access_datetimeTextBox" runat="server" Text='<%# Bind("access_datetime") %>' />
                    <br />
                    access_status:
                    <asp:TextBox ID="access_statusTextBox" runat="server" Text='<%# Bind("access_status") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    user_id:
                    <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' />
                    <br />
                    <br />
                    username:
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' />
                    <br />
                    first_name:
                    <asp:Label ID="first_nameLabel" runat="server" Text='<%# Bind("first_name") %>' />
                    <br />
                    last_name:
                    <asp:Label ID="last_nameLabel" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    permission_level:
                    <asp:CheckBox ID="permission_levelCheckBox" runat="server" Checked='<%# Bind("permission_level") %>' Enabled="false" />
                    <br />
                    <br />
                    access_datetime:
                    <asp:Label ID="access_datetimeLabel" runat="server" Text='<%# Bind("access_datetime") %>' />
                    <br />
                    access_status:
                    <asp:Label ID="access_statusLabel" runat="server" Text='<%# Bind("access_status") %>' />
                    <br />
                    <asp:Button ID="CloseFormBtn" runat="server" OnClick="CloseFormBtn_Click" Text="Close" />
                    <br />

                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_finalConnectionString %>" SelectCommand="SELECT * FROM [SystemAccessView] WHERE ([user_id] = @user_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="sysaccessGridView" Name="user_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
