<?php

namespace app\model;

use app\element\ElementVideos;
use SilverStripe\Assets\File;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;

class VideoItem extends DataObject {
    
    private static $table_name = 'app_VideoItem';

    private static $singular_name = 'Video';
    private static $plural_name = 'Videos';

    private static $default_sort = 'SortOrder ASC';

    private static $db = [
        'Title' => 'Varchar',
        'SortOrder' => 'Int',
    ];

    private static $has_one = [
        'ElementVideos' => ElementVideos::class,
        'Video' => File::class,
        'Poster' => Image::class,
    ];

    private static $owns = [
        'Video',
        'Poster',
    ];

    private static $field_labels = [
        'Title' => 'Titel',
    ];

    private static $summary_fields = [
        'Title' => 'Titel',
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName([
            'ElementVideosID', 
            'SortOrder'
        ]);

        return $fields;
    }
}