
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /articles.tpl
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
    <div class="articles_desc container">
        <div class="out-ext-info">
            <{$module.text}>
        </div>
    </div>
    <div class="articles_container container">
        <{foreach $articles as $article}>
            <div class="article_details article_details_news short">
                <div class="portfolio-item post-photo" style="background-image: url('<{if $article.cover}><{$article.cover.photo_file_small}><{/if}>');">
                    <div class="overlay sweep-to-right">
                        <a class="read_more_news" href="<{$article.relative_url}>">
                        </a>
                        <p class="post-tag truncate">
                            <p class="desc_short_news">
                                <{$article.intro}>
                            </p>
                        </p>
                        <div class="truncate post-content">
                            <h3>    
                                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                    <{$article.short_name|htmlspecialchars}>
                                </a>
                            </h3>    
                        </div>
                    </div>

                </div>    
            </div>
        <{/foreach}>
    </div>

    <div class="pages_selector pages_selector2 container">
        <{include 'misc/pagination.tpl'}>
    </div>

<{/block}>
