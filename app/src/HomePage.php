<?php

namespace {

use app\pages\ElementalPage;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
  

    class HomePage extends ElementalPage
    {
        private static $singular_name = 'Startseite';
        private static $plural_name = 'Startseiten';
        private static $cms_icon_class = 'font-icon-p-home';
        private static $db = [
            'HeroTitle' => 'Varchar(255)',
            'HeroSubtitle' => 'Varchar(255)',
            'HeroText' => 'Text',
        ];

        private static $has_one = [
            'HeroImage1' => Image::class,
            'HeroImage2' => Image::class,
            'HeroImage3' => Image::class,
            'HeroImage4' => Image::class,
            'HeroImage5' => Image::class,
        ];

        private static $has_many = [
        ];

        private static $many_many = [
        ];

        private static $many_many_extraFields = [
        ];

        private static $owns = [
            'HeroImage1',
            'HeroImage2',
            'HeroImage3',
            'HeroImage4',
            'HeroImage5',
        ];

        private static $translate = [
            'HeroText',
            'HeroTitle',
            'HeroSubtitle',
        ];


        public function getCMSFields() {

            $this->beforeUpdateCMSFields(function($fields) {
                $fields->addFieldsToTab('Root.Hero', [
                    TextField::create('HeroTitle', 'Hero Title'),
                    TextField::create('HeroSubtitle', 'Hero Subtitle'),
                    TextareaField::create('HeroText', 'Hero Text'),
                    UploadField::create('HeroImage1', 'Hero Image 1'),
                    UploadField::create('HeroImage2', 'Hero Image 2'),
                    UploadField::create('HeroImage3', 'Hero Image 3'),
                    UploadField::create('HeroImage4', 'Hero Image 4'),
                    UploadField::create('HeroImage5', 'Hero Image 5'),
                ]);
            });


            $fields = parent::getCMSFields();

            
            $fields->removeByName('HeaderImage');

            return $fields;
        }

    }
}
