<?php

namespace app\pages;

use app\controller\InnovationPageController;

class InnovationPage extends ElementalPage {
    private static $table_name = 'app_InnovationPage';

    private static $singular_name = 'Innovation Seite';
    private static $plural_name = 'Innovation Seiten';

    private static $controller_name = InnovationPageController::class;

    private static $cms_icon_class = 'font-icon-lamp';

    private static $db = [
        'TextAfterSubmission' => 'HTMLText'
    ];

    private static $field_labels = [
        'TextAfterSubmission' => 'Text nach der Einreichung'
    ];
}