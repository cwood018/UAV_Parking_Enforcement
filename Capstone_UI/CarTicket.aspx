﻿<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CarTicket.aspx.cs" Inherits="Capstone_UI.CarTicket" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <title>Car Tickets</title>
          <center><asp:Label ID="ReportTitleLabel" runat="server" style="text-align: left; font-size: x-large;" Text="Tickets of Cars Report"></asp:Label></center>
        <br />
        <br />
        <br />
        <div style="width: 1044px">          
            <asp:Label ID="plateLabel" runat="server" Text="Plate#"></asp:Label>
            <asp:TextBox ID="plateTextBox" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="startTimeLabel" runat="server" Text="Start Time"></asp:Label>
            <asp:TextBox ID="startTimeTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="endTimeLabel" runat="server" Text="End Time"></asp:Label>
            <asp:TextBox ID="endTimeTextBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchBtn_Click" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="TicketsOfCarsGridView" runat="server" Width="100%" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ticket_number,plate_number" OnPageIndexChanging="TicketsOfCarsGridView_PageIndexChanging" PageSize="5" >
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

            <asp:FormView ID="FormView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Both" Width="100%">
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
                    s3_image_location:
                    <asp:TextBox ID="s3_image_locationTextBox" runat="server" Text='<%# Bind("s3_image_location") %>' />
                    <br />
                    ticket_datetime:
                    <asp:TextBox ID="ticket_datetimeTextBox" runat="server" Text='<%# Bind("ticket_datetime") %>' />
                    <br />
                    sent:
                    <asp:CheckBox ID="sentCheckBox" runat="server" Checked='<%# Bind("sent") %>' />
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
                    s3_image_location:
                    <asp:TextBox ID="s3_image_locationTextBox" runat="server" Text='<%# Bind("s3_image_location") %>' />
                    <br />
                    ticket_datetime:
                    <asp:TextBox ID="ticket_datetimeTextBox" runat="server" Text='<%# Bind("ticket_datetime") %>' />
                    <br />
                    sent:
                    <asp:CheckBox ID="sentCheckBox" runat="server" Checked='<%# Bind("sent") %>' />
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
                    email_address:
                    <asp:Label ID="email_addressLabel" runat="server" Text='<%# Bind("email_address") %>' />
                    <br />
                    last_name:
                    <asp:Label ID="last_nameLabel" runat="server" Text='<%# Bind("last_name") %>' />
                    <br />
                    <br />
                    s3_image_location:
                    <asp:Label ID="s3_image_locationLabel" runat="server" Text='<%# Bind("s3_image_location") %>' />
                    <br />
                    ticket_datetime:
                    <asp:Label ID="ticket_datetimeLabel" runat="server" Text='<%# Bind("ticket_datetime") %>' />
                    <br />
                    sent:
                    <asp:CheckBox ID="sentCheckBox" runat="server" Checked='<%# Bind("sent") %>' Enabled="false" />
                    <br />

                    <asp:Button ID="CloseFormBtn" runat="server" OnClick="Button1_Click" Text="Close" />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_finalConnectionString %>" SelectCommand="SELECT [A_number], [first_name], [email_address], [last_name], [s3_image_location], [ticket_datetime], [sent] FROM [TicketsofUsersInfoView] WHERE ([ticket_number] = @ticket_number)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TicketsOfCarsGridView" Name="ticket_number" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

       
        </div>
  </asp:Content>