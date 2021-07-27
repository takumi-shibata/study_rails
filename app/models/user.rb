class User < ApplicationRecord
    validates :name, {presence: true, length:{maximum: 10}} # 空でなければパスする&文字は最大10文字まで
    validates :email, {presence: true, uniqueness: true} # 空でなければパスする&同じカラムのメールアドレスは保存されない
end
