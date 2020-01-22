<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Capstone_UI.WebForm1"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign in</title>

    </head>
<body dir="ltr" class="body">
    <form id="form1" runat="server">
       <div id="fullPage">
        <div id="brandingWrapper" class="float">
            <div id="branding"></div>
        </div>
        <div id="contentWrapper" class="float">
            <div id="content">
                <div id="header">
                    <img class="logoImage" id="companyLogo" src="/Models/Resources/logo.png" alt="TAMUCC" />
                </div>
                <div id="workArea">

                    <div id="authArea" class="groupMargin">



                        <div id="loginArea">
                            <div id="loginMessage" class="groupMargin">
                                Sign in with your organizational account<br />
                            </div>
                            <asp:Label ID="Label1" runat="server" Text="Label1" Visible="False" ForeColor="Red"></asp:Label>
                            <span id="errorText" for="">
                            <br />
                            </span>

                            </div>

                                <div id="formsAuthenticationArea">
                                    <div id="userNameArea">
                                        <label id="userNameInputLabel" for="userNameInput" class="hidden">User Account:</label>
                                        <asp:Textbox id="userNameInput" runat="server" name="UserName" value="" tabindex="1" class="text fullWidth"
                                                placeholder="IslandID"></asp:Textbox>
                                    </div>

                                    <div id="passwordArea">
                                        <label id="passwordInputLabel" for="passwordInput" class="hidden">Password:&nbsp;&nbsp;&nbsp;&nbsp; </label>&nbsp;
                                        <asp:Textbox id="passwordInput" runat="server" name="Password" type="password" tabindex="2" class="text fullWidth"
                                               placeholder="Password" autocomplete="off" ></asp:Textbox>
                                    </div>
                                    <div id="kmsiArea" style="display:none">
                                        <input type="checkbox" name="Kmsi" id="kmsiInput" value="true" tabindex="3" />
                                        <label for="kmsiInput">Keep me signed in</label>
                                    </div>
                                    <div id="submissionArea" class="submitMargin">
                                        <asp:button id="submitButton" runat="server"  OnClick="Button1_Click" tabindex="4" Text="Sign In" />
                                    </div>
                                </div>
                                <input id="optionForms" type="hidden" name="AuthMethod" value="FormsAuthentication" />

                            <div id="authOptions">
                               
                            </div>

                            <div id="introduction" class="groupMargin">
                                For login issues, visit <A href='https://myislandid.tamucc.edu' target='_blank'>myislandid.tamucc.edu</A><br>
                                
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:capstone_credsConnectionString %>" SelectCommand="SELECT * FROM [Credentials]"></asp:SqlDataSource>
                               
                                <br><ul><li>You are accessing a Texas A&M University - Corpus Christi (&quot;TAMUCC&quot;) information system.</li><li>Unauthorized use is prohibited;</li><li>Usage may be subject to security testing and monitoring;</li><li>Misuse is subject to criminal prosecution; and</li><li>Users have no expectation of privacy except as otherwise provided by applicable privacy laws.</li></ul>
                            </div>

    </form>

</form>
     <form id="options" method="post" action="https://sts.tamucc.edu:443/adfs/ls/?wa=wsignin1.0&wtrealm=https://login.tamucc.edu/cas/login&client-request-id=d4384648-e4a2-45b8-bc69-00800000002c&pullStatus=0">
                                  
                                    <input id="optionSelection" type="hidden" name="AuthMethod" />
                                    <div id='authOptionLinks' class='groupMargin'></div>
                                </form>
</body>
</html>
