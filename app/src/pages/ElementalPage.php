<?php

namespace app\pages;


class ElementalPage extends \Page
{

    private static $singular_name = 'Modulare Seite';
    private static $plural_name = 'Modulare Seiten';
    private static $cms_icon_class = 'font-icon-p-articles';

    private static $table_name = 'app_ElementalPage';

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        return $fields;
    }
}