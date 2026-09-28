<?php

namespace app\element;

use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Assets\Image;

class ElementFactsCounter extends BaseElement {

    private static $singular_name = 'Faktenzähler';
    private static $plural_name = 'Faktenzähler';

    private static $table_name = 'app_ElementFactsCounter';

    private static $icon = 'font-icon-block-file-list';

    private static $inline_editable = false;

    private static $db = [
        'Title1' => 'Varchar',
        'Value1' => 'Varchar',
        'Title2' => 'Varchar',
        'Value2' => 'Varchar',
        'Title3' => 'Varchar',
        'Value3' => 'Varchar',
    ];

    private static array $has_one = [
        'Icon1' => Image::class,
        'Icon2' => Image::class,
        'Icon3' => Image::class
    ];

    private static array $field_labels = [
        'Title1' => 'Titel 1',
        'Value1' => 'Wert 1',
        'Title2' => 'Titel 2',
        'Value2' => 'Wert 2',
        'Title3' => 'Titel 3',
        'Value3' => 'Wert 3',
        'Icon1' => 'Icon 1',
        'Icon2' => 'Icon 2',
        'Icon3' => 'Icon 3'
    ];

    private static $owns = [
        'Icon1',
        'Icon2',
        'Icon3'
    ];

    public function getType()
    {
        return 'Faktenzähler';
    }
}