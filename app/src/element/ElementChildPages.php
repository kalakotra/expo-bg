<?php

namespace app\element;

use DNADesign\Elemental\Models\BaseElement;

class ElementChildPages extends BaseElement {

    private static $singular_name = 'Unterseiten';
    private static $plural_name = 'Unterseiten';

    private static $table_name = 'app_ElementChildPages';

    private static $icon = 'font-icon-p-articles';

    private static $inline_editable = false;

    private static array $db = [
        
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        return $fields;
    }

    public function getType()
    {
        return 'Unterseiten';
    }

    public function getChildPages()
    {
        return $this->getPage()->Children();
    }
}