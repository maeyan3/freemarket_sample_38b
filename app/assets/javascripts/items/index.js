$(document).on('turbolinks:load', () => {
  console.log('hello')
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:4500,
    dots:true,
    prevArrow:'<img src="assets/carousel-prev.png" class="slide-arrow slick-prev slick-left-arrow">',
    nextArrow:'<img src="assets/carousel-next.png" class="slide-arrow slick-next slick-right-arrow">'
  });
});
