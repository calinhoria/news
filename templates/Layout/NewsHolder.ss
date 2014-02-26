<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/masonry/3.1.2/masonry.pkgd.js"></script>
<script>
	jQuery(document).ready(function($) {
		jQuery('#news_list').masonry({

			itemSelector : '.news_list_item',
			"gutter" : 0
		});
		if (jQuery(".next").attr("url") == "") {
			jQuery(".pagination").remove();

		}
		jQuery(".next").click(function() {
			jQuery.ajax({
				url : jQuery(this).attr("url")
			}).done(function(newdata) {
				if (jQuery(".next").find(".next").attr("url") != "") {
					jQuery(".next").attr("url", jQuery(newdata).find(".next").attr("url"));
					jQuery(".remains span").text(jQuery(newdata).find(".remains span").text());
					var el = jQuery(newdata).find(".news_list_item");

					jQuery("#news_list").append(el).masonry('appended', el);

					if (jQuery(".next").attr("url") == "") {
						jQuery(".pagination").remove();

					}
				};

			});

		});
	});

</script>
</div>

<div class="filters">
    <div class="inner">

        <a class="$Level(1).LinkingMode" href="$Level(1).Link" > <% if $Level(1).LinkingMode=current  %> <span class="arrow_down"></span> <% end_if %> <% _t("ALL","Tutte") %> </a>
        <% loop Level(1).Children %>
        <a class="$LinkingMode" href="$Link" class="filter_title"><% if LinkingMode=current  %> <span class="arrow_down"></span> <% end_if %>$Title</a>
        <% end_loop %>
    </div>
</div>
<div class="inner typography">
    <div id="Layout" class="clearfix typography">
        <div id='news_list'>
            <% loop NewsList %>
            <div class="news_list_item clearfix">
                <a href="$Link"> <% with Thumbnail %>
                <% with SetWidth(193) %> <img src="$URL" style="display: block;width: {$Width}px;height:{$Height}px;border:0 " width="$Width" height="$Height" /> <% end_with %>
                <% end_with %> <h2 class="news_title">$Title</h2></a>
                <br />
                <br />
                <div class="news_date">
                    $Created.format(d) $Created.format(M), $Created.Year<a href="$Link" >$Top.DetailsLabel</a>
                    <div style="clear: both" ></div>
                </div>
                <a href="$Link">
                <div class="read_more">
                    <% _t("READ_MORE","Read more") %><span>></span>
                </div> </a>
            </div>
            <% end_loop %>
            <br  style="clear: both"/>

        </div>
        <br />
        <div class="pagination">
            <% if $NewsList.MoreThanOnePage %>
            <% if $NewsList.NotFirstPage %>
            <a class="prev" href="$NewsList.PrevLink">< <span><% _t("PREV","Previous") %> </span></a>
            <% end_if %>
            <% loop $NewsList.Pages %>
            <% if $CurrentBool %>
            <a class="current">$PageNum</a>
            <% else %>
            <% if $Link %>
            <a href="$Link">$PageNum</a>
            <% else %>
            <a>...</a>
            <% end_if %>
            <% end_if %>
            <% end_loop %>
            <% if $NewsList.NotLastPage %>
            <a class="next" href="$NewsList.NextLink"><span><% _t("NEXT","Next") %></span> ></a>
            <% end_if %>
            <% end_if %>
        </div>
    </div>
    <style>
        .news_item {
            min-height: 370px;
        }
        .pagination {

            text-align: right;
        }
        .pagination a {
            padding-left: 6px;
            padding-right: 6px;
            line-height: 17px;
            border: 1px solid #747474;
            font-family: PT Sans;
            font-size: 10px;
            font-style: italic;
            display: inline-block;
            text-align: center;
            color: #747474;
        }
        .pagination a span {
            font-family: Calibri;
            font-size: 15px;
            color: #747474;
        }
        .pagination a.current, .pagination a:hover {
            background-color: #f00;
            color: #fff;
            text-decoration: none;
            border-bottom: 1px solid #747474;
        }
        .pagination a span:hover {
            color: #fff;
        }
        .pagination .prev, .pagination .prev:hover {
            border: 0;
        }
        .pagination .next, .pagination .next:hover {
            border: 0;
        }
        .pagination {
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            line-height: 40px;
        }
    </style>
