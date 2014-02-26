<?php
class NewsPage extends Page
{
    static $icon = 'news/images/article.png';
    static $has_one = array('Thumbnail' => 'Image');
    static $can_be_root = false;
    private static $allowed_children = "none";
    private static $defaults = array("ShowInMenus" => 0, );
    function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields -> addFieldToTab('Root.Main', new UploadField("Thumbnail", "Set article image"));
        return $fields;
    }

}

class NewsPage_Controller extends Page_Controller
{

}
