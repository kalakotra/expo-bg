<?php

namespace app\element;

use app\model\ElementTimelineItem;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;


// use german titles
class ElementTimeline extends BaseElement
{
    private static $singular_name = 'Zeitleiste';
    private static $plural_name = 'Zeitleisten';

    private static $table_name = 'app_ElementTimeline';

    private static $icon = 'font-icon-calendar';

    private static $inline_editable = false;

    private static $db = [
        'Subtitle' => 'Varchar',
    ];

    private static array $field_labels = [
        'Subtitle' => 'Untertitel',
    ];

    private static $has_many = [
        'Items' => ElementTimelineItem::class,
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName('Items');

        $gridFieldConfig = GridFieldConfig_RecordEditor::create();
        $gridFieldConfig->addComponent(new GridFieldOrderableRows('SortOrder'));
        $gridField = GridField::create('Items', 'Zeitleisten Einträge', $this->Items(), $gridFieldConfig);
        $fields->addFieldToTab('Root.Main', $gridField);

        return $fields;
    }

    public function getType()
    {
        return 'Timeline';
    }
}