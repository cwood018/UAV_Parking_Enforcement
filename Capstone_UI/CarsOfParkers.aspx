<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CarsOfParkers.aspx.cs" Inherits="Capstone_UI.CarsOfParkers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <title>Cars of Parkers</title>
  <center><asp:Label ID="ReportTitleLabel" runat="server" style="text-align: left; font-size: x-large;" Text="Vehicles of Parkers Report"></asp:Label></center>
        <br />
        <br />
        <br />
        <div style="width: 1044px">          
            <asp:Label ID="plateLabel" runat="server" Text="Plate#"></asp:Label>
            <asp:TextBox ID="PlateTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="anumLabel" runat="server" Text="A#"></asp:Label>
            <asp:TextBox ID="anumTextBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="CarsParkersGridView" runat="server" Width="100%" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="plate_number, A_number" OnPageIndexChanging="CarsParkersGridView_PageIndexChanging" PageSize="5">
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
        <br />
        <div>
            
            <asp:FormView ID="CarsParkersFormView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Both" style="margin-bottom: 0px" Width="100%">
                <EditItemTemplate>
                    A_number:
                    <asp:TextBox ID="A_numberTextBox" runat="server" Text='<%# Bind("A_number") %>' />
                    <br />
                    first_name:
                    <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>' />
                    <br />
                    email_address:
                    <asp:TextBox ID="email_addressTextBox" runat="server" Text='<%# Bind("email_address") %>' />
                    <br />
                    last_name:
                    <asp:TextBox ID="last_nameTextBox" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    A_number:
                    <asp:TextBox ID="A_numberTextBox" runat="server" Text='<%# Bind("A_number") %>' />
                    <br />
                    first_name:
                    <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>' />
                    <br />
                    email_address:
                    <asp:TextBox ID="email_addressTextBox" runat="server" Text='<%# Bind("email_address") %>' />
                    <br />
                    last_name:
                    <asp:TextBox ID="last_nameTextBox" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    A_number:
                    <asp:Label ID="A_numberLabel" runat="server" Text='<%# Bind("A_number") %>' />
                    <br />
                    first_name:
                    <asp:Label ID="first_nameLabel" runat="server" Text='<%# Bind("first_name") %>' />
                    <br />
                    last_name:
                    <asp:Label ID="last_nameLabel" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    email_address:
                    <asp:Label ID="email_addressLabel" runat="server" Text='<%# Bind("email_address") %>' />
                    <br />

                    <asp:Button ID="CloseFormBtn" runat="server" OnClick="CloseFormBtn_Click" Text="Close" />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_finalConnectionString %>" SelectCommand="SELECT [A_number], [first_name], [email_address], [last_name] FROM [TicketsofUsersInfoView] WHERE ([plate_number] = @plate_number)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CarsParkersGridView" Name="plate_number" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            
         </div>
    </asp:Content>