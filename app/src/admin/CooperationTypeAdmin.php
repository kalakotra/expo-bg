<?php

namespace app\admin;

use app\model\CooperationType;
use SilverStripe\Admin\ModelAdmin;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

class CooperationTypeAdmin extends ModelAdmin {

    private static $managed_models = [
        CooperationType::class
    ];

    private static $url_segment = 'cooperation-types';

    private static $menu_title = 'Kooperations Typen';

    private static $menu_icon_class = 'font-icon-circle-star';

    // add sort order to the grid field (GridFieldOrderableRows)
    public function getEditForm($id = null, $fields = null)
    {
        $form = parent::getEditForm($id, $fields);

        $gridFieldName = $this->sanitiseClassName($this->modelClass);
        $gridField = $form->Fields()->dataFieldByName($gridFieldName);

        if ($gridField) {
            // Add GridFieldOrderableRows component to enable sorting
            $gridField->getConfig()->addComponent(GridFieldOrderableRows::create('SortOrder'));
        }

        return $form;
    }

}