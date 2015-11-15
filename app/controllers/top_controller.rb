class TopController < ApplicationController

	def all
		@pages = Page.all
		@new_page = Page.new
	end

	def all_post
		@new_page = Page.new
		@new_page.page_name = params[:page][:page_name]
		@new_page.takahiro_flag = params[:page][:takahiro_flag]
		@new_page.save
		redirect_to :all
	end

	def all_delete
		deletePage = Page.find_by_id(params[:id])
		deletePage.destroy
		redirect_to :all
	end

	def index
		if session[:user_name] == nil
			flash.notice = '名前を入力してください。'
		end
		@new_comment = Comment.new
		@new_middle = Middle.new
		unless @page = Page.find_by(id: params[:page])
			redirect_to :action => :all
		end

		@comments = Comment.where(page: params[:page])
		@tags = Tag.where(page: params[:page])
	end

	def create
		@new_comment = Comment.new
		@new_comment.user_name = session[:user_name]
		@new_comment.comment = params[:comment][:comment]
		@new_comment.page = params[:page]
		if @new_comment.save
			redirect_to :back 
		else
			redirect_to :back
		end
	end

	def new
		@tag = Tag.new
		@all_tag = Tag.where(page: params[:page])
		@page = Page.find_by_id(params[:page])
		@back_url = params[:page]
	end

	def new_tag
		@tag = Tag.new
		@tag.tag_name = params[:tag][:tag_name]
		@tag.page = params[:page]
		if @tag.save
			redirect_to :back
		else
			redirect_to :back
		end
	end

	def tag
		@middle = Middle.new
		@middle.tag_id = params[:middle][:tag_id]
		@middle.comment_id = params[:middle][:comment_id]

		added_comments = Middle.where(comment_id: params[:middle][:comment_id])
		unless added_comments.count == 0
			added_comments.each do |comment|
				unless comment.tag_id.round == params[:middle][:tag_id].to_i.round
					@middle.save
				end
			end
		else
			@middle.save
		end

		redirect_to :back
		
	end
	def tag_delete
		@del_middle = Middle.where(comment_id:params[:comment], tag_id: params[:tag])
		@del_middle[0].destroy
		redirect_to :back
	end

	def users_name
		session[:user_name] = params[:name]
		redirect_to :back
	end

	def takahiro
		if session[:user_name] == nil
			flash.notice = '名前を入力してください。'
		end
		@page = Page.find_by_id(params[:page])
		@new_comment = Takahiro.new
		@comments = Takahiro.where(page: params[:page])
	end
	def takahiro_create
		@new_comment = Takahiro.new
		@new_comment.user_name = session[:user_name]
		@new_comment.comment = params[:takahiro][:comment]
		@new_comment.page = params[:page]
		if @new_comment.save
			redirect_to :back
		else
			redirect_to :back
		end
	end
end
