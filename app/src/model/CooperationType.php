<?php

namespace app\model;

use app\pages\CooperationPage;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;

class CooperationType extends DataObject {

    private static $singular_name = 'Kooperations Typ';
    private static $plural_name = 'Kooperations Typen';

    private static $table_name = 'app_CooperationType';

    private static $default_sort = 'SortOrder ASC';

    private static array $db = [
        'Title' => 'Varchar(255)',
        'Description1' => 'HTMLText',
        'Description2' => 'HTMLText',
        'SortOrder' => 'Int'
    ];

    private static array $has_one = [
        'Icon' => Image::class
    ];

    private static $owns = [
        'Icon'
    ];

    private static array $field_labels = [
        'Title' => 'Titel',
        'Description1' => 'Beschreibung 1',
        'Description2' => 'Beschreibung 2',
        'Icon' => 'Icon'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'SortOrder'
        ]);

        return $fields;
    }

    public function getCooperationPages()
    {
        return CooperationPage::get()->filter('CooperationTypeID', $this->ID);
    }
}