<?php

namespace {

    use SilverStripe\CMS\Model\SiteTree;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\CheckboxField;
    use SilverStripe\Forms\CheckboxSetField;
    use SilverStripe\AssetAdmin\Forms\UploadField;
    use SilverStripe\Assets\Image;
    use SilverStripe\Assets\File;
    use SilverStripe\AssetAdmin\Forms\PreviewImageField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\Forms\GridField\GridField;
    use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
    use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

    class Page extends SiteTree
    {
        private static $db = [
            'ShowInFooter' => 'Boolean',
            'FooterMetamenu' => 'Boolean',

            'PreviewTitle' => 'Varchar',
            'PreviewSubtitle' => 'Varchar',
        ];


        private static $has_one = [
            'HeaderImage' => Image::class,
            'PreviewImage' => Image::class,
        ];

        private static $many_many = [
        ];

        private static $owns = [
            'HeaderImage',
            'PreviewImage',
        ];

        private static $translate = [
        ];

        private static array $field_labels = [
            'ShowInFooter' => 'Im Footer anzeigen',
            'FooterMetamenu' => 'Im Footer Metamenu anzeigen',
            'HeaderImage' => 'Header Image',
            'PreviewTitle' => 'Vorschau Titel',
            'PreviewSubtitle' => 'Vorschau Untertitel',
            'PreviewImage' => 'Vorschau Bild',
        ];

        private static array $scaffold_cms_fields_settings = [
            'includeRelations' => false,
            'ignoreFields' => [
                'ShowInMainMenu',
                'ShowInFooter',
                'FooterMetamenu',
                'PreviewTitle',
                'PreviewSubtitle',
                'PreviewImage',
            ]
        ];

        public function getSettingsFields() {
            $fields = parent::getSettingsFields();

            $fields->addFieldsToTab("Root.Settings", [
                CheckboxField::create("ShowInFooter"),
                CheckboxField::create("FooterMetamenu"),
            ], "ShowInMenus");

            return $fields;
        }

        public function getCMSFields() {

            $this->beforeUpdateCMSFields(function($fields) {
                $fields->addFieldsToTab("Root.Main", [
                    UploadField::create("HeaderImage"),
                ], "Content");

                $fields->addFieldsToTab("Root.Preview", [
                    TextField::create("PreviewTitle"),
                    TextField::create("PreviewSubtitle"),
                    UploadField::create("PreviewImage"),
                ]);
            });
            $fields = parent::getCMSFields();

            

            return $fields;
        }
    }
}
