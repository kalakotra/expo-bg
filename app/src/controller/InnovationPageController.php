<?php

namespace app\controller;

use app\model\Innovation;
use app\model\InnovationCategory;
use SilverStripe\Assets\Folder;
use SilverStripe\Assets\Image;
use SilverStripe\Assets\Upload;
use SilverStripe\Core\Config\Config;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\EmailField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FileField;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\OptionsetField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\Validation\RequiredFieldsValidator;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\Versioned\Versioned;

class InnovationPageController extends \PageController {
    private static $allowed_actions = [
        'InnovationForm',
        'innovationDetails',
    ];

    private static $url_handlers = [
        '-/$innovationurl!/$innovationid!' => 'innovationDetails'
    ];

    public function InnovationForm()
    {
        $dbFields = Config::inst()->get(Innovation::class, 'db');
        unset($dbFields['Visible'], $dbFields['URLSegment']);

        $dbFields = $this->array_insert_at_key($dbFields, 'Product', ['Subject' => 'Varchar'], false);

        $dbFields = $this->array_insert_at_key($dbFields, 'Product', ['InnovationCategory' => 'Varchar'], false);

        $form_required = Config::inst()->get(Innovation::class, 'form_required');

        $field_labels = Config::inst()->get(Innovation::class, 'field_labels');

        $fields = $this->scaffoldFormFields($dbFields, $form_required, $field_labels, true);

        // replace InnovationCategory with dropdown field
        $fields->replaceField('InnovationCategory', DropdownField::create('InnovationCategory', 'Kategorie', InnovationCategory::get()->map('ID', 'Title'))->setEmptyString(_t('InnovationPage.DropdownEmpty', 'Bitte wählen')));
        
        $fields->push(FileField::create("VisuelleDarstellung[]", "")->setAttribute("multiple", true)->addExtraClass("form-control rounded-3"));

        $fields->push(FileField::create("Video", "")->addExtraClass("form-control rounded-3"));

        $fields->push(FileField::create("Logo", "")->addExtraClass("form-control rounded-3"));

        $teilnahmeText = '
            <p class="small pt-4">
                * Mit der Einreichung versichert der Teilnehmer, Inhaber aller Rechte, insbesondere aller Urheber-, Nutzungs- und Leistungsschutzrechte an den eingereichten Bewerbungsdaten zu sein. Soweit der Teilnehmer nicht Urheber der Bewerbungsdaten ist, sichert er die Inhaberschaft des alleinigen und uneingeschränkten Nutzungsrechts hieran zu.
            </p>
            <p class="small pt-1">
                * Er versichert die Inhaberschaft uneingeschränkter Verwertungsrechte, dass die eingereichten Bewerbungsdaten frei von Rechten Dritter sind sowie dass bei der Darstellung von Personen keine Persönlichkeitsrechte verletzt worden sind.
            </p>
            <p class="small pt-1">
                * Im Falle der Auswahl erklären Sie sich damit einverstanden, dass Sie und Ihr Unternehmen bzw. Ihre Institution sowie Ihre Innovation in der Öffentlichkeit genannt und dargestellt werden. Der Rechtsweg ist ausgeschlossen.
            </p>
            <p class="small pt-1">
                * Es gelten die Datenschutzrichtlinien der WKÖ.
            </p>
        ';

        $fields->push(
            LiteralField::create(
                "Teilnahmebedienungen", 
                _t("InnovationPage.ContactFormTeilnahmebedienungen", DBField::create_field('HTMLText', $teilnahmeText))
                )
            );
        

        $actions = FieldList::create(
            FormAction::create('doSubmit', _t('InnovationPage.Submit', 'Senden'))->setUseButtonTag(true)->addExtraClass('btn btn-dark btn-arrow')
        );
        
        $form_required[] = 'Teilnahmebedienungen';
        $form_required[] = 'Logo';

        $validator = RequiredFieldsValidator::create($form_required);

        $form = Form::create($this, 'InnovationForm', $fields, $actions, $validator);

        $form->setTemplate('InnovationForm');
        return $form;
    }

    public function doSubmit($data, $form)
    {
        if ($data["Subject"] != "") {
            $this->redirect("home/");
        } else {
            $newInnovation = Innovation::create();
            $form->saveInto($newInnovation);
            $newInnovation->write();

            $myFolderPath = '/Uploads/innovation/'. strtolower(str_replace(["@", "."], ["_at_", "-"], $data["Email"]) ) .'/'.time();  
            // if (!file_exists(ASSETS_PATH . $myFolderPath)) {
            //     mkdir(ASSETS_PATH . $myFolderPath, 0775, true);
            // }
            
            // move video & logo files to the designated folder
            $myFolder = Folder::find_or_make($myFolderPath);
            
            if ($newInnovation->LogoID != 0) {
                $logo = $newInnovation->Logo();
                $logo->ParentID = $myFolder->ID;
                $logo->write();

                Versioned::withVersionedMode(function () use ($logo) {
                    Versioned::set_reading_mode('Stage.' . Versioned::DRAFT);
                    $logo->write();
                    $logo->publishSingle();
                });
            }

            if ($newInnovation->VideoID != 0) {
                $video = $newInnovation->Video();
                $video->ParentID = $myFolder->ID;
                $video->write();
                Versioned::withVersionedMode(function () use ($video) {
                    Versioned::set_reading_mode('Stage.' . Versioned::DRAFT);
                    $video->write();
                    $video->publishSingle();
                });
            }

            if (isset($data["VisuelleDarstellung"]) && $data["VisuelleDarstellung"]["name"][0] != "") {                   
                $myFiles = $data["VisuelleDarstellung"];
                foreach ($myFiles["name"] as $key => $value) {
                    $file = Image::create();
                    $file->ParentID = $myFolder->ID;
                    $upload = Upload::create();

                    //loadIntoFile(array $tmpFile, AssetContainer $file = null, string|bool $folderPath = false)
                    $what = [
                        ' ',
                        ','
                    ];
                    $actFileName = str_replace($what, "-", $value);
                    $myUploadedFile = [
                        'name' => $actFileName,
                        'full_path' => $myFiles["full_path"][$key],
                        'type' => $myFiles["type"][$key],
                        'tmp_name' => $myFiles["tmp_name"][$key],
                        'error' => $myFiles["error"][$key],
                        'size' => $myFiles["size"][$key]
                    ];
                    $upload->loadIntoFile($myUploadedFile, $file, $myFolderPath);

                    $newInnovation->Images()->add($file);
                }

                $newInnovation->write();
            }

            return [
                'Content' => DBField::create_field('HTMLText', $this->TextAfterSubmission),
                'InnovationForm' => false
            ];
        }
    }

    public function innovationDetails() {
        return $this->customise([
            'Innovation' => $this->getInnovation()
        ])->renderWith(['app/pages/InnovationDetails', 'Page']);
    }

    public function getInnovation() {
        $urlSegment = $this->request->param('innovationurl');
        $innovationId = $this->request->param('innovationid');
        $innovation = Innovation::get()->byID($innovationId);
        if ($innovation && $innovation->URLSegment === $urlSegment) {
            return $innovation;
        }
        return null;
    }
}