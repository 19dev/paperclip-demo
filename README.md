# size düşen

Şöyle çalışın

    $ git clone git@github.com:seyyah/paperclip-demo.git
    $ cd paperclip-demo/
    $ bundle
    $ rake db:migrate
    $ rails s --binding=1.2.3.4 --port=3001

Test: http://1.2.3.4:3001/articles

# nasıl

Komutlar

    $ rails new paperclip-demo
    $ cd paperclip-demo/

    $ vim Gemfile
    execjs, therubyracer, paperclip
    $ bundle

    $ rails g scaffold article name:string content:string
    $ rake db:migrate

    $ rails g model asset article_id:integer
    $ rails g migration addPaperclipToAssets
    $ vim db/migrate/20120316003123_add_paperclip_to_assets.rb
    Copy-Paste: https://github.com/thoughtbot/paperclip/wiki/Usage
    :%s/users/assets/gce
    :%s/:avatar/:image/gce
    def self.up
      add_column :assets, :image_file_name,    :string
      add_column :assets, :image_content_type, :string
      add_column :assets, :image_file_size,    :integer
      add_column :assets, :image_updated_at,   :datetime
    end

    def self.down
      remove_column :assets, :image_file_name
      remove_column :assets, :image_content_type
      remove_column :assets, :image_file_size
      remove_column :assets, :image_updated_at
    end
    $ rake db:migrate

    $ vim app/models/asset.rb
        belongs_to :form

        has_attached_file :image,
                :style => {
                        :thumb =>  '150x150#',
                        :medium => '300x300>',
                        :large =>  '600x600>'
        }
    $ vim app/models/article.rb
        has_many :assets
	accepts_nested_attributes_for :assets


    $ vim app/views/articles/_form
	<%= form_for @article, :html => { :multipart => true } do |f| %>

	<div class="paperclipStuff">
	<%= f.fields_for :assets do |asset| %>
	<%= asset.file_field :image %>
	<% end %>
	</div>
    $ vim app/controllers/articles.rb
	2.times { @article.assets.build }

    $ vim ...

# kaynak

- http://www.emersonlackey.com/article/paperclip-with-rails-3
- http://emersonlackey.com/screencasts/rails-3-with-paperclip.mov
- https://github.com/Emerson/Multiple-File-Uploads-with-Paperclip-and-Rails-3

Diğer,

- http://www.emersonlackey.com/article/rails-paperclip-multiple-file-uploads
- http://www.emersonlackey.com/screencasts/multiple-file-uploads-960x540.mov
