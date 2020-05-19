class SearchsController < ApplicationController
  def search
    #ViewのFormで取得したパラメータをモデルに渡す
    @users = User.search(params[:search][:name])
 

    #Viewのformで取得したパラメータをモデルに渡す
   # if params[:name].presents?
    #  @users = User.search(params[:search])
    #else
     # @users = User.none
      #flash[:notice] = "一致する文字列はありません"
    #end

  end


end

#(params[:search])で検索フォームに入力したものを受け取る