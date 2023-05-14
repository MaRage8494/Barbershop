<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center" class="my-3">Подробная информация об услуге</h1>
    <hr>
    <#list images as img>
        <img class="img-fluid mx-auto d-block img-thumbnail" src="/images/${img.id}" style="height:400px;"/><br><br>
    </#list>
    <hr>
    <p><h1 style="text-align: center">${product.title} | ${product.price} ₽</h1></p>
    <p style="text-align: center">${product.description}</p>
    <p style="text-align: center">Номер телефона барбершопа: <b>${product.user.numberPhone}</b></p>
    <h4 style="text-align: center">Мои записи</h4>
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
        <tr style="vertical-align: middle;text-align: center;">
            <th style="vertical-align: middle">Услуга</th>
            <th style="vertical-align: middle">Барбер</th>
            <th style="vertical-align: middle">Время</th>
            <th style="vertical-align: middle">Цена</th>
            <th style="vertical-align: middle">Удаление</th>
        </tr>
        </thead>
        <tbody>
        <#list events as event>
            <#if event.username?? && user.name == event.username && event.description == product.title>
                <tr style="vertical-align: middle;text-align: center;">
                    <th>${event.description}</th>
                    <th>${event.name}</th>
                    <th>${event.time}</th>
                    <th>${event.price}₽</th>
                    <th>
                        <form action="/product/deleteEvent/${event.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" value="Удалить">
                        </form>
                    </th>
                </tr>
            </#if>
        <#else>
            <tr>
                <td colspan="5"><h3 style="text-align: center">Записей нет</h3></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <hr>
    <div class="d-block">
        <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
           data-toggle="collapse" href="#collapseExample" role="button"
           aria-expanded="true" aria-controls="collapseExample">
            Добавить новую запись
        </a>
        <div class="collapse mb-3" id="collapseExample" style="">
            <form action="/product/createEvent/" method="post" enctype="multipart/form-data">
                <input type="hidden" name="user" value="${user.id}">
                <input type="hidden" name="username" value="${user.name}">
                <input type="hidden" name="price" value="${product.price?replace(" ", "")}">
                <input type="hidden" name="description" value="${product.title}"/>
                <div class="form-group">
                    <label for="barberName">Имя барбера</label>
                    <select id="barberName" required name="name" class="form-control">
                        <option value="">Барбер не выбран</option>

                        <option value="Макс">Макс</option>
                        <option value="Элайджа">Элайджа</option>
                        <option value="Стас">Стас</option>

                    </select>
                </div>
                <div class="form-group">
                    <label for="Time">Время</label>
                    <select id="Time" required name="time" class="form-control">
                        <option value="">Время не выбрано</option>

                        <option value="12:00">12:00</option>
                        <option value="14:00">14:00</option>
                        <option value="16:00">16:00</option>
                        <option value="18:00">18:00</option>
                        <option value="20:00">20:00</option>

                    </select>
                </div>
                <div>
                    <label for="Price">Цена</label>
                    <div class="mb-3">
                        <p>${product.price}₽</p>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
            </form>
        </div>
    </div>

</@t.template>