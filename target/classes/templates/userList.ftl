<#import "parts/common.ftl" as c>

<@c.page>
<b>List of users</b>
<table class="list-group">
    <thead>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <ul class="list-group">
            <li class="list-group-item active"><td>${user.username}</td></li>

                <#list user.roles as role>
            <li class="list-group-item active"> ${role}<#sep>,</li>
                </#list>

        <li class="list-group-item active"><td><a href="/user/${user.id}">Edit user</a> </td></li>
        </ul>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>