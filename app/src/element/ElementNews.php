<?php

namespace app\element;

use app\pages\NewsPage;
use DNADesign\Elemental\Models\BaseElement;

class ElementNews extends BaseElement
{
    private static $singular_name = 'News';
    private static $plural_name = 'News';

    private static $table_name = 'app_ElementNews';

    private static $icon = 'font-icon-p-news-item';

    private static $inline_editable = false;

    private static $db = [
        'ShowShowAllLink' => 'Boolean',
    ];

    private static array $field_labels = [
        'ShowShowAllLink' => '"Alle News anzeigen" Link anzeigen',
    ];

    public function getType()
    {
        return 'News';
    }

    public function getLastNews() {
        return NewsPage::get()->sort('PressDate', 'DESC')->limit(4);
    }
}