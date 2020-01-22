<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketForm.aspx.cs" Inherits="Capstone_UI.TicketForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<title>Welcome!</title>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_credsConnectionString %>" SelectCommand="SELECT * FROM [student] WHERE ([broke_rule] = @broke_rule)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="broke_rule" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="142px" Width="848px">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="school_number" HeaderText="school_number" SortExpression="school_number" />
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="Rgstrd_car_plate_num" HeaderText="Rgstrd_car_plate_num" SortExpression="Rgstrd_car_plate_num" />
            <asp:CheckBoxField DataField="broke_rule" HeaderText="broke_rule" SortExpression="broke_rule" />
        </Columns>
    </asp:GridView>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_credsConnectionString %>" SelectCommand="SELECT [email] FROM [student] WHERE ([broke_rule] = @broke_rule)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="broke_rule" Type="Boolean" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="TO:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="dropdownLIst" runat="server"  SqlDataSourceID="SqlDataSource2" TextMode="MultiLine" DataTextField="email" DataValueField="email" Height="25px" Width="304px" DataSourceID="SqlDataSource2">
</asp:DropDownList>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <br />
    <br />
    <asp:TextBox ID="ticket_box" runat="server" Multiline="true" Height="258px"  Width="893px" TextMode="MultiLine">
Dear Student,

    You are receiving this email because a vehicle we have registered
to you has been found parking on campus grounds without a valid parking pass.
Please visit University Police to address this issue so that a 
parking pass can be issued and your balance can be paid. 

[OFFICER PLEASE FILL OUT INFORMATION BELOW]
MAKE:
MODEL:
PLATE:
DATE OF OFFENSE:

Thank you,
[ENTER OFFICER NAME HERE]
UNIVERSITY POLICE DEPARTMENT
TEXAS A&M CORPUS CHRISTI
6300 DR., CORPUS CHRISTI, TEXAS
</asp:TextBox>
    <asp:Button ID="send_email" runat="server" Text="Send" OnClick="emailing" />
</asp:Content>


