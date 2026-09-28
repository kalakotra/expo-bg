<?php

namespace app\element;

use app\model\CooperationType;
use DNADesign\Elemental\Models\BaseElement;

class ElementCooperation extends BaseElement {

    private static $singular_name = 'Kooperation';
    private static $plural_name = 'Kooperationen';

    private static $table_name = 'app_ElementCooperation';

    private static $icon = 'font-icon-circle-star';

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
        return 'Kooperation';
    }

    public function getCooperationTypes()
    {
        return CooperationType::get();
    }
}