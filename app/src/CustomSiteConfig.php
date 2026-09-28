<?php

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Core\Extension;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\TextField;
use SilverStripe\LinkField\Form\LinkField;
use SilverStripe\LinkField\Models\Link;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

class CustomSiteConfig extends Extension
{

    private static $db = [
        'FooterText' => 'HTMLText',

        'ShareTitle' => 'Varchar',
        'ShareText' => 'Varchar',

        'TeaserBlockTitle' => 'Varchar'
    ];

    private static $has_one = [
        'ShareImage' => Image::class,
        'DefaultHeaderImage' => Image::class,
        'ContactLink' => Link::class
    ];

    private static $has_many = [

    ];

    private static $many_many = [

    ];

    private static $many_many_extraFields = [

    ];

    private static $owns = [
        'ShareImage',
        'DefaultHeaderImage',
        'ContactLink'
    ];

    private static array $cascade_deletes = [
        'ContactLink'
    ];

    private static $translate = [
        'FooterText',
        'ShareTitle',
        'ShareText',
        'TeaserBlockTitle',
        'ContactLink'
    ];

    public function updateCMSFields(FieldList $fields)
    {
        
        $fields->addFieldsToTab("Root.Main", [
            UploadField::create("DefaultHeaderImage", "Default Header Image"),
            LinkField::create("ContactLink", "Contact Link")
        ]);

        $gridFieldConfig = GridFieldConfig_RecordEditor::create();
        $gridFieldConfig->addComponent(GridFieldOrderableRows::create("Sort"));
        $gridField = GridField::create("SocialLink", "Social Link", SocialLink::get(), $gridFieldConfig);

        $fields->addFieldsToTab("Root.Footer", [
            HTMLEditorField::create("FooterText", "Text")->addExtraClass("stacked"),
            $gridField
        ]);

        // $fields->addFieldsToTab("Root.Share", [
        //     TextField::create("ShareTitle"),
        //     TextField::create("ShareText"),
        //     UploadField::create("ShareImage")
        // ]);

        //parent::updateCMSFields($fields);
    }
}
