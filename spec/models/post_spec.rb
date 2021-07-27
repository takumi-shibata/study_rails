require 'rails_helper'

describe 'モデルのテスト', type: :model do
  describe 'バリデーション機能' do

    before do
      @post = FactoryBot.build(:post) # スコープが異なるのでローカル変数ではなくインスタンス変数
    end

    context '投稿がある場合' do
      it '有効である' do
        expect(@post).to be_valid # 有効であること(有効であればパスする)
      end
    end

    context '投稿が空白の場合' do        
      before do
        @post.content = nil # 条件(投稿が空白)
      end

      it '無効でありエラーメッセージが表示される' do
        expect(@post).to be_invalid # 無効であること(無効であればパスする)
        expect(@post.errors.full_messages).to include "Content can't be blank" # エラーメッセージが表示されること
      end
    end

    context '投稿する文字数が10文字の場合' do
      it '有効である' do
        expect(@post).to be_valid # 有効であること(有効であればパスする)
      end
    end

    context '投稿する文字数が10文字を超える場合' do
      before do
        @post.content = "a" * 11 # 条件(投稿が制限を超える文字数)
      end

      it '無効でありエラーメッセージが表示される' do
        expect(@post).to be_invalid # 無効であること(無効であればパスする)
        expect(@post.errors.full_messages).to include "Content is too long (maximum is 10 characters)" # エラーメッセージが表示されること
      end
    end
  end
end
