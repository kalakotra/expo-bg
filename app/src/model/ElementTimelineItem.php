<?php 

namespace app\model;

use app\element\ElementTimeline;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;

class ElementTimelineItem extends DataObject
{
    private static $table_name = 'app_ElementTimelineItem';

    private static $singular_name = 'Zeitleisten Eintrag';
    private static $plural_name = 'Zeitleisten Einträge';

    private static $default_sort = 'SortOrder ASC';

    private static $db = [
        'Year' => 'Varchar(255)',
        'Title' => 'Varchar(255)',
        'Subtitle' => 'Varchar(255)',
        'Description' => 'HTMLText',
        'SortOrder' => 'Int'
    ];

    private static $has_one = [
        'ElementTimeline' => ElementTimeline::class,
        'Image' => Image::class
    ];

    private static array $field_labels = [
        'Year' => 'Jahr',
        'Title' => 'Titel',
        'Subtitle' => 'Untertitel',
        'Description' => 'Beschreibung',
        'Image' => 'Bild'
    ];

    private static $owns = [
        'Image'
    ];

    private static $summary_fields = [
        'Year' => 'Jahr',
        'Title' => 'Titel',
        'Subtitle' => 'Untertitel'
    ];

    private static $translate = [
        'Title',
        'Subtitle',
        'Description'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName('ElementTimelineID');
        $fields->removeByName('SortOrder');

        return $fields;
    }
}