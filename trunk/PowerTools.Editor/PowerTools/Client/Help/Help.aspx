﻿<%@ Page Title="SDL Tridion PowerTools" Language="C#" MasterPageFile="../Shared/Views/PopUp.Master"
    AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="PowerTools.Editor.PowerTools.Client.Help.HelpPage" %>

<%@ Register TagPrefix="c" Namespace="Tridion.Web.UI.Controls" Assembly="Tridion.Web.UI.Core, Version=6.1.0.55920, Culture=neutral, PublicKeyToken=ddfc895746e5ee6b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TridionDependencies" runat="server">
</asp:Content>
<asp:Content ID="HelpContent" ContentPlaceHolderID="Main" runat="server">
    <%--<h1>
        Help</h1>
    <div class="tool-explanation">
        This is the help guide for the PowerTools.
    </div>
    <p>
        How To...</p>
    <h2>
        Tools</h2>
    <div>
        <asp:Xml ID="HelpXML" runat="server" DocumentSource="Help.xml" TransformSource="HelpAll.xslt"></asp:Xml>
    </div>--%>
    <h2>
        Contact Us</h2>
    <p>
        Most of the following require a valid Google <em>Account</em>. This is typically
        a @gmail.com address, but could be another Google-enabled email (e.g. Blogger).</p>
    <c:TabControl runat="server" ID="HelpTabControl" ActivePage="dpgContactUs" Class="stack horizontal">
        <c:DeckPage ID="dpgContactUs" runat="server" Label="Contact Us">
            <h3>
                Suggest Ideas or Request Functionality</h3>
            <p>
                <a href="https://groups.google.com/forum/#!forum/tridion-powertools" target="_blank">
                    Join the discussion</a> to ask questions and offer feedback.</p>
        </c:DeckPage>
        <c:DeckPage ID="dpgReportIssues" runat="server" Label="Report Issues" IsHidden="False">
            <h3>
                Report Problems</h3>
            <p>
                Review pending issues on <a href="http://code.google.com/p/tridion-2011-power-tools/issues/list"
                    target="_blank">the PowerTools Google Code issues page</a>.</p>
            <p>
                Or <a href="http://code.google.com/p/tridion-2011-power-tools/issues/entry"
                    target="_blank">submit a new issue</a> when you're ready.</p>
            <p>
                Please provide your content manager explorer version and steps to reproduce the problem to best
                help the development volunteers.</p>
        </c:DeckPage>
        <c:DeckPage ID="dpgEngageDevelopers" runat="server" Label="Participate" IsHidden="False">
            <h3>
                Engage the PowerTools Team</h3>
            <p>
                Join the "flow" at the <a href="https://powertools.flowdock.com/invitations/95cbb928d8bd132a537357de32d028f80722aa8a-main"
                    target="_blank">Flow Dock site</a> (FlowDock site active until at least May
                27, 2012).</p>
            <p>
                Account required but can be connected to your Google account.</p>
        </c:DeckPage>
    </c:TabControl>
</asp:Content>