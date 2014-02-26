<?php
	class NewsHolder extends Page
	{
		static $icon = 'news/images/newslist.png';
		static $allowed_children = array(
			"NewsPage",
			"NewsHolder"
		);


	//	static $db = array();
		static $description = "Page for holding news entries";

		function getCMSFields()
		{
			$fields = parent::getCMSFields();
			$fields -> removeByName('Content');
			return $fields;
		}

		private $remaining = 0;
		function NewsList()
		{
			$lenght = 4;

			$pageIDs = $this -> getDescendantIDList();
			$pageIDs[] = $this -> ID;
			$newsList = DataObject::get("NewsPage", "`ParentID` IN (" . implode(",", $pageIDs) . ")");

			$pagingNews = new PaginatedList($newsList, Controller::curr() -> request);
			$pagingNews -> setPageLength($lenght);

			return $pagingNews;
		}

	}

	class NewsHolder_Controller extends Page_Controller
	{
		//	function init() {
		//		parent::init();
		//		Requirements::css('_news/css/pagination.css');
		//	}
	}
