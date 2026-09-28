<?php

namespace app\element;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\LinkField\Models\Link;
use SilverStripe\LinkField\Form\LinkField;

class ElementCallToAction extends BaseElement
{
    private static $singular_name = 'Call to Action';
    private static $plural_name = 'Call to Actions';

    private static $table_name = 'app_ElementCallToAction';

    private static $icon = 'font-icon-external-link';

    private static $inline_editable = false;

    private static $db = [
        'Text' => 'HTMLText',
        'DarkTheme' => 'Boolean',
        'Centered' => 'Boolean',
    ];

    private static array $has_one = [
        'Image1' => Image::class,
        'Image2' => Image::class,
        'ElementLink' => Link::class,
        'SeparatorImage' => Image::class,
    ];

    private static array $field_labels = [
        'Title' => 'Titel',
        'Text' => 'Text',
        'Image1' => 'Bild 1',
        'Image2' => 'Bild 2',
        'ElementLink' => 'Link',
        'DarkTheme' => 'Dunkles Theme',
        'Centered' => 'Zentriert',
        'SeparatorImage' => 'Trennbild',
    ];

    private static $owns = [
        'Image1',
        'Image2',
        'ElementLink',
        'SeparatorImage'
    ];

    private static $cascade_deletes = [
        'ElementLink'
    ];

    private static $cascade_duplicates = [
        'ElementLink'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName('ElementLinkID');

        $fields->addFieldsToTab('Root.Main', [
            LinkField::create('ElementLink', $this->fieldLabel('ElementLink'))
        ]);

        $fields->addFieldToTab('Root.Settings', CheckboxField::create('DarkTheme', $this->fieldLabel('DarkTheme')));
        $fields->addFieldToTab('Root.Main', CheckboxField::create('Centered', $this->fieldLabel('Centered')), 'Text');

        return $fields;
    }

    public function getType()
    {
        return 'Call to Action';
    }
}