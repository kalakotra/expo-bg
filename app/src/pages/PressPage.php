<?php

namespace app\pages;

use app\pages\ElementalPage;

class PressPage extends ElementalPage
{

    private static $singular_name = 'Presse';
    private static $plural_name = 'Presseseiten';
    private static $cms_icon_class = 'font-icon-p-article';

    private static $table_name = 'app_PressPage';

    private static array $db = [
        'PressDate' => 'Date',
    ];

    private static array $field_labels = [
        'PressDate' => 'Datum',
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', $fields->dataFieldByName('PressDate'), 'Content');

        return $fields;
    }
}