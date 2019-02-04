<#import "parts/common.ftl" as c>

<@c.page>
<p class="font-weight-bold">List of users</p>

<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>
            <#list user.roles as role>
            ${role}<#sep>,
        </#list>
        </td>
        <td><a href="/user/${user.id}">Edit user</a></td>
    </tr>
    </#list>
    </tbody>
</table>

</@c.page>