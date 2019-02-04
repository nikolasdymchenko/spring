<#import "parts/common.ftl" as c>

<@c.page>
<p class="font-weight-bold">User editor</p>
    <form action="/user" method="post">
        <div class="form-group row">
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" value="${user.username}">
            </div>
        </div>
        <#list roles as role>
            <div class="form-check">
                <label class="col-sm-2 col-form-label"><input type="checkbox" class="form-check-input position-static mr-1" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value=${user.id} name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
<button type="submit" class="btn btn-primary mt-3">Save</button>
    </form>
</@c.page>

