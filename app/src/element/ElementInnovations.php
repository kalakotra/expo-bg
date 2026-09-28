<?php

namespace app\element;

use app\model\Innovation;
use DNADesign\Elemental\Models\BaseElement;

class ElementInnovations extends BaseElement {

    private static $table_name = 'app_ElementInnovations';

    private static $singular_name = 'Innovation Element';
    private static $plural_name = 'Innovation Elements';

    private static $icon = 'font-icon-lamp';

    private static $inline_editable = false;

    public function getInnovations() {
        return Innovation::get()->filter(['Visible' => true]);
    }


}