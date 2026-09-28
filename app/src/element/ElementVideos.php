<?php

namespace app\element;

use app\model\VideoItem;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

class ElementVideos extends BaseElement {

    private static $table_name = 'app_ElementVideos';

    private static $singular_name = 'Videos';
    private static $plural_name = 'Videos';

    private static $icon = 'font-icon-block-video';

    private static $inline_editable = false;

    private static $has_many = [
        'Videos' => VideoItem::class,
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName('Videos');

        $gridFieldConfig = GridFieldConfig_RecordEditor::create();
        $gridFieldConfig->addComponent(new GridFieldOrderableRows('SortOrder'));
        $gridField = GridField::create('Videos', 'Video', $this->Videos(), $gridFieldConfig);
        $fields->addFieldToTab('Root.Main', $gridField);

        return $fields;
    }

    public function getType()
    {
        return 'Videos';
    }
}