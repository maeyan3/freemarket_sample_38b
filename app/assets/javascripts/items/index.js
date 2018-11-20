$(document).on('turbolinks:load', () => {
  console.log('hello')
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:4500,
    dots:true,
    prevArrow:'<img src="images/carousel-prev.png" class="slide-arrow slick-prev slick-left-arrow">',
    nextArrow:'<img src="images/carousel-next.png" class="slide-arrow slick-next slick-right-arrow">'
  });
});
