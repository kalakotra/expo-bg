<?php

namespace app\model;

use app\model\InnovationCategory;
use app\pages\InnovationPage;
use SilverStripe\Assets\File;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\View\Parsers\URLSegmentFilter;

class Innovation extends DataObject {

    private static $table_name = 'app_Innovation';

    private static $default_sort = 'Created DESC';

    private static $plural_name = 'Innovationen';
    private static $singular_name = 'Innovation';

    private static $db = [
        'URLSegment' => 'Varchar',
        'Visible' => 'Boolean',
        'Company' => 'Varchar',
        'Address' => 'Varchar',
        'Zip' => 'Varchar',
        'City' => 'Varchar',
        'Website' => 'Varchar',
        'Salutation' => 'Varchar',
        'Title' => 'Varchar',
        'FirstName' => 'Varchar',
        'LastName' => 'Varchar',
        'Telephone' => 'Varchar',
        'Email' => 'Varchar',
        'Position' => 'Varchar',
        'Product' => 'Varchar',
        'ShortDescription' => 'Text',
        'LongDescription' => 'Text',
        'MarketInfo' => 'Text',
        'DevelopmentInfo' => 'Text',
        'InternationalInfo' => 'Text',
    ];

    private static $translate = [
    ];


    private static $summary_fields = [
        'Company',
        'FirstName',
        'LastName',
        'isVisible' => 'Sichtbar'
    ];

    private static $has_one = [
        'InnovationCategory' => InnovationCategory::class,
        'Video' => File::class,
        'Logo' => Image::class
    ];

    private static $many_many = [
        'Images' => Image::class
    ];

    private static $owns = [
        'Video',
        'Images',
        'Logo'
    ];

    private static $cascade_deletes = [
        'Video',
        'Images',
        'Logo'
    ];

    private static $field_labels = [
        'Visible' => 'Sichtbar',
        'Company' => 'Firmenname / Institution',
        'Address' => 'Straße',
        'Zip' => 'PLZ',
        'City' => 'Ort',
        'Website' => 'Webseite',
        'Salutation' => 'Anrede',
        'Title' => 'Titel',
        'FirstName' => 'Vorname',
        'LastName' => 'Nachname',
        'Telephone' => 'Telefon',
        'Email' => 'E-Mail',
        'Position' => 'Position',
        'Product' => 'Innovation/Produkt',
        'ShortDescription' => 'Kurzbeschreibung der Innovation',
        'LongDescription' => 'Beschreibung des konkreten Nutzens und der Zielgruppe',
        'MarketInfo' => 'Angaben zur Marktreife und bisherigen Anwendung',
        'DevelopmentInfo' => 'Österreich Bezug der Entwicklung',
        'InternationalInfo' => 'Internationale Einsatzmöglichkeiten und Skalierbarkeit',
        'Images' => 'Bilder',
    ];

    private static $form_required = [
        'Company',
        'Address',
        'Zip',
        'City',
        'Website',
        'Salutation',
        'FirstName',
        'LastName',
        'Telephone',
        'Email',
        //'Position',
        'Product',
        'ShortDescription',
        'LongDescription',
        'MarketInfo',
        'DevelopmentInfo',
        'InternationalInfo',
    ];

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        return $fields;
    }

    public function isVisible() {
        if ($this->Visible) {
            return 'Ja';
        }
        return 'Nein';
    }

    public function onBeforeWrite() {
        parent::onBeforeWrite();
        if (!$this->URLSegment) {
            $filter = URLSegmentFilter::create();
            $title = $this->Company;
            $filteredTitle = $filter->filter($title);
            $this->URLSegment = $filteredTitle;
        }
    }

    public function getLink() {
        $innovationPage = InnovationPage::get()->first();
        if ($innovationPage) {
            return $innovationPage->Link('-/' . $this->URLSegment . '/' . $this->ID);
        }
        return null;

    }
}
