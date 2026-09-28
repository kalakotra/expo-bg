<?php

namespace app\controller;

use app\model\ContactSubmission;
use SilverStripe\Control\Email\Email;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\EmailField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\OptionsetField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\Validation\RequiredFieldsValidator;
use SilverStripe\ORM\FieldType\DBField;

class ContactPageController extends \PageController
{
    private static $allowed_actions = [
        'ContactForm'
    ];

    public function ContactForm()
    {
        $fields = FieldList::create(
            TextField::create('Subject', '')->setAttribute('placeholder', _t('ContactPage.Subject', 'Betreff'). ' *')->addExtraClass('subject-field'),
            DropdownField::create('IWant', _t('ContactPage.IWant', 'Ich möchte ....'), [
                //'Contact' => _t('ContactPage.Contact', 'Einfach in Kontakt treten'),
                //'Support' => _t('ContactPage.Support', 'Support kontaktieren'),
                //'Feedback' => _t('ContactPage.Feedback', 'Feedback geben')
            ])->setEmptyString(_t('ContactPage.Contact', 'Einfach in Kontakt treten')),
            TextField::create('Firstname', '')->setAttribute('placeholder', _t('ContactPage.Firstname', 'Vorname'). ' *'),
            TextField::create('Lastname', '')->setAttribute('placeholder', _t('ContactPage.Lastname', 'Nachname'). ' *'),
            TextField::create('Company', '')->setAttribute('placeholder', _t('ContactPage.Company', 'Firmenname / Institution'). ' *'),
            TextField::create('Phone', '')->setAttribute('placeholder', _t('ContactPage.Phone', 'Telefon'). ' *'),
            EmailField::create('Email', '')->setAttribute('placeholder', _t('ContactPage.Email', 'E-Mail'). ' *'),
            OptionsetField::create('ContactMethod', _t('ContactPage.ContactMethod', 'Bitte kontaktieren Sie mich'), [
                'Phone' => _t('ContactPage.ContactMethodPhone', 'telefonisch'),
                'Email' => _t('ContactPage.ContactMethodEmail', 'per E-Mail'),
            ]),
            TextareaField::create('Message', _t('ContactPage.Message', 'Meine Nachricht'))
        );

        $actions = FieldList::create(
            FormAction::create('doSubmit', _t('ContactPage.Submit', 'Nachricht senden'))->setUseButtonTag(true)->addExtraClass('btn btn-dark btn-arrow')
        );

        $validator = RequiredFieldsValidator::create('Firstname', 'Lastname', 'Company', 'Phone', 'Email', 'ContactMethod', 'Message');

        $form = Form::create($this, 'ContactForm', $fields, $actions, $validator);

        $form->setTemplate('ContactForm');
        return $form;
    }

    public function doSubmit($data, $form)
    {
        if ($data["Subject"] != "") {
            $this->redirect("home/");
        } else {
            $submission = ContactSubmission::create();
            $form->saveInto($submission);

            // change wen we have more options in the future !!!
            $submission->IWant = 'Einfach in Kontakt treten';

            $submission->write();

            $email = Email::create();
            $email->setTo($this->FormEmail);
            $email->setReplyTo($data["Email"]);
            //$email->setBcc("kalakotra@gmail.com");
            $email->setBcc("office@seeyou.at");
            $email->setSubject("Kontaktformular (S)"); 

            $myBody = "
                <p><strong>Ich möchte:</strong>Einfach in Kontakt treten</p>
                <p><strong>Vorname:</strong> {$submission->Firstname}</p> 
                <p><strong>Nachname:</strong> {$submission->Lastname}</p> 
                <p><strong>Firma:</strong> {$submission->Company}</p> 
                <p><strong>Telefon:</strong> {$submission->Phone}</p> 
                <p><strong>Email:</strong> {$submission->Email}</p> 
            ";

            if (isset($data['ContactMethod'])) {
                $myBody .= "<p><strong>Bitte kontaktieren Sie mich:</strong> {$data['ContactMethod']}</p>";
            }

            if (isset($data['Nachricht'])) {
                $myBody .= "<p><strong>Nachricht:</strong> {$data['Nachricht']}</p>";
            }

            $email->setBody($myBody);

            $email->setReturnPath('noreply@expoaustria.at');
            $email->getHeaders()->addTextHeader('X-Mailer', 'PHP/' . phpversion());

            //$email->send();

            $noreply = 'noreply@expoaustria.at';
            $headers = array(
                'From' => $noreply,
                'Reply-To' => $noreply,
                'Cc' => 'office@seeyou.at',
                'Content-type' => 'text/html',
                'charset' => 'UTF-8',
                'X-Mailer' => 'PHP/' . phpversion()
            );
            $force = '-f ' . $noreply;
            $t = $this->FormEmail;
            //$t = "kalakotra@gmail.com";
            @mail($t, "Kontaktformular", $myBody, $headers, $force);

            $myData = [
                'Content' => DBField::create_field("HTMLText", $this->TextAfterSubmit),
                'ContactForm' => ''
            ];

            return $myData;
        }
    }
}