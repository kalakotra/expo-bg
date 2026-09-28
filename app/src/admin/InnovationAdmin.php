<?php

namespace app\admin;

use SilverStripe\Admin\ModelAdmin;
use app\model\InnovationCategory;
use app\model\Innovation; 

class InnovationAdmin extends ModelAdmin {
    
    private static $managed_models = [
        Innovation::class,
        InnovationCategory::class,
    ];

    private static $url_segment = 'innovation';

    private static $menu_title = 'Innovation';

    private static $menu_icon_class = 'font-icon-lamp';

}