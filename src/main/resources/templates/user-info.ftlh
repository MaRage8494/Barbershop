<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Личный кабинет пользователя ${user.name}</h1>
    <hr>
    <br>
    <div style="text-align: center">
        Электоронная почта: <b>${user.email}</b>
        <br>
        Номер телефона: <b>${user.numberPhone}</b>
        <br>
        <br>
        <h4 style="text-align: center">Записи</h4>
        <#list events as event>
            <div style="display: flex;justify-content: center;flex-wrap: wrap;flex-direction: row;">
                <#if event.username??>
                    <#if event.username == user.name>
                        <p class="mx-3">
                            <b class="mx-3">${event.description} </b> <p class="mx-3">${event.name}</p> <p class="mx-3">${event.price}₽</p> <p class="mx-3">${event.time}</p>
                        </p>
                        <form action="/product/deleteEvent/${event.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" value="Удалить">
                        </form>
                    </#if>
                </#if>
            </div>
        <#else>
            <h3>Записей нет</h3>
        </#list>
</@t.template>