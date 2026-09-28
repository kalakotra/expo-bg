<?php

namespace app\pages;

use app\model\CooperationType;
use app\pages\ElementalPage;
use SilverStripe\Assets\Image;

class CooperationPage extends ElementalPage
{

    private static $singular_name = 'Kooperations Seite';
    private static $plural_name = 'Kooperations Seiten';
    private static $cms_icon_class = 'font-icon-circle-star';

    private static $table_name = 'app_CooperationPage';

    private static array $db = [
        'CooperationText' => 'HTMLText',
        'CooperationPartnership' => 'Varchar',
        'CooperationSector' => 'Varchar',
        'CooperationParner' => 'Varchar',
        'CooperationAddress' => 'Varchar',
        'CooperationWebseite' => 'Varchar',

    ];

    private static array $has_one = [
        'CooperationLogo' => Image::class,
        'CooperationType' => CooperationType::class
    ];

    private static array $owns = [
        'CooperationLogo'
    ];

    private static array $field_labels = [
        'CooperationText' => 'Text',
        'CooperationLogo' => 'Logo',
        'CooperationPartnership' => 'Partnerschaft',
        'CooperationSector' => 'Bereich',
        'CooperationParner' => 'Kooperationspartner',
        'CooperationAddress' => 'Adresse',
        'CooperationWebseite' => 'Webseite',
        'CooperationType' => 'Kooperations Typ'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Kooperation', [
            $fields->dataFieldByName('CooperationTypeID'),
            $fields->dataFieldByName('CooperationLogo'),
            $fields->dataFieldByName('CooperationText')->addExtraClass('stacked'),
            $fields->dataFieldByName('CooperationPartnership'),
            $fields->dataFieldByName('CooperationSector'),
            $fields->dataFieldByName('CooperationParner'),
            $fields->dataFieldByName('CooperationAddress'),
            $fields->dataFieldByName('CooperationWebseite'),
        ]);

        return $fields;
    }
}