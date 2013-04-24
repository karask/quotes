# encoding: utf-8

# get page parameter or return page 1 if not set
def get_page_param page
  if page.nil? || page.empty?
    return 1
  else
    return page.to_i
  end
end
