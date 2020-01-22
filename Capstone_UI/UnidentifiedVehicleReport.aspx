<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UnidentifiedVehicleReport.aspx.cs" Inherits="Capstone_UI.UnidentifiedVehicleReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <title>Unidentified Vehicle Report</title>
        <center><asp:Label ID="ReportTitleLabel" runat="server" style="text-align: left; font-size: x-large;" Text="Tickets of Unidentified Vehicles Report"></asp:Label></center>
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
            <asp:GridView ID="UnidentifiedGridView" runat="server" Width="100%" ShowHeaderWhenEmpty="True" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="unidentified_vehicle_id" OnPageIndexChanging="UnidentifiedGridView_PageIndexChanging" PageSize="5" >
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
            
            <asp:FormView ID="UnidentifiedFormView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="unidentified_vehicle_id" DataSourceID="SqlDataSource1" GridLines="Both" Width="100%">
                <EditItemTemplate>
                    unidentified_vehicle_id:
                    <asp:Label ID="unidentified_vehicle_idLabel1" runat="server" Text='<%# Eval("unidentified_vehicle_id") %>' />
                    <br />
                    supposed_plate_number:
                    <asp:TextBox ID="supposed_plate_numberTextBox" runat="server" Text='<%# Bind("supposed_plate_number") %>' />
                    <br />
                    s3_image_location:
                    <asp:TextBox ID="s3_image_locationTextBox" runat="server" Text='<%# Bind("s3_image_location") %>' />
                    <br />
                    unidentified_vehicle_datetime:
                    <asp:TextBox ID="unidentified_vehicle_datetimeTextBox" runat="server" Text='<%# Bind("unidentified_vehicle_datetime") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    supposed_plate_number:
                    <asp:TextBox ID="supposed_plate_numberTextBox" runat="server" Text='<%# Bind("supposed_plate_number") %>' />
                    <br />
                    s3_image_location:
                    <asp:TextBox ID="s3_image_locationTextBox" runat="server" Text='<%# Bind("s3_image_location") %>' />
                    <br />
                    unidentified_vehicle_datetime:
                    <asp:TextBox ID="unidentified_vehicle_datetimeTextBox" runat="server" Text='<%# Bind("unidentified_vehicle_datetime") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    unidentified_vehicle_id:
                    <asp:Label ID="unidentified_vehicle_idLabel" runat="server" Text='<%# Eval("unidentified_vehicle_id") %>' />
                    <br />
                    supposed_plate_number:
                    <asp:Label ID="supposed_plate_numberLabel" runat="server" Text='<%# Bind("supposed_plate_number") %>' />
                    <br />
                    s3_image_location:
                    <asp:Label ID="s3_image_locationLabel" runat="server" Text='<%# Bind("s3_image_location") %>' />
                    <br />
                    unidentified_vehicle_datetime:
                    <asp:Label ID="unidentified_vehicle_datetimeLabel" runat="server" Text='<%# Bind("unidentified_vehicle_datetime") %>' />
                    <br />

                    <asp:Button ID="CloseFormBtn" runat="server" OnClick="CloseFormBtn_Click" Text="Close" />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_finalConnectionString %>" SelectCommand="SELECT * FROM [Unidentified_Vehicle] WHERE ([unidentified_vehicle_id] = @unidentified_vehicle_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="UnidentifiedGridView" Name="unidentified_vehicle_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
               
        </div>
   </asp:Content>
