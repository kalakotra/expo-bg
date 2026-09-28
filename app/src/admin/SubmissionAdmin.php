<?php

namespace app\admin;

use app\model\ContactSubmission;
use SilverStripe\Admin\ModelAdmin;

class SubmissionAdmin extends ModelAdmin
{
    private static $managed_models = [
        ContactSubmission::class
    ];

    private static $url_segment = 'submissions';

    private static $menu_title = 'Kontaktformular-Einträge';

    private static $menu_icon_class = 'font-icon-p-mail';
}