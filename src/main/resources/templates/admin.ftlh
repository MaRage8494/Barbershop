<#import "blocks/template.ftlh" as t>
<@t.template user>
<h2>Панель Администратора</h2>
<table class="table table-bordered table-hover">
    <thead class="thead-dark">
        <tr style="vertical-align: middle;text-align: center;">
            <th style="vertical-align: middle";>Email</th>
            <th style="vertical-align: middle">Номер телефона</th>
            <th style="vertical-align: middle">Активность</th>
            <th style="vertical-align: middle">Роли</th>
            <th style="vertical-align: middle">Бан</th>
            <th style="vertical-align: middle">Редактирование</th>
            <th style="vertical-align: middle">Подробная информация</th>
        </tr>
    <thead class="thead-dark">
    <tbody>
    <#list users as user>
        <tr style="vertical-align: middle;text-align: center;">
            <th>${user.email}</th>
            <th>${user.numberPhone}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
            <th><a href="/user/${user.id}">Подробная информация</a></th>
        </tr>
        <#else>
        <h3>Пользователей нет</h3>
    </#list>
    </tbody>
</table><br>
    <hr>
    <h2>Все записи</h2>
<table class="table table-bordered table-hover">
    <thead class="thead-dark">
    <tr style="vertical-align: middle;text-align: center;">
        <th style="vertical-align: middle">Услуга</th>
        <th style="vertical-align: middle">Имя</th>
        <th style="vertical-align: middle">Номер телефона</th>
        <th style="vertical-align: middle">Барбер</th>
        <th style="vertical-align: middle">Время</th>
        <th style="vertical-align: middle">Цена</th>
        <th style="vertical-align: middle">Удаление</th>
    </tr>
    </thead>
    <tbody>
    <#list events as event>
        <tr style="vertical-align: middle;text-align: center;">
            <th>${event.description}</th>
            <th>${event.username}</th>
            <th>${event.user.numberPhone}</th>
            <th>${event.name}</th>
            <th>${event.time}</th>
            <th>${event.price}₽</th>
            <th>
                <form action="/product/deleteEventAdmin/${event.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Удалить">
                </form>
            </th>
        </tr>
    <#else>
        <tr>
            <td colspan="7"><h3 style="text-align: center">Записей нет</h3></td>
        </tr>
    </#list>
    </tbody>
</table><br>
    <hr>
    <h2>Все услуги</h2>
<table class="table table-bordered table-hover">
    <thead class="thead-dark">
    <tr style="vertical-align: middle;text-align: center;">
        <th style="vertical-align: middle">Услуга</th>
        <th style="vertical-align: middle">Цена</th>
        <th style="vertical-align: middle">Город</th>
        <th style="vertical-align: middle">Страница услуги</th>
        <th style="vertical-align: middle">Удаление</th>
    </tr>
    </thead>
    <tbody>
    <#list products as product>
        <tr style="vertical-align: middle;text-align: center;">
            <th>${product.title}</th>
            <th>${product.price}₽</th>
            <th>${product.city}</th>
            <th><a href="/product/${product.id}">Страница</a></th>
            <th>
                <form action="/product/delete/${product.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Удалить">
                </form>
            </th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
    </tbody>
</table><br>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample2" role="button"
       aria-expanded="true" aria-controls="collapseExample2">
        Добавить новую услугу
    </a>
    <div class="collapse mb-3" id="collapseExample2" style="">
    <form action="/admin/create" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="productName">Название услуги</label>
            <input type="text" required class="form-control"
                   id="productName" name="title">
        </div>
        <div class="form-group">
            <label for="price">Цена</label>
            <div class="input-group mb-3">
                <input type="number" required class="form-control" id="price" name="price">
                <div class="input-group-append">
                    <span class="input-group-text">₽</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="searchCity">Город</label>
            <select id="searchCity" required name="city" class="form-control">
                <option value="">Город не выбран</option>

                <option value="Москва">Москва</option>
            </select>
        </div>
        <div class="form-group">
            <label for="description">Описание товара</label>
            <textarea required class="form-control" id="description" name="description"></textarea>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input required type="file" name="file" id="file">
                <label class="custom-file-label" for="file">Фотография</label>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
    </form>
</@t.template>