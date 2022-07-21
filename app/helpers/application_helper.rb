module ApplicationHelper
  def int_to_stars(int)
    # a => quotient - whole stars
    # b => remainder - part stars
    a, b = int.divmod(1)
    c = 5 - (a + b).ceil
    star_filled = '<i class="fa-solid fa-star star"></i>'
    star_half = '<i class="fa-solid fa-star-half-stroke star"></i>'
    star_empty = '<i class="fa-regular fa-star star"></i>'
    html_result = []
    a.times do
      html_result << star_filled
    end
    html_result << star_half unless b.nil? || b.zero?
    c.times do
      html_result << star_empty
    end
    return html_result.join.html_safe
  end
end
