$(function () {
  $(".accordion-parent .accordion-toggle").click(function () {
    $(this).next("ul").slideToggle(400);
    $(this).toggleClass("open");
  });
});
