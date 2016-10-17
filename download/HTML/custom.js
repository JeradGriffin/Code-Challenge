$( document ).ready(function() {
    $(".imageLogo").attr("src","../assets/TribridgeLogo.png");
    $(".avatar a img#ctl00_header_headerFixed_imgAvatar").attr("src","../assets/nav-btn-avatar.png");
    // $(".user-interaction a span").css('background-image', 'url("../assets/nav-btn-settings.png")');
    $("div.tools span#search").after('<img class="btn-search-grey hand" src="../Assets/btn-search-grey.png" />');

    $("ul.user-interaction").append('<li class="avatar"><a href="#"><img class="hand" src="../Assets/nav-btn-cart.png" /></a></li>');
    $("div#content").addClass("container");

    $(".CsLinkButton img").attr("src", "../Assets/btn-search.png");

    $('#ctl00_ContentPlaceHolder1_widgetLayout_rptWidgets_ctl02_widgetContainer_ctl00_txtSearch').attr('value', 'Search by Keywords')
    $("#ctl00_ContentPlaceHolder1_widgetLayout_rptWidgets_ctl02_widgetContainer_ctl00_pnlSearch").before('<h1>Search</h1>');
});
