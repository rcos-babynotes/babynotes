var currentPage = 1;

function checkScroll() {
  if (nearBottomOfPage()) {
    currentPage ++;
    $.ajax(window.location.pathname + '.js?page=' + currentPage );
  } else {
    setTimeout("checkScroll()", 250);
  }
}

function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(argument) {
  return $(document).height() - ($(window).height() + $(window).scrollTop());
}