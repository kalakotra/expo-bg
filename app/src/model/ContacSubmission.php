<?php

namespace app\model;

use SilverStripe\ORM\DataObject;

class ContactSubmission extends DataObject {

    private static $singular_name = 'Kontaktformular-Eintrag';
    private static $plural_name = 'Kontaktformular-Einträge';

    private static $table_name = 'app_ContactSubmission';

    private static $db = [
        'IWant' => 'Varchar',
        'Firstname' => 'Varchar',
        'Lastname' => 'Varchar',
        'Company' => 'Varchar',
        'Phone' => 'Varchar',
        'Email' => 'Varchar',
        'ContactMethod' => 'Varchar',
        'Message' => 'Text'
    ];

    private static $field_labels = [
        'IWant' => 'Ich möchte ....',
        'Firstname' => 'Vorname',
        'Lastname' => 'Nachname',
        'Company' => 'Firmenname / Institution',
        'Phone' => 'Telefon',
        'Email' => 'E-Mail',
        'ContactMethod' => 'Bitte kontaktieren Sie mich',
        'Message' => 'Meine Nachricht'
    ];

    private static $summary_fields = [
        'IWant' => 'Ich möchte ....',
        'Firstname' => 'Vorname',
        'Lastname' => 'Nachname',
        'Company' => 'Firmenname / Institution',
        'Phone' => 'Telefon',
        'Email' => 'E-Mail',
        'ContactMethod' => 'Bitte kontaktieren Sie mich',
        'Message' => 'Meine Nachricht'
    ];


}