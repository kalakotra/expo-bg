<?php

namespace {

use SilverStripe\Admin\AdminController;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\GroupedList;
use SilverStripe\View\Requirements;
use SilverStripe\View\SSViewer;

    class PageController extends ContentController
    {
        /**
         * An array of actions that can be accessed via a request. Each array element should be an action name, and the
         * permissions or conditions required to allow the user to access it.
         *
         * <code>
         * [
         *     'action', // anyone can access this action
         *     'action' => true, // same as above
         *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
         *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
         * ];
         * </code>
         *
         * @var array
         */
        private static $allowed_actions = [
            'innovationdetails'
        ];

        protected function init()
        {
            parent::init();
            // You can include any CSS or JS required by your project here.
            // See: https://docs.silverstripe.org/en/developer_guides/templates/requirements/

            if ($this->URLSegment != "Security") {
                $myThemes = SSViewer::get_themes();
                $myThemePath = "themes/".$myThemes[1]."/";

                Requirements::css($myThemePath.'css/scss/bootstrap.scss');

                if ($this instanceof AdminController) {
                    Requirements::css($myThemePath.'css/editor.scss');
                }

                Requirements::backend()->setWriteHeaderComment(false);
                $css = [];

                // animate on scroll plugin
                //$css[] = $myThemePath.'css/aos.css';

                // custom fonts
                $css[] = $myThemePath.'css/all.css';
                // font awesome & google fonts 
                $css[] = $myThemePath.'css/fonts.css';

                

                // hamburger menu
                $css[] = $myThemePath.'css/hamburgers.min.css';

                // fancybox (uncomment js to)
                $css[] = $myThemePath.'css/jquery.fancybox.min.css';

                if ($this->ClassName=="HomePage") {
                    $css[] = $myThemePath.'css/video.css';
                }

                //if ($this->ClassName=="AboutPage" || $this->ClassName=="NewsPage") {
                    $css[] = $myThemePath.'css/slick.css';
                    $css[] = $myThemePath.'css/slick-theme.css';
                //}

                $css[] = $myThemePath.'css/layout.scss';
                $css[] = $myThemePath.'css/navigation.scss';

                Requirements::combine_files('styles.css', $css);
                Requirements::process_combined_files();

                $js = [];
                $js[] = $myThemePath.'javascript/emp.js';
                Requirements::combine_files('emp.js', $js);
                Requirements::process_combined_files();

                $js = [];
                $js[] = $myThemePath.'javascript/empty.js';
                $js[] = $myThemePath.'javascript/jquery-3.6.0.min.js';
                Requirements::combine_files('jquery.js', $js);
                Requirements::process_combined_files();

                $js = [];
                $js[] = $myThemePath.'javascript/bootstrap.bundle.min.js';
                
                // animate on scroll plugin
                $js[] = $myThemePath.'javascript/isotope.pkgd.min.js';
                $js[] = $myThemePath.'javascript/horizontal.js';
                
                // fancybox (uncomment css to)
                $js[] = $myThemePath.'javascript/jquery.fancybox.min.js';

                if ($this->ClassName=="HomePage") {
                    $js[] = $myThemePath.'javascript/video.js';
                }

                //if ($this->ClassName=="AboutPage" || $this->ClassName=="NewsPage") {
                    $js[] = $myThemePath.'javascript/slick.js';
                //}

                $js[] = $myThemePath."javascript/jquery.countTo.js";
                $js[] = $myThemePath."javascript/expo27-textflow.js";
                $js[] = $myThemePath."javascript/expo27-heroflow.js";

                if ($this->ClassName=="EventsPage") {
                    $js[] = $myThemePath."javascript/index.global.min.js";
                    $js[] = $myThemePath."javascript/de.global.js";
                    $js[] = $myThemePath."javascript/en.global.js";
                    if ($this->Locale == "de_DE") {
                        
                    } else {
                        //
                    }
                }

                $js[] = $myThemePath.'javascript/script.js';
                Requirements::combine_files('javascripts.js', $js, ["defer" => true]);
                Requirements::process_combined_files();
            }
        }

        public function shortLocale() {
            $myLocale = $this->Locale;
            $myLocale = explode("_", $myLocale);
            return $myLocale[0];
        }

        public function getMyClass($myClass = "Page") {
            return $myClass::get();
        }

        public function getMetaMenu() {
            return Page::get()->where("FooterMetamenu=1");
        }

        public function scaffoldFormFields(array $fields, array $required = [], array $title = [], $inPlaceholder = false) {
            $fieldList = FieldList::create();
            
            if ($fields && count($fields)) {
                foreach ($fields as $name => $type) {
                    $nameLabel = isset($title[$name]) ? $title[$name] : $name;
                    if (in_array($name, $required)) {
                        $nameLabel .= ' *';
                    }
                    if ($type == 'Text') {
                        $fieldList->push($actField = TextareaField::create($name)->setTitle($nameLabel));
                    } else {
                        $fieldList->push($actField = TextField::create($name)->setTitle($nameLabel));
                    }

                    if ($inPlaceholder) {
                        $actField->setTitle('')->setAttribute('placeholder', $nameLabel);
                    }

                    if ($name == 'Subject') {
                        $actField->addExtraClass('subject-field');
                    }
                }
            }

            return $fieldList;
        }

        function array_insert_at_key(array $array, string $targetKey, array $newEntry, bool $after = true): array 
        {
            $keys = array_keys($array);
            $pos = array_search($targetKey, $keys, true);

            if ($pos === false) {
                // Ako ciljani ključ ne postoji, dodaj na kraj
                return $array + $newEntry;
            }

            // Ako ide poslije ključa, pomakni indeks za 1
            $offset = $after ? $pos + 1 : $pos;

            return array_slice($array, 0, $offset, true) 
                + $newEntry 
                + array_slice($array, $offset, null, true);
        }

        
    }
}
