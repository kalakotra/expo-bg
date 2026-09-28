<?php

use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\AssetAdmin\Forms\UploadField;

class SocialLink extends DataObject {

    private static $default_sort = "Sort";
    
    private static $db = [
        'Title' => 'Varchar',
        'Link' => 'Varchar',
        'Sort' => 'Int'
    ];

    private static $has_one = [
        'Icon' => Image::class
    ];

    private static $owns = [
        'Icon'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName("Sort");

        $fields->addFieldToTab("Root.Main", $myUpload = UploadField::create("Icon"));

        $myUpload->setFolderName("Uploads/icons");

        return $fields;
    }

}