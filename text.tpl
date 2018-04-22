
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /text.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <div class="products_table_container container">
        <div class="products_table_top">
            <h1 class="selected_filters_left">
                <{$module.name|htmlspecialchars}>
            </h1>
        </div>    
    </div>

    <div class="article_details text container">
        <div class="out-ext-info">
            <{$module.text}>
        </div>
    </div>

<{/block}>
