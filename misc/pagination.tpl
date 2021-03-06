
<{if $pagination.total > 1}>
    <ul class="pagination">
        <{if $pagination.page > 4}>
            <li data-page="1" class="pull-left pagination-first page-item">
                <a href="?page=1<{$pagination_fragment}>" aria-label="First" class="page-link">
                    <span aria-hidden="true">
                        1
                    </span>
                </a>
            </li>
        <{/if}>

        <{*if $pagination.page > 10 }>
        <li data-page="<{$pagination.page - 10}>" class="pull-left pagination-first">
        <a href="?page=<{$pagination.page - 10}>" aria-label="Previous">
        <span aria-hidden="true">
        &laquo; -10
        </span>
        </a>
        </li>
        <{else}>
        <li class="disabled pull-left pagination-first">
        <span>
        <span aria-hidden="true">
        &laquo; -10
        </span>
        </span>
        </li>
        <{/if*}>

        <{if $pagination.page > 1 }>
            <li data-page="<{$pagination.page - 1}>" class="pull-left page-item">
                <a href="?page=<{$pagination.page - 1}><{$pagination_fragment}>" aria-label="Previous" class="page-link">
                    <span aria-hidden="true">
                        &laquo;
                    </span>
                </a>
            </li>
            <{*else}>
            <li class="disabled pull-left">
            <span>
            <span aria-hidden="true">
            &laquo;
            </span>
            </span>
            </li*}>
        <{/if}>

        <{for $i=$pagination.page - 3 to $pagination.page + 3}>
            <{if $i > 0 && $i <= $pagination.total}>
                <li data-page="<{$i}>" class="page-item<{if $i == $pagination.page}> active<{/if}>">
                    <a href="?page=<{$i}><{$pagination_fragment}>" class="page-link">
                        <{$i}>
                    </a>
                </li>
            <{/if}>
        <{/for}>

        <{*if $pagination.page <= $pagination.total - 4}>
        <li data-page="<{$pagination.total}>" class="pull-right pagination-last">
        <a href="?page=<{$pagination.total}>" aria-label="Last">
        <span aria-hidden="true">
        <{$pagination.total}>
        </span>
        </a>
        </li>
        <{/if*}>

        <{*if $pagination.page <= $pagination.total - 10}>
        <li data-page="<{$pagination.page + 10}>" class="pull-right pagination-last">
        <a href="?page=<{$pagination.page + 10}>" aria-label="Next +10">
        <span aria-hidden="true">
        +10 &raquo;
        </span>
        </a>
        </li>
        <{else}>
        <li class="disabled pull-right pagination-last">
        <span>
        <span aria-hidden="true">
        +10 &raquo;
        </span>
        </span>
        </li>
        <{/if*}>

        <{if $pagination.page < $pagination.total}>
            <li data-page="<{$pagination.page + 1}>" class="pull-right page-item">
                <a href="?page=<{$pagination.page + 1}><{$pagination_fragment}>" aria-label="Next" class="page-link">
                    <span aria-hidden="true">
                        &raquo;
                    </span>
                </a>
            </li>
            <{*else}>
            <li class="disabled pull-right">
            <span>
            <span aria-hidden="true">
            &raquo;
            </span>
            </span>
            </li*}>
        <{/if}>
    </ul>
<{/if}>
