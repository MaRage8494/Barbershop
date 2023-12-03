<#macro pager url products searchWord searchTown>
    <div>
        <ul class="pagination">
            <li class="page-item disabled">
                <a class="page-link" href="#">Страницы</a>
            </li>
            <#list 1..products.getTotalPages() as p>
                <#if p == 0>
                <#else>
                <#if (p-1) = products.getNumber()>
                    <li class="page-item active">
                        <a class="page-link" href="#">${p}</a>
                    </li>
                <#else>
                    <li class="page-item">
                            <a class="page-link" href="${url}?searchWord=${searchWord}&searchTown=${searchTown}&page=${p-1}&size=${products.getSize()}">${p}</a>
                        </li>
                </#if>
                </#if>
            </#list>
        </ul>

        <ul class="pagination">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Элементов на странице</a>
            </li>
            <#list [2, 3, 4] as c>
                <#if c == products.getSize()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${c}</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?searchWord=${searchWord}&searchTown=${searchTown}&page=${products.getNumber()}&size=${c}" tabindex="-1">${c}</a>
                    </li>
                </#if>
            </#list>
        </ul>
    </div>
</#macro>