<?php

namespace app\model;

use SilverStripe\ORM\DataObject;

class InnovationCategory extends DataObject {

    private static $table_name = 'app_InnovationCategory';

    private static $default_sort = 'Sort';

    private static $plural_name = 'Kategorien';
    private static $singular_name = 'Kategorie';

    private static $db = [
        'Title' => 'Varchar',
        'Sort' => 'Int'
    ];

    private static $translate = [
        'Title'
    ];


    private static $summary_fields = [
        'Title'
    ];

    private static $has_one = [
    ];

    private static $owns = [
    ];

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->removeByName("Sort");

        return $fields;
    }
}
