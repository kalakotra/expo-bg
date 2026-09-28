<?php

namespace app\element;

use Bummzack\SortableFile\Forms\SortableUploadField;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Assets\Image;

class ElementGallery extends BaseElement
{
    private static $singular_name = 'Galerie';
    private static $plural_name = 'Galerien';

    private static $table_name = 'app_ElementGallery';

    private static $icon = 'font-icon-picture';

    private static $inline_editable = false;

    private static $db = [
    ];

    private static array $many_many = [
        'Image' => Image::class,
    ];

    private static $many_many_extraFields = [
        'Image' => [
            'SortOrder' => 'Int',
        ],
    ];

    private static array $field_labels = [
        'Image' => 'Bilder',
    ];

    private static $owns = [
        'Image',
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName('Image');

        $fields->addFieldToTab('Root.Main', SortableUploadField::create(
            'Image',
            'Bilder',
        ));

        return $fields;
    }
}