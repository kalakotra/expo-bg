<?php

namespace app\element;

use DNADesign\Elemental\Models\ElementContent;
use SilverStripe\Assets\Image;

class ElementTextImage extends ElementContent {

    private static $singular_name = 'Text mit Bild';
    private static $plural_name = 'Text mit Bild';

    private static $table_name = 'app_ElementTextImage';

    private static $icon = 'font-icon-block-promo-3';

    private static $inline_editable = false;

    private static $db = [
        'SwapImageAndText' => 'Boolean',
        'BottomLogo' => 'Boolean'
    ];

    private static $has_one = [
        'Image' => Image::class
    ];

    private static array $field_labels = [
        'SwapImageAndText' => 'Bild und Text tauschen',
        'Image' => 'Bild',
        'BottomLogo' => 'Logo unten anzeigen'
    ];

    private static $owns = [
        'Image'
    ];

    public function getType()
    {
        return 'Text mit Bild';
    }
}