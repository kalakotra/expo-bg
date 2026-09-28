<?php


use SilverStripe\TinyMCE\TinyMCEConfig;

$formats = [
    
    [
        'title' => 'Verschiedenes',
        'items' => [
            [
                'title' => 'Button',
                'block' => 'a',
                'classes' => 'btn btn-dark btn-arrow'
            ],
            [
                'title' => 'Font Trois',
                'selector' => '*',
                'classes' => 'font-trois'
            ],
        ]
        ],
    [
        'title' => 'Überschriften',
        'items' => [
            [
                'title' => 'Überschrift 1',
                'selector' => '*',
                'classes' => 'h1'
            ],
            [
                'title' => 'Überschrift 2',
                'selector' => '*',
                'classes' => 'h2'
            ],
            [
                'title' => 'Überschrift 3',
                'selector' => '*',
                'classes' => 'h3'
            ],
            [
                'title' => 'Überschrift 4',
                'selector' => '*',
                'classes' => 'h4'
            ],
            [
                'title' => 'Überschrift 5',
                'selector' => '*',
                'classes' => 'h5'
            ],
            [
                'title' => 'Überschrift 6',
                'selector' => '*',
                'classes' => 'h6'
            ],
        ]
    ],
];

TinyMCEConfig::get('cms')
	->setOptions([
        'importcss_append' => true,
        'importcss_selector_filter' => 'abc123',
        'style_formats' => $formats,
        'block_formats' => 'Paragraph=p;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5;Heading 6=h6;'
    ])
    ->enablePlugins(['media', 'searchreplace', 'fullscreen'])
    ->addButtonsToLine(1, 'styleselect')
    ->setButtonsForLine(2, 'blocks', 'styles', '|', 'cut', 'copy', 'paste', 'pastetext', '|', 'searchreplace', '|', 'ssmedia', 'ssembed', 'sslink', 'unlink', 'anchor', '|', 'charmap', '|', 'code', 'fullscreen')->removeButtons('alignright', 'alignjustify');
