<#import "/spring.ftl" as spring>

    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="http://localhost:8081/">EduFood</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <#--            <li class="nav-item active">-->
                <#--                <a class="nav-link" href="http://localhost:8081/">Home <span class="sr-only">(current)</span></a>-->
                <#--            </li>-->
            </ul>
            <form class="form-inline my-2 my-lg-0 mr-2"  id="formSearch" action="/search">
                <input name="name" class="form-control mr-sm-2" type="text" placeholder="<@spring.message "button.search" />" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="buttonSearch"><@spring.message "button.search" /></button>
            </form>
            <#if  dto??>
                <button type="button" class="btn btn-outline-warning mr-2"><a href="/profile" class="link-yell"><@spring.message "button.profile" /></a></button>
                <form class="flex box-128" action="/logout" method="post">
                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                    </#if>
                    <button class="btn btn-outline-warning mr-2"><@spring.message "button.out" /></button>

                </form>
                <form class="flex box-128" action="/cart" >
                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                    </#if>
                    <button class="btn btn-outline-warning mr-2"><@spring.message "button.cart" /></button>

                </form>

            <#else>
                <button type="button" class="btn btn-outline-warning mr-2"><a href="/login" class="link-yell"><@spring.message "button.signin" /></a> </button>
                <button type="button" class="btn btn-outline-warning mr-2"><a href="/register" class="link-yell"> <@spring.message "button.signup" /></a></button>

            </#if>
            <form action="" method="get">
                <select name="lang" id="lang_select">
                    <option value=""><@spring.message "label.language" /></option>
                    <option value="en-US">English</option>
                    <option value="ru-RU">Русский</option>
                </select>
                <button type="submit">
                    <@spring.message "button.language-change.text" />
                </button>
            </form>
        </div>
    </nav>



