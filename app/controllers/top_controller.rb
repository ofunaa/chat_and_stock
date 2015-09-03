class TopController < ApplicationController
	def index
		if session[:user_name] == nil
			flash.notice = '名前を入力してください。'
		end
		@new_comment = Comment.new
		@new_middle = Middle.new

		@comments = Comment.all
		@tags = Tag.all
	end
	def create
		@new_comment = Comment.new
		@new_comment.user_name = session[:user_name]
		@new_comment.comment = params[:comment][:comment]
		if @new_comment.save
			redirect_to :root
		else
			redirect_to :root
		end
	end
	def new
		@tag = Tag.new
	end
	def new_tag
		@tag = Tag.new
		@tag.tag_name = params[:tag][:tag_name]
		if @tag.save
			redirect_to :root
		else
			redirect_to :root
		end
	end
	def tag
		@middle = Middle.new
		@middle.tag_id = params[:middle][:tag_id]
		@middle.comment_id = params[:middle][:comment_id]
		if @middle.save
			redirect_to :root
		else
			redirect_to :root
		end
	end
	def tag_delete
		@del_middle = Middle.where(comment_id:params[:comment], tag_id: params[:tag])
		@del_middle[0].destroy
		redirect_to :root
	end

	def users_name
		session[:user_name] = params[:name]
		redirect_to :root
	end

	def takahiro
		if session[:user_name] == nil
			flash.notice = '名前を入力してください。'
		end
		@new_comment = Takahiro.new
		@comments = Takahiro.all
	end
	def takahiro_create
		@new_comment = Takahiro.new
		@new_comment.user_name = session[:user_name]
		@new_comment.comment = params[:takahiro][:comment]
		if @new_comment.save
			redirect_to :takahiro
		else
			redirect_to :root
		end
	end
end
