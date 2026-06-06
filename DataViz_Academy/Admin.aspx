<%@ Page Title="Admin Control Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DataViz_Academy.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="adminView" class="app-view active-view">
        <h1>Admin Control Panel</h1>
        <p class="view-subtitle">Configure modules.</p>
        
        <%-- ACCESS VIOLATION BLOCK: Managed securely on the backend yes yes --%>
        <asp:Panel ID="pnlAdminGateLocked" runat="server" CssClass="admin-alert-gate" Visible="false">
            <h3>Access Privilege Violation</h3>
            <p style="margin-top: 8px; font-size: 0.95rem;">Please shift authorization tiers to Master Admin to pass this validator checkpoint.</p>
        </asp:Panel>
        
        <%-- AUTHORIZED UNLOCKED CONTAINER BLOCK, uhh self explainatory --%>
        <asp:Panel ID="pnlAdminGateUnlocked" runat="server" Visible="false">

            <%-- ADD NEW MODULE --%>
            <details class="card-collapsible" style="margin-bottom: 20px;">
                <summary style="cursor: pointer; font-weight: bold; font-size: 1.2rem; padding: 10px; background: #f8f9fa; border-radius: 4px;">
                    Add New Module
                </summary>
                <div class="card">
                    <h3>Add New Module</h3>
                    <div class="form-group">
                        <label>Title</label>
                        <asp:TextBox ID="txtNewTitle" runat="server" CssClass="form-control" placeholder="e.g. SQL Basics"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <asp:TextBox ID="txtNewCategory" runat="server" CssClass="form-control" placeholder="e.g. Database Systems"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <asp:TextBox ID="txtNewDesc" runat="server" CssClass="form-control" placeholder="Brief description"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Content URL</label>
                        <asp:TextBox ID="txtNewUrl" runat="server" CssClass="form-control" placeholder="https://..."></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddModule" runat="server" Text="Add Module" CssClass="btn btn-primary" OnClick="AddModule_Click" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewTitle" ErrorMessage="Title is required." ForeColor="Red" Display="Dynamic" />
                    <asp:Label ID="lblAddStatus" runat="server" Visible="false" CssClass="inline-feedback success" style="display:block; margin-top:8px;"></asp:Label>
                </div>
            </details>

            <%-- UPDATE MODULE --%>
            <details class="card-collapsible" style="margin-bottom: 20px;">
                <summary style="cursor: pointer; font-weight: bold; font-size: 1.2rem; padding: 10px; background: #f8f9fa; border-radius: 4px;">
                    Update Existing Module
                </summary>
                <div class="card">
                    <h3>Update Existing Module</h3>
                    <div class="form-group">
                        <label>Module ID to Update</label>
                        <asp:TextBox ID="txtUpdateId" runat="server" CssClass="form-control" placeholder="Enter Module ID"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>New Title</label>
                        <asp:TextBox ID="txtUpdateTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>New Category</label>
                        <asp:TextBox ID="txtUpdateCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>New Description</label>
                        <asp:TextBox ID="txtUpdateDesc" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>New Content URL</label>
                        <asp:TextBox ID="txtUpdateUrl" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnUpdateModule" runat="server" Text="Update Module" CssClass="btn btn-primary" OnClick="UpdateModule_Click" />
                    <asp:Label ID="lblUpdateStatus" runat="server" Visible="false" CssClass="inline-feedback success" style="display:block; margin-top:8px;"></asp:Label>
                </div>
            </details>

            <%-- MODULE TABLE WITH DELETE --%>
            <div class="card">
                <h3>Active Course Directory</h3>
                <div class="admin-table-container">
                    <asp:GridView ID="gvAdminCourses" runat="server" AutoGenerateColumns="False" CssClass="admin-table" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="ModuleID" HeaderText="Module ID" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="Category" HeaderText="Category" />
                            <asp:BoundField DataField="ContentURL" HeaderText="Content URL" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnDeleteCourse" runat="server" Text="Delete" CssClass="btn btn-outline"
                                        style="color:var(--danger); border-color:var(--danger); padding:4px 8px; font-size:0.8rem; margin:0; width:auto;"
                                        OnClick="DeleteCourse_Click" CommandArgument='<%# Eval("ModuleID") %>'
                                        OnClientClick="return confirm('Delete this module?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="text-align:center; padding:20px; color:var(--text-muted);">No modules found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

        </asp:Panel>
    </div>

</asp:Content>