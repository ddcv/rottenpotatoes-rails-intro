module ApplicationHelper
  def movie_header_class
	if session[:sorter] == "title"
		'hilite'
	else
		''
	end
  end

  def rd_header_class
	if session[:sorter] == "release_date"
		'hilite'
	else
		''
	end
  end
end
