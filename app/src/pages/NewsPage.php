<?php

namespace app\pages;

use app\pages\PressPage;

class NewsPage extends PressPage
{

    private static $singular_name = 'News';
    private static $plural_name = 'Newsseiten';
    private static $cms_icon_class = 'font-icon-p-news-item';

    private static $table_name = 'app_NewsPage';

    private static $default_sort = 'PressDate DESC';

}