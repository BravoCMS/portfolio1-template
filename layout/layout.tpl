
<{extends 'layout/html.tpl'}>

<{block name=title}>

<{/block}>

<{block name=favicon}>
    <link rel="shortcut icon" href="<{file 'assets/favicon.ico'}>" />
<{/block}>

<{block name="head"}>
    <{custom_code "head_open"}>

    <{strip}>
        <script type="text/javascript">
            var t = {
                _codes: <{t cat="js" json}>,
                _get_suffix: function (count) {
                    if (count == 1) {
                        return "-1";
                    } else if (count % 10 == 1 && count > 20 && count % 100 != 11) {
                        return "-mod1n11";
                    } else if (count % 10 > 1 && count % 10 < 5 && count % 100 > 20 || count % 100 < 5 && count % 100 > 1) {
                        return "-mod234n1x";
                    } else {
                        return "-many";
                    }
                },
                text: function (key, count) {
                    var suffix = typeof count === "undefined" ? "" : this._get_suffix(count);
                    var t = "";

                    if (suffix === "" || typeof (t = this._codes[key + suffix]) === "undefined") {
                        if (typeof (t = this._codes[key]) === "undefined") {
                            t = "[js_text." + key + suffix + "]";
                        }
                    }

                    return t;
                }
            };

            var URL = "<{$site.url_part|escape}>";
        </script>
    <{/strip}>

    <link href="<{file 'assets/css/style.css'}>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<{file 'assets/plugins/jquery-3.2.1.min.js'}>"></script>
    <script type="text/javascript" src="<{file 'assets/plugins/jquery.mousewheel.js'}>"></script>
    <script type="text/javascript" src="<{file 'assets/plugins/swiper/swiper.min.js'}>"></script>
    <link href="<{file 'assets/plugins/swiper/swiper.min.css'}>" rel="stylesheet" type="text/css"/>
    <link href="<{file 'assets/plugins/article2/bootstrap.grid.css'}>" rel="stylesheet" />
    <link href="<{file 'assets/plugins/article2/custom-article.css'}>" rel="stylesheet" />
    <script type="text/javascript" src="<{file 'assets/plugins/article2/custom-article.js'}>"></script>
    <link href="<{file 'assets/plugins/photoswipe/css/photoswipe.css'}>" rel="stylesheet">
    <link href="<{file 'assets/plugins/photoswipe/css/photoswipe-default-skin.css'}>" rel="stylesheet">
    <link href="<{file 'assets/plugins/photoswipe/css/photoswipe-style.css'}>" rel="stylesheet">
    <script src="<{file 'assets/plugins/photoswipe/js/photoswipe.min.js'}>"></script>
    <script src="<{file 'assets/plugins/photoswipe/js/photoswipe-ui-default.min.js'}>"></script>
    <script src="<{file 'assets/plugins/photoswipe/js/photoswipe-index.js'}>"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script type="text/javascript" src="<{file 'assets/plugins/bootstrap4/js/bootstrap.min.js'}>"></script>
    <script type="text/javascript" src="<{file 'assets/js/script.js'}>"></script>
    <script type="text/javascript" src="<{file 'assets/plugins/jquery.link-submit.js'}>"></script>

    <{if $is_web_admin}>
        <script type="text/javascript" src="<{file 'assets/js/web-admin.js'}>"></script>
    <{/if}>

    <{custom_code "head_close"}>
<{/block}>

<{block name="body"}>
    <{custom_code "body_open"}>

    <{get_contacts "layout_contacts"}>

    <div class="container">
     <{custom_code "site_header"}>
        <div class="header container">
            <a class="logo" href="<{$site.home_url}>">
                <{if $site.logo.type === 'image'}>
                    <img src="<{$site.logo.image}>" />
                <{else}>
                    <div class="text-logo">
                        <{$site.logo.text|htmlspecialchars}>
                    </div>
                    <style>
                        .text-logo{
                            <{if $site.logo.text_color}>color:<{$site.logo.text_color}>;<{/if}>
                            <{if $site.logo.text_size}>font-size:<{$site.logo.text_size}>pt;<{/if}>
                            <{if $site.logo.text_font}>font-family:'<{$site.logo.text_font|escape}>';<{/if}>  
                        }               
                    </style>
                <{/if}>
            </a>

            <div class="top_menu">
                <{get_menu "top" "top_menu"}>
                
                <div class="slicknav_menu">
                    <a href="#" class="slicknav_btn slicknav_collapsed">
                        <span class="slicknav_icon slicknav_no-text">
                            <span class="slicknav_icon-bar"></span>
                            <span class="slicknav_icon-bar"></span>
                            <span class="slicknav_icon-bar"></span>
                        </span>               
                    </a>            
                </div>
                <{if $top_menu.0|count}>
                    <ul class="header_menu_top">
                        <{foreach $top_menu.0 as $page}>
                            <li class="<{if $page.is_active}> active<{/if}>">
                                <a href="<{$page.href}>" title="<{$page.page_name}>">
                                    <{$page.page_name|htmlspecialchars}>
                                </a>
                            </li>
                        <{/foreach}>
                    </ul>
                <{/if}>
            </div>
            <div class="language-select-form">
                <{if $site.languages|count > 1}>
                    <div class="language-active">
                        <{$site.active_language.name|htmlspecialchars}>
                    </div>
                    <div class="block_language">
                        <{foreach $site.languages as $language}>
                            <a class="<{if $language.language_id == $site.active_language.language_id}> active<{/if}>" href="<{$language.page_url}>">
                                <{$language.name|htmlspecialchars}>
                            </a>
                        <{/foreach}>
                    </div>
                <{/if}>
            </div>
         </div>

        <{block name="module"}>
        <{/block}>

        <{custom_code "footer"}>
<{*
        <footer class="footer">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <{get_menu "bottom" "bottom_menu"}>

                <{if $bottom_menu.0|count}>
                    <ul class="navbar-nav mr-auto">
                        <{foreach $bottom_menu.0 as $page}>
                            <li class="nav-item<{if $page.is_active}> active<{/if}>">
                                <a class="nav-link" href="<{$page.href}>">
                                    <{$page.page_name|htmlspecialchars}>
                                </a>
                            </li>
                        <{/foreach}>
                    </ul>
                <{/if}>
            </nav>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="navbar-brand">
                    <{$site.name|htmlspecialchars}>
                    ©
                    <{$site.date_founded}>
                    -
                    <{0|as_date:"Y"}>
                </div>

                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="http://totalcan.com.ua/" title="Создание сайтов, разработка интернет магазинов, раскрутка сайтов">
                            Создание сайта totalcan.com.ua
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://bravosell.com/ru/" title="Сайт работает на CMS Bravosell">
                            CMS интернет магазина - bravosell
                        </a>
                    </li>
                </ul>
            </nav>

            <{custom_code "counters"}>
        </footer>*}>
        <div class="footer">
            <div class="footer_container">
                <div class="copyright">
                    <p class="copyright_link">
                        <{$site.name|htmlspecialchars}>                   
                    </p>   
                    <p class="copyright_year">
                        © 
                        <span class="year">
                             <{$site.date_founded}> - <{0|as_date:"Y"}>
                        </span>
                    </p>
                </div>
                <div class="who_make">
                    <a class="artweb" href="http://artweb.red/" title="создание сайтов портфолио для фотографов, художников, моделей, дизайнеров и всех творческих людей">
                         Создано на платформе
                     </a>             
                </div>
            </div>
        </div>
    </div>

    <{custom_code "body_close"}>
<{/block}>
