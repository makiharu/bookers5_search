class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false

   validates :name, presence: true, length: {maximum: 20, minimum: 2}
   validates :introduction, length: { maximum: 50}


 # def self.search(search) #self.でクラスメソッドとしている
  #  if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
   #   User.where(['name LIKE ?', "%#{search}%"])
    #else
     # User.all #全て表示。
    #end
  #end
#end


    def self.search(search)   
        if search  
          where(['name LIKE ?', "%#{search}%"])   
        else  
          all  
        end  
    end  

end

#LIKE句はSQLの検索を行うための演算子
#name LIKEと書くことでnameカラムを検索、という意味

#?は次の引数"%hana%"を受け取る場所になります。最終的にname LIKE "%hana%"という風になるということです。%は任意の文字列を指します。

#nameカラムにxxxxを含むレコードを抽出する、