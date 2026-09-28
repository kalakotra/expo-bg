<?php

namespace app\pages;

use app\controller\ContactPageController;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\TextField;

class ContactPage extends \Page
{
    private static $singular_name = 'Kontaktseite';
    private static $plural_name = 'Kontaktseiten';
    private static $cms_icon_class = 'font-icon-p-mail';

    private static $table_name = 'app_ContactPage';

    private static $controller_name = ContactPageController::class;

    private static array $db = [
        'FormEmail' => 'Varchar',
        'TextAfterSubmit' => 'HTMLText'
    ];


    private static array $field_labels = [
        'FormEmail' => 'E-Mail-Adresse für Kontaktformular',
        'TextAfterSubmit' => 'Text nach dem Absenden des Formulars'
    ];

    private static $translate = [
        'TextAfterSubmit'
    ];

    public function getCMSFields() {

        $this->beforeUpdateCMSFields(function($fields) {
            $fields->addFieldsToTab("Root.Form", [
                TextField::create("FormEmail", $this->fieldLabel('FormEmail')),
                HTMLEditorField::create("TextAfterSubmit", $this->fieldLabel('TextAfterSubmit'))->addExtraClass("stacked")
            ]);
        });

        $fields = parent::getCMSFields();

        return $fields;
    }
}