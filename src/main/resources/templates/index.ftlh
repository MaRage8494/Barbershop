<#import "blocks/template.ftlh" as t>
<@t.template user>
    <#if user.email??>
        <p class="text-info mx-auto" style="font-size: 20px; text-align: center">Добро пожаловать, <b>${user.name}!</b></p>
        <hr>
    </#if>
    <h1 style="text-align: center">Наши услуги</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group" style="width: 100%">
                <label for="searchWord">Поиск по услугам</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <div class="card-deck d-flex justify-content-between flex-row">
        <#list products as product>
            <a href="/product/${product.id}" class="w-25 h-25 my-auto mx-auto">
                <div class="card text-white bg-dark my-3">
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top" style="height: 200px;overflow: hidden">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        ${product.city}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>