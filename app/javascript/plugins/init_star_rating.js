// app/javascript/plugins/init_star_rating.js
import "jquery-bar-rating";

const initStarRating = () => {
  $('#review_review_experience').barrating({
    theme: 'css-stars'
  });
  $('#review_review_drink').barrating({
    theme: 'css-stars'
  });
  $('#review_review_music').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
