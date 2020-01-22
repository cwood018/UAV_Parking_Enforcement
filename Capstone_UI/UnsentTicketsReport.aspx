<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UnsentTicketsReport.aspx.cs" Inherits="Capstone_UI.UnsentTicketsReport" %>

      
      
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <title>Unsent Ticket Report</title>
       <center><asp:Label ID="ReportTitleLabel" runat="server" style="text-align: left; font-size: x-large;" Text="Unsent Tickets Report"></asp:Label></center>
        <br />
        <br />
        <br />
        <div style="width: 1044px">          
            <asp:Label ID="ticketIDLabel" runat="server" Text="Ticket#"></asp:Label>
            <asp:TextBox ID="ticketIDTextBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="UnsentTicketsGridView" runat="server" Width="100%" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ticket_number" OnPageIndexChanging="UnsentTicketsGridView_PageIndexChanging" >
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
            
            <asp:FormView ID="UnsentTicketsFormView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Both" Width="100%">
                <EditItemTemplate>
                    ticket_number:
                    <asp:TextBox ID="ticket_numberTextBox" runat="server" Text='<%# Bind("ticket_number") %>' />
                    <br />
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
                    plate_number:
                    <asp:TextBox ID="plate_numberTextBox" runat="server" Text='<%# Bind("plate_number") %>' />
                    <br />
                    make:
                    <asp:TextBox ID="makeTextBox" runat="server" Text='<%# Bind("make") %>' />
                    <br />
                    model:
                    <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                    <br />
                    color:
                    <asp:TextBox ID="colorTextBox" runat="server" Text='<%# Bind("color") %>' />
                    <br />
                    model_year:
                    <asp:TextBox ID="model_yearTextBox" runat="server" Text='<%# Bind("model_year") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    ticket_number:
                    <asp:TextBox ID="ticket_numberTextBox" runat="server" Text='<%# Bind("ticket_number") %>' />
                    <br />
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
                    plate_number:
                    <asp:TextBox ID="plate_numberTextBox" runat="server" Text='<%# Bind("plate_number") %>' />
                    <br />
                    make:
                    <asp:TextBox ID="makeTextBox" runat="server" Text='<%# Bind("make") %>' />
                    <br />
                    model:
                    <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                    <br />
                    color:
                    <asp:TextBox ID="colorTextBox" runat="server" Text='<%# Bind("color") %>' />
                    <br />
                    model_year:
                    <asp:TextBox ID="model_yearTextBox" runat="server" Text='<%# Bind("model_year") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    ticket_number:
                    <asp:Label ID="ticket_numberLabel" runat="server" Text='<%# Bind("ticket_number") %>' />
                    <br />
                    <br />
                    A_number:
                    <asp:Label ID="A_numberLabel" runat="server" Text='<%# Bind("A_number") %>' />
                    <br />
                    first_name:
                    <asp:Label ID="first_nameLabel" runat="server" Text='<%# Bind("first_name") %>' />
                    <br />
                    email_address:
                    <asp:Label ID="email_addressLabel" runat="server" Text='<%# Bind("email_address") %>' />
                    <br />
                    last_name:
                    <asp:Label ID="last_nameLabel" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    <br />
                    plate_number:
                    <asp:Label ID="plate_numberLabel" runat="server" Text='<%# Bind("plate_number") %>' />
                    <br />
                    make:
                    <asp:Label ID="makeLabel" runat="server" Text='<%# Bind("make") %>' />
                    <br />
                    model:
                    <asp:Label ID="modelLabel" runat="server" Text='<%# Bind("model") %>' />
                    <br />
                    color:
                    <asp:Label ID="colorLabel" runat="server" Text='<%# Bind("color") %>' />
                    <br />
                    model_year:
                    <asp:Label ID="model_yearLabel" runat="server" Text='<%# Bind("model_year") %>' />
                    <br />
                    <asp:Button ID="CloseFormBtn" runat="server" OnClick="CloseFormBtn_Click" Text="Close" />
                    <br />

                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_finalConnectionString %>" SelectCommand="SELECT [ticket_number], [A_number], [first_name], [email_address], [last_name], [plate_number], [make], [model], [color], [model_year] FROM [TicketsofUsersInfoView] WHERE ([ticket_number] = @ticket_number)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="UnsentTicketsGridView" Name="ticket_number" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
                 
        </div>
   </asp:Content>

